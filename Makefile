all:
	make reg_6_bit
	make dec_3_to_8
	make regset
	make mux
	make mux6
	make mux_4x1_5bit
	make mux_4x1_3bit
	make mux4_2_1_3b
	make mux2_1_3b
	make mux2_1_6b
	make or
	make fa
	make adder
	make rol
	make alu
	make flag_reg
	make ram_1x1
	make ram_1x17
	make ram_7x17
	make pc
	make pca
	make cu
	make cpu


and:
	iverilog -o and_5bit_tb.vvp and_5bit_tb.v && vvp and_5bit.vvp
ror:
	iverilog -o ror_5bit_tb.vvp ror_5bit_tb.v && vvp ror_5bit.vvp
fa:
	iverilog -o FA_tb.vvp FA_tb.v && vvp FA_tb.vvp
adder:
	iverilog -o adder_5bit_tb.vvp adder_5bit_tb.v && vvp adder_5bit_tb.vvp

mux_4x1_5bit:
	iverilog -o mux_4x1_5bit_tb.vvp mux_4x1_5bit_tb.v && vvp mux_4x1_5bit_tb.vvp
mux_4x1_3bit:
	iverilog -o mux_4x1_3bit_tb.vvp mux_4x1_3bit_tb.v && vvp mux_4x1_3bit_tb.vvp
mux_2x1_1bit:
	iverilog -o mux_2x1_1bit_tb.vvp mux_2x1_1bit_tb.v && vvp mux_2x1_1bit_tb.vvp
mux_2x1_3bit:
	iverilog -o mux_2x1_3bit_tb.vvp mux_2x1_3bit_tb.v && vvp mux_2x1_3bit_tb.vvp
mux_2x1_5bit:
	iverilog -o mux_2x1_5bit_tb.vvp mux_2x1_5bit_tb.v && vvp mux_2x1_5bit_tb.vvp

alu:
	iverilog -o ALU_5bit_tb.vvp ALU_5bit_tb.v && vvp ALU_5bit_tb.vvp

flag_register: 
		iverilog -o flag_register_tb.vvp flag_register_tb.v && vvp flag_register_tb.vvp
register_1bit: 
		iverilog -o register_1bit_tb.vvp register_1bit_tb.v && vvp register_1bit_tb.vvp
register_5bit: 
		iverilog -o register_5bit_tb.vvp register_5bit_tb.v && vvp register_5bit_tb.vvp
decoder_2x4: 
		iverilog -o decoder_2x4_tb.vvp decoder_2x4_tb.v && vvp decoder_2x4_tb.vvp
decoder_3x8: 
		iverilog -o decoder_3x8_tb.vvp decoder_3x8_tb.v && vvp decoder_3x8_tb.vvp
register_set: 
		iverilog -o register_set_tb.vvp register_set_tb.v && vvp register_set_tb.vvp

sram_1x1:
		iverilog -o sram_1x1_tb.vvp sram_1x1_tb.v && vvp sram_1x1_tb.vvp
sram_1x15:
		iverilog -o sram_1x15_tb.vvp sram_1x15_tb.v && vvp sram_1x15_tb.vvp
sram_7x15:
		iverilog -o sram_7x15_tb.vvp sram_7x15_tb.v && vvp sram_7x15_tb.vvp

pc_adder_3bit:
		iverilog -o pc_adder_3bit_tb.vvp pc_adder_3bit_tb.v && vvp pc_adder_3bit_tb.vvp
pc_3bit:
		iverilog -o pc_3bit_tb.vvp pc_3bit_tb.v && vvp pc_3bit_tb.vvp

control_unit:
		iverilog -o control_unit_tb.vvp control_unit_tb.v && vvp control_unit_tb.vvp

cpu: 
	iverilog -o cpu_tb.vvp cpu_tb.v && vvp cpu_tb.vvp
test: 
	iverilog -o test_tb.vvp test_tb.v && vvp test_tb.vvp






clean:
		rm -r *.vvp
		rm -r *.vcd