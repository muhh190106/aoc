.text
.globl _start

_start:
    la   s0, frame_buffer    # s0 = Origem (Endereço da imagem na RAM)
    la   s1, frame_end       # s1 = Final da imagem (para saber quando parar)
    li   s2, 0x10c           # s2 = Destino (Endereço do VGA na FPGA)

render_loop:
    bge  s0, s1, end         # Se (Origem >= Final), terminamos a cópia

    lb   t0, 0(s0)           # Lê 1 byte da imagem na RAM (cor do pixel)
    sb   t0, 0(s2)           # Escreve esse byte no endereço do VGA

    addi s0, s0, 1           # Avança para o próximo pixel na RAM
    addi s2, s2, 1           # Avança para a próxima posição no VGA
    j    render_loop         # Repete

end:
    j end                    # Loop infinito ao terminar

.data

frame_buffer: 
    # Linha 1 de pixels (exemplo)
    # Nota: Em arquiteturas Little Endian (RISC-V), .word inverte a ordem dos bytes na memória.
    # Se a ordem das cores ficar invertida na tela, troque .word por .byte sequencial.
    .word 0xff300c03, 0x000f333c, 0xaaaaaaaa, 0x000f333c, 0xff300c03
    
    # Espaço vazio (fundo preto ou lixo de memória, que será copiado também)
    .space 300-40
    
    # Linha 2 de pixels
    .word 0xff300c03, 0x000f333c, 0xaaaaaaaa, 0x000f333c, 0xff300c03

frame_end: # Rótulo para marcar o fim dos dados
