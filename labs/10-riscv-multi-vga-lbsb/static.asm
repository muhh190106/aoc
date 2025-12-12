.text	# 0x00000000 
.globl _start
_start:
	la a0, frame_buffer	# load address of frame buffer
	lb t0, 0(a0)		# load first byte
	lb t1, 1(a0)		# load second byte
	lb t2, 2(a0)		# load third byte
	lb t3, 3(a0)		# load fourth byte
	sb t3, 0(a0)		# store fourth byte to first byte
	sb t2, 1(a0)		# store third byte to second byte
	sb t1, 2(a0)		# store second byte to third byte
	sb t0, 3(a0)		# store first byte to fourth byte
end:
	j end
	
.data	# 0x00000080 
frame_buffer: # wrgb, cmy, white
	.word 0xff300c03, 0x000f333c, 0xaaaaaaaa, 0x000f333c, 0xff300c03 
	.space 300-40
	.word 0xff300c03, 0x000f333c, 0xaaaaaaaa, 0x000f333c, 0xff300c03
frame_end:

# | Cor | Hex | Binário |
# |-----|-----|---------|
# | Preto | `0x00` | `00000000` |
# | Azul escuro | `0x01` | `00000001` |
# | Azul | `0x03` | `00000011` |
# | Verde escuro | `0x04` | `00000100` |
# | Verde | `0x0c` | `00001100` |
# | Ciano | `0x0f` | `00001111` |
# | Vermelho escuro | `0x10` | `00010000` |
# | Vermelho | `0x30` | `00110000` |
# | Magenta | `0x33` | `00110011` |
# | Amarelo | `0x3c` | `00111100` |
# | Branco | `0x3f` | `00111111` |
# | Cinza | `0xaa` | `10101010` |
