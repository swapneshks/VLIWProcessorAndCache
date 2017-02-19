//fifo design



module D_ff_fifo (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset == 1)
		q=0;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule

module register1bit_fifo( input clk, input reset, input regWrite, input decOut1b, input writeData, output outR );
	D_ff_fifo d0(clk, reset, regWrite, decOut1b, writeData, outR);
endmodule

module registerSet_fifo( input clk, input reset, input regWrite, input [15:0] decOut, input writeData, output outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15 );

	register1bit_fifo r0(clk,reset,regWrite,decOut[0],writeData,outR0);
	register1bit_fifo r1(clk,reset,regWrite,decOut[1],writeData,outR1);
	register1bit_fifo r2(clk,reset,regWrite,decOut[2],writeData,outR2);
	register1bit_fifo r3(clk,reset,regWrite,decOut[3],writeData,outR3);
	register1bit_fifo r4(clk,reset,regWrite,decOut[4],writeData,outR4);
	register1bit_fifo r5(clk,reset,regWrite,decOut[5],writeData,outR5);
	register1bit_fifo r6(clk,reset,regWrite,decOut[6],writeData,outR6);
	register1bit_fifo r7(clk,reset,regWrite,decOut[7],writeData,outR7);
	register1bit_fifo r8(clk,reset,regWrite,decOut[8],writeData,outR8);
	register1bit_fifo r9(clk,reset,regWrite,decOut[9],writeData,outR9);
	register1bit_fifo r10(clk,reset,regWrite,decOut[10],writeData,outR10);
	register1bit_fifo r11(clk,reset,regWrite,decOut[11],writeData,outR11);
	register1bit_fifo r12(clk,reset,regWrite,decOut[12],writeData,outR12);
	register1bit_fifo r13(clk,reset,regWrite,decOut[13],writeData,outR13);
	register1bit_fifo r14(clk,reset,regWrite,decOut[14],writeData,outR14);
	register1bit_fifo r15(clk,reset,regWrite,decOut[15],writeData,outR15);

endmodule

module decoder4to16_fifo( input [3:0] destReg, output reg [15:0] decOut);
	always@(destReg)
	case(destReg)
			4'b0000: decOut=16'b0000000000000001; 
			4'b0001: decOut=16'b0000000000000010;
			4'b0010: decOut=16'b0000000000000100;
			4'b0011: decOut=16'b0000000000001000;
			4'b0100: decOut=16'b0000000000010000;
			4'b0101: decOut=16'b0000000000100000;
			4'b0110: decOut=16'b0000000001000000;
			4'b0111: decOut=16'b0000000010000000;
			4'b1000: decOut=16'b0000000100000000; 
			4'b1001: decOut=16'b0000001000000000;
			4'b1010: decOut=16'b0000010000000000;
			4'b1011: decOut=16'b0000100000000000;
			4'b1100: decOut=16'b0001000000000000;
			4'b1101: decOut=16'b0010000000000000;
			4'b1110: decOut=16'b0100000000000000;
			4'b1111: decOut=16'b1000000000000000;
	endcase
endmodule

module mux16to1_fifo( input outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	case (Sel)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
				
	endcase
endmodule

module fifo(input clk, input reset, input regWrite, input[3:0] index, output out);
	wire[15:0] decOut; 
	wire outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15;
	
	decoder4to16_fifo dec416(index,decOut);
	registerSet_fifo rs(clk,reset,regWrite,decOut,!(out),outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15);
	mux16to1_fifo m161(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,index,out);
	
	
endmodule




//Registers for pipeline
module D_ff_c (input clk, input reset, input regWrite, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite == 1'b1) begin q=d; end
	end
endmodule

module register1bit_c( input clk, input reset, input regWrite, input writeData, output outR );
	D_ff_c d0(clk, reset, regWrite, writeData, outR);
endmodule

module register4bit_c( input clk, input reset, input regWrite, input [3:0] writeData, output [3:0] outR );
	D_ff_c d0(clk, reset, regWrite, writeData[0], outR[0]);
	D_ff_c d1(clk, reset, regWrite, writeData[1], outR[1]);
	D_ff_c d2(clk, reset, regWrite, writeData[2], outR[2]);
	D_ff_c d3(clk, reset, regWrite, writeData[3], outR[3]);
endmodule

module register8bit_c( input clk, input reset, input regWrite, input [7:0] writeData, output [7:0] outR );
	D_ff_c d0(clk, reset, regWrite, writeData[0], outR[0]);
	D_ff_c d1(clk, reset, regWrite, writeData[1], outR[1]);
	D_ff_c d2(clk, reset, regWrite, writeData[2], outR[2]);
	D_ff_c d3(clk, reset, regWrite, writeData[3], outR[3]);
	D_ff_c d4(clk, reset, regWrite, writeData[4], outR[4]);
	D_ff_c d5(clk, reset, regWrite, writeData[5], outR[5]);
	D_ff_c d6(clk, reset, regWrite, writeData[6], outR[6]);
	D_ff_c d7(clk, reset, regWrite, writeData[7], outR[7]);
endmodule

module register24bit_c( input clk, input reset, input regWrite, input [23:0] writeData, output [23:0] outR );
	D_ff_c d0(clk, reset, regWrite, writeData[0], outR[0]);
	D_ff_c d1(clk, reset, regWrite, writeData[1], outR[1]);
	D_ff_c d2(clk, reset, regWrite, writeData[2], outR[2]);
	D_ff_c d3(clk, reset, regWrite, writeData[3], outR[3]);
	D_ff_c d4(clk, reset, regWrite, writeData[4], outR[4]);
	D_ff_c d5(clk, reset, regWrite, writeData[5], outR[5]);
	D_ff_c d6(clk, reset, regWrite, writeData[6], outR[6]);
	D_ff_c d7(clk, reset, regWrite, writeData[7], outR[7]);
	D_ff_c d8(clk, reset, regWrite, writeData[8], outR[8]);
	D_ff_c d9(clk, reset, regWrite, writeData[9], outR[9]);
	D_ff_c d10(clk, reset, regWrite, writeData[10], outR[10]);
	D_ff_c d11(clk, reset, regWrite, writeData[11], outR[11]);
	D_ff_c d12(clk, reset, regWrite, writeData[12], outR[12]);
	D_ff_c d13(clk, reset, regWrite, writeData[13], outR[13]);
	D_ff_c d14(clk, reset, regWrite, writeData[14], outR[14]);
	D_ff_c d15(clk, reset, regWrite, writeData[15], outR[15]);
	D_ff_c d16(clk, reset, regWrite, writeData[16], outR[16]);
	D_ff_c d17(clk, reset, regWrite, writeData[17], outR[17]);
	D_ff_c d18(clk, reset, regWrite, writeData[18], outR[18]);
	D_ff_c d19(clk, reset, regWrite, writeData[19], outR[19]);
	D_ff_c d20(clk, reset, regWrite, writeData[20], outR[20]);
	D_ff_c d21(clk, reset, regWrite, writeData[21], outR[21]);
	D_ff_c d22(clk, reset, regWrite, writeData[22], outR[22]);
	D_ff_c d23(clk, reset, regWrite, writeData[23], outR[23]);
endmodule

module register32bit_c( input clk, input reset, input regWrite, input [31:0] writeData, output [31:0] outR );
	D_ff_c d0(clk, reset, regWrite, writeData[0], outR[0]);
	D_ff_c d1(clk, reset, regWrite, writeData[1], outR[1]);
	D_ff_c d2(clk, reset, regWrite, writeData[2], outR[2]);
	D_ff_c d3(clk, reset, regWrite, writeData[3], outR[3]);
	D_ff_c d4(clk, reset, regWrite, writeData[4], outR[4]);
	D_ff_c d5(clk, reset, regWrite, writeData[5], outR[5]);
	D_ff_c d6(clk, reset, regWrite, writeData[6], outR[6]);
	D_ff_c d7(clk, reset, regWrite, writeData[7], outR[7]);
	D_ff_c d8(clk, reset, regWrite, writeData[8], outR[8]);
	D_ff_c d9(clk, reset, regWrite, writeData[9], outR[9]);
	D_ff_c d10(clk, reset, regWrite, writeData[10], outR[10]);
	D_ff_c d11(clk, reset, regWrite, writeData[11], outR[11]);
	D_ff_c d12(clk, reset, regWrite, writeData[12], outR[12]);
	D_ff_c d13(clk, reset, regWrite, writeData[13], outR[13]);
	D_ff_c d14(clk, reset, regWrite, writeData[14], outR[14]);
	D_ff_c d15(clk, reset, regWrite, writeData[15], outR[15]);
	D_ff_c d16(clk, reset, regWrite, writeData[16], outR[16]);
	D_ff_c d17(clk, reset, regWrite, writeData[17], outR[17]);
	D_ff_c d18(clk, reset, regWrite, writeData[18], outR[18]);
	D_ff_c d19(clk, reset, regWrite, writeData[19], outR[19]);
	D_ff_c d20(clk, reset, regWrite, writeData[20], outR[20]);
	D_ff_c d21(clk, reset, regWrite, writeData[21], outR[21]);
	D_ff_c d22(clk, reset, regWrite, writeData[22], outR[22]);
	D_ff_c d23(clk, reset, regWrite, writeData[23], outR[23]);
	D_ff_c d24(clk, reset, regWrite, writeData[24], outR[24]);
	D_ff_c d25(clk, reset, regWrite, writeData[25], outR[25]);
	D_ff_c d26(clk, reset, regWrite, writeData[26], outR[26]);
	D_ff_c d27(clk, reset, regWrite, writeData[27], outR[27]);
	D_ff_c d28(clk, reset, regWrite, writeData[28], outR[28]);
	D_ff_c d29(clk, reset, regWrite, writeData[29], outR[29]);
	D_ff_c d30(clk, reset, regWrite, writeData[30], outR[30]);
	D_ff_c d31(clk, reset, regWrite, writeData[31], outR[31]);
endmodule

module register128bit_c( input clk, input reset, input regWrite, input [127:0] writeData, output [127:0] outR );
	
	register8bit_c b0( clk, reset, regWrite, writeData[7:0], outR[7:0]);
	register8bit_c b1( clk, reset, regWrite, writeData[15:8], outR[15:8]);
	register8bit_c b2( clk, reset, regWrite, writeData[23:16], outR[23:16]);
	register8bit_c b3( clk, reset, regWrite, writeData[31:24], outR[31:24]);
	register8bit_c b4( clk, reset, regWrite, writeData[39:32], outR[39:32]);
	register8bit_c b5( clk, reset, regWrite, writeData[47:40], outR[47:40]);
	register8bit_c b6( clk, reset, regWrite, writeData[55:48], outR[55:48]);
	register8bit_c b7( clk, reset, regWrite, writeData[63:56], outR[63:56]);
	register8bit_c b8( clk, reset, regWrite, writeData[71:64], outR[71:64]);
	register8bit_c b9( clk, reset, regWrite, writeData[79:72], outR[79:72]);
	register8bit_c b10( clk, reset, regWrite, writeData[87:80], outR[87:80]);
	register8bit_c b11( clk, reset, regWrite, writeData[95:88], outR[95:88]);
	register8bit_c b12( clk, reset, regWrite, writeData[103:96], outR[103:96]);
	register8bit_c b13( clk, reset, regWrite, writeData[111:104], outR[111:104]);
	register8bit_c b14( clk, reset, regWrite, writeData[119:112], outR[119:112]);
	register8bit_c b15( clk, reset, regWrite, writeData[127:120], outR[127:120]);
	
endmodule

//Registers for cache

module D_ff_Mem (input clk, input reset, input regWrite, input decOut1b,input init, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=init;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule

module register1bit_Mem( input clk, input reset, input regWrite, input decOut1b, input init, input d_in, output q_out );
	D_ff_Mem d0(clk, reset, regWrite, decOut1b, init, d_in, q_out);
endmodule

module register4bit_Mem( input clk, input reset, input regWrite, input decOut1b, input [3:0] init, input [3:0] d_in, output [3:0] q_out );
	D_ff_Mem d0(clk, reset, regWrite, decOut1b, init[0], d_in[0], q_out[0]);
	D_ff_Mem d1(clk, reset, regWrite, decOut1b, init[1], d_in[1], q_out[1]);
	D_ff_Mem d2(clk, reset, regWrite, decOut1b, init[2], d_in[2], q_out[2]);
	D_ff_Mem d3(clk, reset, regWrite, decOut1b, init[3], d_in[3], q_out[3]);
endmodule

module register8bit_Mem( input clk, input reset, input regWrite, input decOut1b, input [7:0] init, input [7:0] d_in, output [7:0] q_out );
	D_ff_Mem d0(clk, reset, regWrite, decOut1b, init[0], d_in[0], q_out[0]);
	D_ff_Mem d1(clk, reset, regWrite, decOut1b, init[1], d_in[1], q_out[1]);
	D_ff_Mem d2(clk, reset, regWrite, decOut1b, init[2], d_in[2], q_out[2]);
	D_ff_Mem d3(clk, reset, regWrite, decOut1b, init[3], d_in[3], q_out[3]);
	D_ff_Mem d4(clk, reset, regWrite, decOut1b, init[4], d_in[4], q_out[4]);
	D_ff_Mem d5(clk, reset, regWrite, decOut1b, init[5], d_in[5], q_out[5]);
	D_ff_Mem d6(clk, reset, regWrite, decOut1b, init[6], d_in[6], q_out[6]);
	D_ff_Mem d7(clk, reset, regWrite, decOut1b, init[7], d_in[7], q_out[7]);
endmodule

module register24bit_Mem( input clk, input reset, input regWrite, input decOut1b, input [23:0] init, input [23:0] d_in, output [23:0] q_out );
	D_ff_Mem d0(clk, reset, regWrite, decOut1b, init[0], d_in[0], q_out[0]);
	D_ff_Mem d1(clk, reset, regWrite, decOut1b, init[1], d_in[1], q_out[1]);
	D_ff_Mem d2(clk, reset, regWrite, decOut1b, init[2], d_in[2], q_out[2]);
	D_ff_Mem d3(clk, reset, regWrite, decOut1b, init[3], d_in[3], q_out[3]);
	D_ff_Mem d4(clk, reset, regWrite, decOut1b, init[4], d_in[4], q_out[4]);
	D_ff_Mem d5(clk, reset, regWrite, decOut1b, init[5], d_in[5], q_out[5]);
	D_ff_Mem d6(clk, reset, regWrite, decOut1b, init[6], d_in[6], q_out[6]);
	D_ff_Mem d7(clk, reset, regWrite, decOut1b, init[7], d_in[7], q_out[7]);
	D_ff_Mem d8(clk, reset, regWrite, decOut1b, init[8], d_in[8], q_out[8]);
	D_ff_Mem d9(clk, reset, regWrite, decOut1b, init[9], d_in[9], q_out[9]);
	D_ff_Mem d10(clk, reset, regWrite, decOut1b, init[10], d_in[10], q_out[10]);
	D_ff_Mem d11(clk, reset, regWrite, decOut1b, init[11], d_in[11], q_out[11]);
	D_ff_Mem d12(clk, reset, regWrite, decOut1b, init[12], d_in[12], q_out[12]);
	D_ff_Mem d13(clk, reset, regWrite, decOut1b, init[13], d_in[13], q_out[13]);
	D_ff_Mem d14(clk, reset, regWrite, decOut1b, init[14], d_in[14], q_out[14]);
	D_ff_Mem d15(clk, reset, regWrite, decOut1b, init[15], d_in[15], q_out[15]);
	D_ff_Mem d16(clk, reset, regWrite, decOut1b, init[16], d_in[16], q_out[16]);
	D_ff_Mem d17(clk, reset, regWrite, decOut1b, init[17], d_in[17], q_out[17]);
	D_ff_Mem d18(clk, reset, regWrite, decOut1b, init[18], d_in[18], q_out[18]);
	D_ff_Mem d19(clk, reset, regWrite, decOut1b, init[19], d_in[19], q_out[19]);
	D_ff_Mem d20(clk, reset, regWrite, decOut1b, init[20], d_in[20], q_out[20]);
	D_ff_Mem d21(clk, reset, regWrite, decOut1b, init[21], d_in[21], q_out[21]);
	D_ff_Mem d22(clk, reset, regWrite, decOut1b, init[22], d_in[22], q_out[22]);
	D_ff_Mem d23(clk, reset, regWrite, decOut1b, init[23], d_in[23], q_out[23]);
endmodule

module cacheBlock (input clk, input reset, input regWrite, input decOut1b, input [127:0] init, input [127:0] blockData_in, output [127:0] blockData_out);

	register8bit_Mem b0( clk, reset, regWrite, decOut1b, init[7:0], blockData_in[7:0], blockData_out[7:0]);
	register8bit_Mem b1( clk, reset, regWrite, decOut1b, init[15:8], blockData_in[15:8], blockData_out[15:8]);
	register8bit_Mem b2( clk, reset, regWrite, decOut1b, init[23:16], blockData_in[23:16], blockData_out[23:16]);
	register8bit_Mem b3( clk, reset, regWrite, decOut1b, init[31:24], blockData_in[31:24], blockData_out[31:24]);
	register8bit_Mem b4( clk, reset, regWrite, decOut1b, init[39:32], blockData_in[39:32], blockData_out[39:32]);
	register8bit_Mem b5( clk, reset, regWrite, decOut1b, init[47:40], blockData_in[47:40], blockData_out[47:40]);
	register8bit_Mem b6( clk, reset, regWrite, decOut1b, init[55:48], blockData_in[55:48], blockData_out[55:48]);
	register8bit_Mem b7( clk, reset, regWrite, decOut1b, init[63:56], blockData_in[63:56], blockData_out[63:56]);
	register8bit_Mem b8( clk, reset, regWrite, decOut1b, init[71:64], blockData_in[71:64], blockData_out[71:64]);
	register8bit_Mem b9( clk, reset, regWrite, decOut1b, init[79:72], blockData_in[79:72], blockData_out[79:72]);
	register8bit_Mem b10( clk, reset, regWrite, decOut1b, init[87:80], blockData_in[87:80], blockData_out[87:80]);
	register8bit_Mem b11( clk, reset, regWrite, decOut1b, init[95:88], blockData_in[95:88], blockData_out[95:88]);
	register8bit_Mem b12( clk, reset, regWrite, decOut1b, init[103:96], blockData_in[103:96], blockData_out[103:96]);
	register8bit_Mem b13( clk, reset, regWrite, decOut1b, init[111:104], blockData_in[111:104], blockData_out[111:104]);
	register8bit_Mem b14( clk, reset, regWrite, decOut1b, init[119:112], blockData_in[119:112], blockData_out[119:112]);
	register8bit_Mem b15( clk, reset, regWrite, decOut1b, init[127:120], blockData_in[127:120], blockData_out[127:120]);
	
endmodule

module cacheWay1 (input clk, input reset, input regWrite, input [3:0] index, 
				input valid, output c_valid0, c_valid1, c_valid2, c_valid3, c_valid4, c_valid5, c_valid6, c_valid7, c_valid8, c_valid9, c_valid10, 
				c_valid11, c_valid12, c_valid13, c_valid14, c_valid15, 
				input [23:0] tag, output [23:0] c_tag0, c_tag1, c_tag2, c_tag3, c_tag4, c_tag5, c_tag6, c_tag7, c_tag8, c_tag9, c_tag10, c_tag11, 
				c_tag12, c_tag13, c_tag14, c_tag15, 
				input [127:0] blockData, output [127:0] c_blockData0, c_blockData1, c_blockData2, c_blockData3, c_blockData4, c_blockData5, c_blockData6, 
				c_blockData7, c_blockData8, c_blockData9, c_blockData10, c_blockData11, c_blockData12, c_blockData13, c_blockData14, c_blockData15);

	wire [15:0] decOut;
	
	decoder4to16 d4to16( index, decOut);
	
	register1bit_Mem v0( clk, reset, regWrite, decOut[0], 1'b1, valid, c_valid0 );
	register1bit_Mem v1( clk, reset, regWrite, decOut[1], 1'b1, valid, c_valid1 );
	register1bit_Mem v2( clk, reset, regWrite, decOut[2], 1'b1, valid, c_valid2 );
	register1bit_Mem v3( clk, reset, regWrite, decOut[3], 1'b1, valid, c_valid3 );
	register1bit_Mem v4( clk, reset, regWrite, decOut[4], 1'b1, valid, c_valid4 );
	register1bit_Mem v5( clk, reset, regWrite, decOut[5], 1'b1, valid, c_valid5 );
	register1bit_Mem v6( clk, reset, regWrite, decOut[6], 1'b1, valid, c_valid6 );
	register1bit_Mem v7( clk, reset, regWrite, decOut[7], 1'b1, valid, c_valid7 );
	register1bit_Mem v8( clk, reset, regWrite, decOut[8], 1'b1, valid, c_valid8 );
	register1bit_Mem v9( clk, reset, regWrite, decOut[9], 1'b1, valid, c_valid9 );
	register1bit_Mem v10( clk, reset, regWrite, decOut[10], 1'b1, valid, c_valid10 );
	register1bit_Mem v11( clk, reset, regWrite, decOut[11], 1'b1, valid, c_valid11 );
	register1bit_Mem v12( clk, reset, regWrite, decOut[12], 1'b1, valid, c_valid12 );
	register1bit_Mem v13( clk, reset, regWrite, decOut[13], 1'b1, valid, c_valid13 );
	register1bit_Mem v14( clk, reset, regWrite, decOut[14], 1'b1, valid, c_valid14 );
	register1bit_Mem v15( clk, reset, regWrite, decOut[15], 1'b1, valid, c_valid15 );
	
	register24bit_Mem t0( clk, reset, regWrite, decOut[0], 24'd0, tag, c_tag0 );
	register24bit_Mem t1( clk, reset, regWrite, decOut[1], 24'd1, tag, c_tag1 );
	register24bit_Mem t2( clk, reset, regWrite, decOut[2], 24'd2, tag, c_tag2 );
	register24bit_Mem t3( clk, reset, regWrite, decOut[3], 24'd3, tag, c_tag3 );
	register24bit_Mem t4( clk, reset, regWrite, decOut[4], 24'd4, tag, c_tag4 );
	register24bit_Mem t5( clk, reset, regWrite, decOut[5], 24'd5, tag, c_tag5 );
	register24bit_Mem t6( clk, reset, regWrite, decOut[6], 24'd6, tag, c_tag6 );
	register24bit_Mem t7( clk, reset, regWrite, decOut[7], 24'd7, tag, c_tag7 );
	register24bit_Mem t8( clk, reset, regWrite, decOut[8], 24'd8, tag, c_tag8 );
	register24bit_Mem t9( clk, reset, regWrite, decOut[9], 24'd9, tag, c_tag9 );
	register24bit_Mem t10( clk, reset, regWrite, decOut[10], 24'd10, tag, c_tag10 );
	register24bit_Mem t11( clk, reset, regWrite, decOut[11], 24'd11, tag, c_tag11 );
	register24bit_Mem t12( clk, reset, regWrite, decOut[12], 24'd12, tag, c_tag12 );
	register24bit_Mem t13( clk, reset, regWrite, decOut[13], 24'd13, tag, c_tag13 );
	register24bit_Mem t14( clk, reset, regWrite, decOut[14], 24'd14, tag, c_tag14 );
	register24bit_Mem t15( clk, reset, regWrite, decOut[15], 24'd15, tag, c_tag15 );
	
	cacheBlock c0( clk, reset, regWrite, decOut[0], 128'd1, blockData, c_blockData0 );
	cacheBlock c1( clk, reset, regWrite, decOut[1], 128'd2, blockData, c_blockData1 );
	cacheBlock c2( clk, reset, regWrite, decOut[2], 128'd3, blockData, c_blockData2 );
	cacheBlock c3( clk, reset, regWrite, decOut[3], 128'd4, blockData, c_blockData3 );
	cacheBlock c4( clk, reset, regWrite, decOut[4], 128'd5, blockData, c_blockData4 );
	cacheBlock c5( clk, reset, regWrite, decOut[5], 128'd6, blockData, c_blockData5 );
	cacheBlock c6( clk, reset, regWrite, decOut[6], 128'd7, blockData, c_blockData6 );
	cacheBlock c7( clk, reset, regWrite, decOut[7], 128'd8, blockData, c_blockData7 );
	cacheBlock c8( clk, reset, regWrite, decOut[8], 128'd9, blockData, c_blockData8 );
	cacheBlock c9( clk, reset, regWrite, decOut[9], 128'd10, blockData, c_blockData9 );
	cacheBlock c10( clk, reset, regWrite, decOut[10], 128'd11, blockData, c_blockData10 );
	cacheBlock c11( clk, reset, regWrite, decOut[11], 128'd12, blockData, c_blockData11 );
	cacheBlock c12( clk, reset, regWrite, decOut[12], 128'd13, blockData, c_blockData12 );
	cacheBlock c13( clk, reset, regWrite, decOut[13], 128'd14, blockData, c_blockData13 );
	cacheBlock c14( clk, reset, regWrite, decOut[14], 128'd15, blockData, c_blockData14 );
	cacheBlock c15( clk, reset, regWrite, decOut[15], 128'd16, blockData, c_blockData15 );
	
endmodule

module cacheWay2 (input clk, input reset, input regWrite, input [3:0] index, 
				input valid, output c_valid0, c_valid1, c_valid2, c_valid3, c_valid4, c_valid5, c_valid6, c_valid7, c_valid8, c_valid9, c_valid10, 
				c_valid11, c_valid12, c_valid13, c_valid14, c_valid15, 
				input [23:0] tag, output [23:0] c_tag0, c_tag1, c_tag2, c_tag3, c_tag4, c_tag5, c_tag6, c_tag7, c_tag8, c_tag9, c_tag10, c_tag11, 
				c_tag12, c_tag13, c_tag14, c_tag15, 
				input [127:0] blockData, output [127:0] c_blockData0, c_blockData1, c_blockData2, c_blockData3, c_blockData4, c_blockData5, c_blockData6, 
				c_blockData7, c_blockData8, c_blockData9, c_blockData10, c_blockData11, c_blockData12, c_blockData13, c_blockData14, c_blockData15);

	wire [15:0] decOut;
	
	decoder4to16 d4to16( index, decOut);
	
	register1bit_Mem v0( clk, reset, regWrite, decOut[0], 1'b1, valid, c_valid0 );
	register1bit_Mem v1( clk, reset, regWrite, decOut[1], 1'b1, valid, c_valid1 );
	register1bit_Mem v2( clk, reset, regWrite, decOut[2], 1'b1, valid, c_valid2 );
	register1bit_Mem v3( clk, reset, regWrite, decOut[3], 1'b1, valid, c_valid3 );
	register1bit_Mem v4( clk, reset, regWrite, decOut[4], 1'b1, valid, c_valid4 );
	register1bit_Mem v5( clk, reset, regWrite, decOut[5], 1'b1, valid, c_valid5 );
	register1bit_Mem v6( clk, reset, regWrite, decOut[6], 1'b1, valid, c_valid6 );
	register1bit_Mem v7( clk, reset, regWrite, decOut[7], 1'b1, valid, c_valid7 );
	register1bit_Mem v8( clk, reset, regWrite, decOut[8], 1'b1, valid, c_valid8 );
	register1bit_Mem v9( clk, reset, regWrite, decOut[9], 1'b1, valid, c_valid9 );
	register1bit_Mem v10( clk, reset, regWrite, decOut[10], 1'b1, valid, c_valid10 );
	register1bit_Mem v11( clk, reset, regWrite, decOut[11], 1'b1, valid, c_valid11 );
	register1bit_Mem v12( clk, reset, regWrite, decOut[12], 1'b1, valid, c_valid12 );
	register1bit_Mem v13( clk, reset, regWrite, decOut[13], 1'b1, valid, c_valid13 );
	register1bit_Mem v14( clk, reset, regWrite, decOut[14], 1'b1, valid, c_valid14 );
	register1bit_Mem v15( clk, reset, regWrite, decOut[15], 1'b1, valid, c_valid15 );
	
	register24bit_Mem t0( clk, reset, regWrite, decOut[0], 24'd16, tag, c_tag0 );
	register24bit_Mem t1( clk, reset, regWrite, decOut[1], 24'd17, tag, c_tag1 );
	register24bit_Mem t2( clk, reset, regWrite, decOut[2], 24'd18, tag, c_tag2 );
	register24bit_Mem t3( clk, reset, regWrite, decOut[3], 24'd19, tag, c_tag3 );
	register24bit_Mem t4( clk, reset, regWrite, decOut[4], 24'd20, tag, c_tag4 );
	register24bit_Mem t5( clk, reset, regWrite, decOut[5], 24'd21, tag, c_tag5 );
	register24bit_Mem t6( clk, reset, regWrite, decOut[6], 24'd22, tag, c_tag6 );
	register24bit_Mem t7( clk, reset, regWrite, decOut[7], 24'd23, tag, c_tag7 );
	register24bit_Mem t8( clk, reset, regWrite, decOut[8], 24'd24, tag, c_tag8 );
	register24bit_Mem t9( clk, reset, regWrite, decOut[9], 24'd25, tag, c_tag9 );
	register24bit_Mem t10( clk, reset, regWrite, decOut[10], 24'd26, tag, c_tag10 );
	register24bit_Mem t11( clk, reset, regWrite, decOut[11], 24'd27, tag, c_tag11 );
	register24bit_Mem t12( clk, reset, regWrite, decOut[12], 24'd28, tag, c_tag12 );
	register24bit_Mem t13( clk, reset, regWrite, decOut[13], 24'd29, tag, c_tag13 );
	register24bit_Mem t14( clk, reset, regWrite, decOut[14], 24'd30, tag, c_tag14 );
	register24bit_Mem t15( clk, reset, regWrite, decOut[15], 24'd31, tag, c_tag15 );
	
	cacheBlock c0( clk, reset, regWrite, decOut[0], 128'd17, blockData, c_blockData0 );
	cacheBlock c1( clk, reset, regWrite, decOut[1], 128'd18, blockData, c_blockData1 );
	cacheBlock c2( clk, reset, regWrite, decOut[2], 128'd19, blockData, c_blockData2 );
	cacheBlock c3( clk, reset, regWrite, decOut[3], 128'd20, blockData, c_blockData3 );
	cacheBlock c4( clk, reset, regWrite, decOut[4], 128'd21, blockData, c_blockData4 );
	cacheBlock c5( clk, reset, regWrite, decOut[5], 128'd22, blockData, c_blockData5 );
	cacheBlock c6( clk, reset, regWrite, decOut[6], 128'd23, blockData, c_blockData6 );
	cacheBlock c7( clk, reset, regWrite, decOut[7], 128'd24, blockData, c_blockData7 );
	cacheBlock c8( clk, reset, regWrite, decOut[8], 128'd25, blockData, c_blockData8 );
	cacheBlock c9( clk, reset, regWrite, decOut[9], 128'd26, blockData, c_blockData9 );
	cacheBlock c10( clk, reset, regWrite, decOut[10], 128'd27, blockData, c_blockData10 );
	cacheBlock c11( clk, reset, regWrite, decOut[11], 128'd28, blockData, c_blockData11 );
	cacheBlock c12( clk, reset, regWrite, decOut[12], 128'd29, blockData, c_blockData12 );
	cacheBlock c13( clk, reset, regWrite, decOut[13], 128'd30, blockData, c_blockData13 );
	cacheBlock c14( clk, reset, regWrite, decOut[14], 128'd31, blockData, c_blockData14 );
	cacheBlock c15( clk, reset, regWrite, decOut[15], 128'd32, blockData, c_blockData15 );
	
endmodule

module haltTagArray (input clk, input reset, input regWrite, input [3:0] c_tag0, c_tag1, c_tag2, c_tag3, c_tag4, c_tag5,
						c_tag6, c_tag7, c_tag8, c_tag9, c_tag10, c_tag11, c_tag12, c_tag13, c_tag14, c_tag15, 
						output [3:0] hTag0, hTag1, hTag2, hTag3, hTag4, hTag5, hTag6, hTag7, hTag8, hTag9, hTag10, 
						hTag11, hTag12, hTag13, hTag14, hTag15);
						
	register4bit_Mem h0( clk, reset, 1'b1, 1'b1, c_tag0, c_tag0, hTag0 );
	register4bit_Mem h1( clk, reset, 1'b1, 1'b1, c_tag1, c_tag1, hTag1 );
	register4bit_Mem h2( clk, reset, 1'b1, 1'b1, c_tag2, c_tag2, hTag2 );
	register4bit_Mem h3( clk, reset, 1'b1, 1'b1, c_tag3, c_tag3, hTag3 );
	register4bit_Mem h4( clk, reset, 1'b1, 1'b1, c_tag4, c_tag4, hTag4 );
	register4bit_Mem h5( clk, reset, 1'b1, 1'b1, c_tag5, c_tag5, hTag5 );
	register4bit_Mem h6( clk, reset, 1'b1, 1'b1, c_tag6, c_tag6, hTag6 );
	register4bit_Mem h7( clk, reset, 1'b1, 1'b1, c_tag7, c_tag7, hTag7 );
	register4bit_Mem h8( clk, reset, 1'b1, 1'b1, c_tag8, c_tag8, hTag8 );
	register4bit_Mem h9( clk, reset, 1'b1, 1'b1, c_tag9, c_tag9, hTag9 );
	register4bit_Mem h10( clk, reset, 1'b1, 1'b1, c_tag10, c_tag10, hTag10 );
	register4bit_Mem h11( clk, reset, 1'b1, 1'b1, c_tag11, c_tag11, hTag11 );
	register4bit_Mem h12( clk, reset, 1'b1, 1'b1, c_tag12, c_tag12, hTag12 );
	register4bit_Mem h13( clk, reset, 1'b1, 1'b1, c_tag13, c_tag13, hTag13 );
	register4bit_Mem h14( clk, reset, 1'b1, 1'b1, c_tag14, c_tag14, hTag14 );
	register4bit_Mem h15( clk, reset, 1'b1, 1'b1, c_tag15, c_tag15, hTag15 );
	
endmodule

module haltTagCompare (input [3:0] tag, input [3:0] hTag0, hTag1, hTag2, hTag3, hTag4, hTag5, hTag6, hTag7, hTag8,
						hTag9, hTag10, hTag11, hTag12, hTag13, hTag14, hTag15, output ht_hit0, ht_hit1, ht_hit2, 
						ht_hit3, ht_hit4, ht_hit5, ht_hit6, ht_hit7, ht_hit8, ht_hit9, ht_hit10, ht_hit11, 
						ht_hit12, ht_hit13, ht_hit14, ht_hit15);

	comparator4bits c0(hTag0, tag, ht_hit0);
	comparator4bits c1(hTag1, tag, ht_hit1);
	comparator4bits c2(hTag2, tag, ht_hit2);
	comparator4bits c3(hTag3, tag, ht_hit3);
	comparator4bits c4(hTag4, tag, ht_hit4);
	comparator4bits c5(hTag5, tag, ht_hit5);
	comparator4bits c6(hTag6, tag, ht_hit6);
	comparator4bits c7(hTag7, tag, ht_hit7);
	comparator4bits c8(hTag8, tag, ht_hit8);
	comparator4bits c9(hTag9, tag, ht_hit9);
	comparator4bits c10(hTag10, tag, ht_hit10);
	comparator4bits c11(hTag11, tag, ht_hit11);
	comparator4bits c12(hTag12, tag, ht_hit12);
	comparator4bits c13(hTag13, tag, ht_hit13);
	comparator4bits c14(hTag14, tag, ht_hit14);
	comparator4bits c15(hTag15, tag, ht_hit15);
						
endmodule

module decoder4to16( input [3:0] index, output reg [15:0] decOut);
	always@(index)
	case(index)
			4'b0000: decOut=16'b0000000000000001; 
			4'b0001: decOut=16'b0000000000000010; 
			4'b0010: decOut=16'b0000000000000100; 
			4'b0011: decOut=16'b0000000000001000; 
			4'b0100: decOut=16'b0000000000010000; 
			4'b0101: decOut=16'b0000000000100000; 
			4'b0110: decOut=16'b0000000001000000; 
			4'b0111: decOut=16'b0000000010000000; 
			4'b1000: decOut=16'b0000000100000000; 
			4'b1001: decOut=16'b0000001000000000; 
			4'b1010: decOut=16'b0000010000000000; 
			4'b1011: decOut=16'b0000100000000000; 
			4'b1100: decOut=16'b0001000000000000; 
			4'b1101: decOut=16'b0010000000000000; 
			4'b1110: decOut=16'b0100000000000000; 
			4'b1111: decOut=16'b1000000000000000;
	endcase
endmodule

module cache_pipeline(input clk, input reset, input reset_out, input[31:0] physical_address, input valid1SelValue, input valid2SelValue, input[23:0] tag1SelValue,
		input[23:0] tag2SelValue, input[127:0] data1SelValue, input [127:0] data2SelValue, input [127:0] blockData, input haltTagArray1SelValue, input haltTagArray2SelValue,
		output[31:0] p_physical_address, output p_valid1SelValue, output p_valid2SelValue, output[23:0] p_tag1SelValue, output[23:0] p_tag2SelValue, 
		output[127:0] p_data1SelValue, output [127:0] p_data2SelValue, output [127:0] p_blockData, output p_haltTagArray1SelValue, output p_haltTagArray2SelValue, output p_reset);
		
	register32bit_c pa( clk, reset, 1'b1, physical_address, p_physical_address );
	
	register1bit_c reset1( clk, reset, 1'b1, reset_out, p_reset);
	register1bit_c valid1( clk, reset, 1'b1, valid1SelValue, p_valid1SelValue );
	register1bit_c valid2( clk, reset, 1'b1, valid2SelValue, p_valid2SelValue );
	
	register24bit_c tag1( clk, reset, 1'b1, tag1SelValue, p_tag1SelValue );
	register24bit_c tag2( clk, reset, 1'b1, tag2SelValue, p_tag2SelValue );
	
	register128bit_c data1( clk, reset, 1'b1, data1SelValue, p_data1SelValue );
	register128bit_c data2( clk, reset, 1'b1, data2SelValue, p_data2SelValue );
	
	register128bit_c block( clk, reset, 1'b1, blockData, p_blockData );
	
	register1bit_c haltTag1( clk, reset, 1'b1, haltTagArray1SelValue, p_haltTagArray1SelValue );
	register1bit_c haltTag2( clk, reset, 1'b1, haltTagArray2SelValue, p_haltTagArray2SelValue );	
	
endmodule

module comparator20bits (input compare, input [19:0] tag, input [19:0] cacheTag, output reg comparisionResult);
	
	always@(compare, tag, cacheTag)
	begin
	if(compare == 1)
	begin
		if(tag == cacheTag)
			comparisionResult = 1'b1;
		else
			comparisionResult = 1'b0;
		end
	else
		comparisionResult = 1'b0;
	end
endmodule


module comparator4bits (input [3:0] haltTag, input [3:0] tag, output reg comparisionResult);

	always@(haltTag, tag)
	begin
	if(haltTag == tag)
		comparisionResult = 1'b1;
	else
		comparisionResult = 1'b0;
	end
	
endmodule


module prio_Enc (input hit1, input hit2, output reg dataSelect);

	always@(hit1, hit2)
	begin
	if(hit1 == 1'b1)
		dataSelect = 1'b0;
	else if(hit2 == 1'b1)
		dataSelect = 1'b1;
	end

endmodule

module mux16to1_24bits (input [23:0] in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, 
							input [3:0] index, output reg [23:0] muxout);
	
	always@(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, index)
	begin
		case(index)
			4'b0000 : muxout = in1;
			4'b0001 : muxout = in2;
			4'b0010 : muxout = in3;
			4'b0011 : muxout = in4;
			4'b0100 : muxout = in5;
			4'b0101 : muxout = in6;
			4'b0110 : muxout = in7;
			4'b0111 : muxout = in8;
			4'b1000 : muxout = in9;
			4'b1001 : muxout = in10;
			4'b1010 : muxout = in11;
			4'b1011 : muxout = in12;
			4'b1100 : muxout = in13;
			4'b1101 : muxout = in14;
			4'b1110 : muxout = in15;
			4'b1111 : muxout = in16;
		endcase
	end
			
endmodule

module mux16to1_1bit (input in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, 
							input [3:0] index, output reg muxout);
	
	always@(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, index)
	begin
		case(index)
			4'b0000 : muxout = in1;
			4'b0001 : muxout = in2;
			4'b0010 : muxout = in3;
			4'b0011 : muxout = in4;
			4'b0100 : muxout = in5;
			4'b0101 : muxout = in6;
			4'b0110 : muxout = in7;
			4'b0111 : muxout = in8;
			4'b1000 : muxout = in9;
			4'b1001 : muxout = in10;
			4'b1010 : muxout = in11;
			4'b1011 : muxout = in12;
			4'b1100 : muxout = in13;
			4'b1101 : muxout = in14;
			4'b1110 : muxout = in15;
			4'b1111 : muxout = in16;
		endcase
	end
			
endmodule

module mux16to1_1block (input [127:0] in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, 
							input [3:0] index, output reg[127:0] muxout);
							
	always@(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, index)
	begin
		case(index)
			4'b0000 : muxout = in1;
			4'b0001 : muxout = in2;
			4'b0010 : muxout = in3;
			4'b0011 : muxout = in4;
			4'b0100 : muxout = in5;
			4'b0101 : muxout = in6;
			4'b0110 : muxout = in7;
			4'b0111 : muxout = in8;
			4'b1000 : muxout = in9;
			4'b1001 : muxout = in10;
			4'b1010 : muxout = in11;
			4'b1011 : muxout = in12;
			4'b1100 : muxout = in13;
			4'b1101 : muxout = in14;
			4'b1110 : muxout = in15;
			4'b1111 : muxout = in16;
		endcase
	end
			
endmodule

module mux2to1_1block (input [127:0] block0, block1, input dataSelect, output reg [127:0] outBlock);

	always@(block0, block1, dataSelect)
	begin
		case(dataSelect)
			1'b0 : begin 
					outBlock = block0;
				   end
			1'b1 : begin 
					outBlock = block1;
				   end
		endcase
	end
	
endmodule					

module mux16to1_1byte ( input [127:0] block, input[3:0] offset, output reg [7:0] outData);

	always@(offset, block)
	begin
	case(offset)
		4'b0000 : outData = block[7:0];
		4'b0001 : outData = block[15:8];
		4'b0010 : outData = block[23:16];
		4'b0011 : outData = block[31:24];
		4'b0100 : outData = block[39:32];
		4'b0101 : outData = block[47:40];
		4'b0110 : outData = block[55:48];
		4'b0111 : outData = block[63:56];
		4'b1000 : outData = block[71:64];
		4'b1001 : outData = block[79:72];
		4'b1010 : outData = block[87:80];
		4'b1011 : outData = block[95:88];
		4'b1100 : outData = block[103:96];
		4'b1101 : outData = block[111:104];
		4'b1110 : outData = block[119:112];
		4'b1111 : outData = block[127:120];
	endcase
	end
		
endmodule

module blockUpdate(input [127:0] block, input [3:0] offset, input [16:0] reg_rd2, output reg [127:0] blockUpdated);

	reg [127:0] blockCopy;
	
	always@(block, offset, reg_rd2)
	begin
		blockCopy = block;
	
		case(offset[3:1])
			3'b000: blockCopy[15:0] = reg_rd2;
			3'b001: blockCopy[31:16] = reg_rd2;
			3'b010: blockCopy[47:32] = reg_rd2;
			3'b011: blockCopy[63:48] = reg_rd2;
			3'b100: blockCopy[79:64] = reg_rd2;
			3'b101: blockCopy[95:78] = reg_rd2;
			3'b110: blockCopy[111:96] = reg_rd2;
			3'b111: blockCopy[127:112] = reg_rd2;
		endcase
		
		blockUpdated = blockCopy;
	end

endmodule

module cache_way_halting(input clk, input reset, input read, input write, input [31:0] physical_address_in, input valid, input [127:0] blockData_in, input [15:0] reg_rd2, output hit, output [7:0] data);
	
	wire reset_out;
	wire p_reset;
	wire [31:0] physical_address;
	wire [127:0] blockData;
	
	register1bit_c res(clk, 1'b0, 1'b1, reset, reset_out);
	register32bit_c pc(clk, reset, 1'b1, physical_address_in,physical_address);
	register128bit_c bd(clk, reset, 1'b1, blockData_in, blockData);
	
	wire cw1_c_valid0, cw1_c_valid1, cw1_c_valid2, cw1_c_valid3, cw1_c_valid4, cw1_c_valid5, cw1_c_valid6, cw1_c_valid7, cw1_c_valid8, cw1_c_valid9, cw1_c_valid10, 
		 cw1_c_valid11, cw1_c_valid12, cw1_c_valid13, cw1_c_valid14, cw1_c_valid15,
		 cw2_c_valid0, cw2_c_valid1, cw2_c_valid2, cw2_c_valid3, cw2_c_valid4, cw2_c_valid5, cw2_c_valid6, cw2_c_valid7, cw2_c_valid8, cw2_c_valid9, cw2_c_valid10, 
		 cw2_c_valid11, cw2_c_valid12, cw2_c_valid13, cw2_c_valid14, cw2_c_valid15;
		 
	wire [23:0] cw1_c_tag0, cw1_c_tag1, cw1_c_tag2, cw1_c_tag3, cw1_c_tag4, cw1_c_tag5, cw1_c_tag6, cw1_c_tag7, cw1_c_tag8, cw1_c_tag9, cw1_c_tag10, 
		 cw1_c_tag11, cw1_c_tag12, cw1_c_tag13, cw1_c_tag14, cw1_c_tag15,
		 cw2_c_tag0, cw2_c_tag1, cw2_c_tag2, cw2_c_tag3, cw2_c_tag4, cw2_c_tag5, cw2_c_tag6, cw2_c_tag7, cw2_c_tag8, cw2_c_tag9, cw2_c_tag10, 
		 cw2_c_tag11, cw2_c_tag12, cw2_c_tag13, cw2_c_tag14, cw2_c_tag15;
	
	wire [127:0] cw1_c_blockData0, cw1_c_blockData1, cw1_c_blockData2, cw1_c_blockData3, cw1_c_blockData4, cw1_c_blockData5, cw1_c_blockData6, cw1_c_blockData7, cw1_c_blockData8, cw1_c_blockData9, cw1_c_blockData10, 
		 cw1_c_blockData11, cw1_c_blockData12, cw1_c_blockData13, cw1_c_blockData14, cw1_c_blockData15,
		 cw2_c_blockData0, cw2_c_blockData1, cw2_c_blockData2, cw2_c_blockData3, cw2_c_blockData4, cw2_c_blockData5, cw2_c_blockData6, cw2_c_blockData7, cw2_c_blockData8, cw2_c_blockData9, cw2_c_blockData10, 
		 cw2_c_blockData11, cw2_c_blockData12, cw2_c_blockData13, cw2_c_blockData14, cw2_c_blockData15;
		 
	wire [3:0] hta1_htag0, hta1_htag1, hta1_htag2, hta1_htag3, hta1_htag4, hta1_htag5, hta1_htag6, 
			   hta1_htag7, hta1_htag8, hta1_htag9, hta1_htag10, hta1_htag11, hta1_htag12, hta1_htag13, 
			   hta1_htag14, hta1_htag15;
			   
	wire [3:0] hta2_htag0, hta2_htag1, hta2_htag2, hta2_htag3, hta2_htag4, hta2_htag5, hta2_htag6, 
			   hta2_htag7, hta2_htag8, hta2_htag9, hta2_htag10, hta2_htag11, hta2_htag12, hta2_htag13, 
			   hta2_htag14, hta2_htag15;
			   
	wire htc1_ht_hit0, htc1_ht_hit1, htc1_ht_hit2, htc1_ht_hit3, htc1_ht_hit4, htc1_ht_hit5, htc1_ht_hit6, 
	     htc1_ht_hit7, htc1_ht_hit8, htc1_ht_hit9, htc1_ht_hit10, htc1_ht_hit11, htc1_ht_hit12, htc1_ht_hit13, 
		 htc1_ht_hit14, htc1_ht_hit15;
		 
	wire htc2_ht_hit0, htc2_ht_hit1, htc2_ht_hit2, htc2_ht_hit3, htc2_ht_hit4, htc2_ht_hit5, htc2_ht_hit6, 
	     htc2_ht_hit7, htc2_ht_hit8, htc2_ht_hit9, htc2_ht_hit10, htc2_ht_hit11, htc2_ht_hit12, htc2_ht_hit13, 
		 htc2_ht_hit14, htc2_ht_hit15;
		 
	wire writeOrMiss;
		
	wire [31:0] p_physical_address;
	
	wire haltTagArray1SelValue;
	wire haltTagArray2SelValue;
	wire p_haltTagArray1SelValue;
	wire p_haltTagArray2SelValue;
	
	wire valid1SelValue;
	wire valid2SelValue;
	wire p_valid1SelValue;
	wire p_valid2SelValue;
	
	wire[23:0] tag1SelValue;
	wire[23:0] tag2SelValue;
	wire[23:0] p_tag1SelValue;
	wire[23:0] p_tag2SelValue;
	
	wire[127:0] data1SelValue;
	wire[127:0] data2SelValue;
	wire[127:0] p_data1SelValue;
	wire[127:0] p_data2SelValue;
	wire[127:0] p_blockData;
	
	wire cmp1Result;
	wire cmp2Result;
	wire way1Hit;
	wire way2Hit;
	wire waySelect;
	
	wire [127:0] outBlock;
	wire [127:0] outBlockUpdated;
	wire [127:0] writeBlock;
	
	wire fifoOut;
	assign writeOrMiss = (write || !hit);

	
	cacheWay1 cw1(clk, reset, writeOrMiss && !(fifoOut & !reset), p_physical_address[7:4], valid, 
				cw1_c_valid0, cw1_c_valid1, cw1_c_valid2, cw1_c_valid3, cw1_c_valid4, cw1_c_valid5, cw1_c_valid6, 
				cw1_c_valid7, cw1_c_valid8, cw1_c_valid9, cw1_c_valid10, cw1_c_valid11, cw1_c_valid12, 
				cw1_c_valid13, cw1_c_valid14, cw1_c_valid15, 
				p_physical_address[31:8], 
				cw1_c_tag0, cw1_c_tag1, cw1_c_tag2, cw1_c_tag3, cw1_c_tag4, cw1_c_tag5, cw1_c_tag6, cw1_c_tag7, 
				cw1_c_tag8, cw1_c_tag9, cw1_c_tag10, cw1_c_tag11, cw1_c_tag12, cw1_c_tag13, cw1_c_tag14, cw1_c_tag15, 
				writeBlock,
				cw1_c_blockData0, cw1_c_blockData1, cw1_c_blockData2, cw1_c_blockData3, cw1_c_blockData4, 
				cw1_c_blockData5, cw1_c_blockData6, cw1_c_blockData7, cw1_c_blockData8, cw1_c_blockData9, 
				cw1_c_blockData10, cw1_c_blockData11, cw1_c_blockData12, cw1_c_blockData13, cw1_c_blockData14, 
				cw1_c_blockData15);

	cacheWay2 cw2(clk, reset, writeOrMiss && (fifoOut & !reset), p_physical_address[7:4], valid,
				cw2_c_valid0, cw2_c_valid1, cw2_c_valid2, cw2_c_valid3, cw2_c_valid4, cw2_c_valid5, cw2_c_valid6, 
				cw2_c_valid7, cw2_c_valid8, cw2_c_valid9, cw2_c_valid10, cw2_c_valid11, cw2_c_valid12, 
				cw2_c_valid13, cw2_c_valid14, cw2_c_valid15, 
				p_physical_address[31:8], 
				cw2_c_tag0, cw2_c_tag1, cw2_c_tag2, cw2_c_tag3, cw2_c_tag4, cw2_c_tag5, cw2_c_tag6, cw2_c_tag7, 
				cw2_c_tag8, cw2_c_tag9, cw2_c_tag10, cw2_c_tag11, cw2_c_tag12, cw2_c_tag13, cw2_c_tag14, cw2_c_tag15, 
				writeBlock,
				cw2_c_blockData0, cw2_c_blockData1, cw2_c_blockData2, cw2_c_blockData3, cw2_c_blockData4, 
				cw2_c_blockData5, cw2_c_blockData6, cw2_c_blockData7, cw2_c_blockData8, cw2_c_blockData9, 
				cw2_c_blockData10, cw2_c_blockData11, cw2_c_blockData12, cw2_c_blockData13, cw2_c_blockData14, 
				cw2_c_blockData15);
				
	haltTagArray hta1(clk, reset, 1'b1, 
					 cw1_c_tag0[3:0], cw1_c_tag1[3:0], cw1_c_tag2[3:0], cw1_c_tag3[3:0], cw1_c_tag4[3:0], cw1_c_tag5[3:0], cw1_c_tag6[3:0], cw1_c_tag7[3:0], 
					 cw1_c_tag8[3:0], cw1_c_tag9[3:0], cw1_c_tag10[3:0], cw1_c_tag11[3:0], cw1_c_tag12[3:0], cw1_c_tag13[3:0], cw1_c_tag14[3:0], cw1_c_tag15[3:0], 
					 hta1_htag0, hta1_htag1, hta1_htag2, hta1_htag3, hta1_htag4, hta1_htag5, hta1_htag6, 
					 hta1_htag7, hta1_htag8, hta1_htag9, hta1_htag10, hta1_htag11, hta1_htag12, hta1_htag13, 
					 hta1_htag14, hta1_htag15);
					 
	haltTagArray hta2(clk, reset, 1'b1, 
					 cw2_c_tag0[3:0], cw2_c_tag1[3:0], cw2_c_tag2[3:0], cw2_c_tag3[3:0], cw2_c_tag4[3:0], cw2_c_tag5[3:0], cw2_c_tag6[3:0], cw2_c_tag7[3:0], 
					 cw2_c_tag8[3:0], cw2_c_tag9[3:0], cw2_c_tag10[3:0], cw2_c_tag11[3:0], cw2_c_tag12[3:0], cw2_c_tag13[3:0], cw2_c_tag14[3:0], cw2_c_tag15[3:0], 
					 hta2_htag0, hta2_htag1, hta2_htag2, hta2_htag3, hta2_htag4, hta2_htag5, hta2_htag6, 
					 hta2_htag7, hta2_htag8, hta2_htag9, hta2_htag10, hta2_htag11, hta2_htag12, hta2_htag13, 
					 hta2_htag14, hta2_htag15);
					 
	haltTagCompare htc1(physical_address[11:8], 
						hta1_htag0, hta1_htag1, hta1_htag2, hta1_htag3, hta1_htag4, hta1_htag5, hta1_htag6, 
						hta1_htag7, hta1_htag8, hta1_htag9, hta1_htag10, hta1_htag11, hta1_htag12, hta1_htag13, 
						hta1_htag14, hta1_htag15, 
						htc1_ht_hit0, htc1_ht_hit1, htc1_ht_hit2, htc1_ht_hit3, htc1_ht_hit4, htc1_ht_hit5, 
						htc1_ht_hit6, htc1_ht_hit7, htc1_ht_hit8, htc1_ht_hit9, htc1_ht_hit10, htc1_ht_hit11, 
						htc1_ht_hit12, htc1_ht_hit13, htc1_ht_hit14, htc1_ht_hit15);
						
	haltTagCompare htc2(physical_address[11:8], 
						hta2_htag0, hta2_htag1, hta2_htag2, hta2_htag3, hta2_htag4, hta2_htag5, hta2_htag6, 
						hta2_htag7, hta2_htag8, hta2_htag9, hta2_htag10, hta2_htag11, hta2_htag12, hta2_htag13, 
						hta2_htag14, hta2_htag15, 
						htc2_ht_hit0, htc2_ht_hit1, htc2_ht_hit2, htc2_ht_hit3, htc2_ht_hit4, htc2_ht_hit5, 
						htc2_ht_hit6, htc2_ht_hit7, htc2_ht_hit8, htc2_ht_hit9, htc2_ht_hit10, htc2_ht_hit11, 
						htc2_ht_hit12, htc2_ht_hit13, htc2_ht_hit14, htc2_ht_hit15);
						
	mux16to1_1bit haltTagArray1Sel(
						htc1_ht_hit0, htc1_ht_hit1, htc1_ht_hit2, htc1_ht_hit3, htc1_ht_hit4, htc1_ht_hit5, 
						htc1_ht_hit6, htc1_ht_hit7, htc1_ht_hit8, htc1_ht_hit9, htc1_ht_hit10, htc1_ht_hit11, 
						htc1_ht_hit12, htc1_ht_hit13, htc1_ht_hit14, htc1_ht_hit15,
						physical_address[7:4], haltTagArray1SelValue);
						
	mux16to1_1bit haltTagArray2Sel(
						htc2_ht_hit0, htc2_ht_hit1, htc2_ht_hit2, htc2_ht_hit3, htc2_ht_hit4, htc2_ht_hit5, 
						htc2_ht_hit6, htc2_ht_hit7, htc2_ht_hit8, htc2_ht_hit9, htc2_ht_hit10, htc2_ht_hit11, 
						htc2_ht_hit12, htc2_ht_hit13, htc2_ht_hit14, htc2_ht_hit15,
						physical_address[7:4], haltTagArray2SelValue);
						
	mux16to1_1bit valid1Sel(
						cw1_c_valid0, cw1_c_valid1, cw1_c_valid2, cw1_c_valid3, cw1_c_valid4, cw1_c_valid5, 
						cw1_c_valid6, cw1_c_valid7, cw1_c_valid8, cw1_c_valid9, cw1_c_valid10, cw1_c_valid11, 
						cw1_c_valid12, cw1_c_valid13, cw1_c_valid14, cw1_c_valid15,
						physical_address[7:4], valid1SelValue);
		
	mux16to1_1bit valid2Sel(
						cw2_c_valid0, cw2_c_valid1, cw2_c_valid2, cw2_c_valid3, cw2_c_valid4, cw2_c_valid5, 
						cw2_c_valid6, cw2_c_valid7, cw2_c_valid8, cw2_c_valid9, cw2_c_valid10, cw2_c_valid11, 
						cw2_c_valid12, cw2_c_valid13, cw2_c_valid14, cw2_c_valid15,
						physical_address[7:4], valid2SelValue);
						
	mux16to1_24bits tag1Sel(
						cw1_c_tag0, cw1_c_tag1, cw1_c_tag2, cw1_c_tag3, cw1_c_tag4, cw1_c_tag5, cw1_c_tag6, 
						cw1_c_tag7, cw1_c_tag8, cw1_c_tag9, cw1_c_tag10, cw1_c_tag11, cw1_c_tag12, cw1_c_tag13, 
						cw1_c_tag14, cw1_c_tag15, 
						physical_address[7:4], tag1SelValue);
		
	mux16to1_24bits tag2Sel(
						cw2_c_tag0, cw2_c_tag1, cw2_c_tag2, cw2_c_tag3, cw2_c_tag4, cw2_c_tag5, cw2_c_tag6, 
						cw2_c_tag7, cw2_c_tag8, cw2_c_tag9, cw2_c_tag10, cw2_c_tag11, cw2_c_tag12, cw2_c_tag13, 
						cw2_c_tag14, cw2_c_tag15, 
						physical_address[7:4], tag2SelValue);
						
	mux16to1_1block data1Sel(
						cw1_c_blockData0, cw1_c_blockData1, cw1_c_blockData2, cw1_c_blockData3, cw1_c_blockData4, 
						cw1_c_blockData5, cw1_c_blockData6, cw1_c_blockData7, cw1_c_blockData8, cw1_c_blockData9, 
						cw1_c_blockData10, cw1_c_blockData11, cw1_c_blockData12, cw1_c_blockData13, cw1_c_blockData14, 
						cw1_c_blockData15, 
						physical_address[7:4], data1SelValue);
		
	mux16to1_1block data2Sel(
						cw2_c_blockData0, cw2_c_blockData1, cw2_c_blockData2, cw2_c_blockData3, cw2_c_blockData4, 
						cw2_c_blockData5, cw2_c_blockData6, cw2_c_blockData7, cw2_c_blockData8, cw2_c_blockData9, 
						cw2_c_blockData10, cw2_c_blockData11, cw2_c_blockData12, cw2_c_blockData13, 
						cw2_c_blockData14, cw2_c_blockData15, 
						physical_address[7:4], data2SelValue);
						
	cache_pipeline pipeline( clk, reset, reset_out, physical_address, valid1SelValue, valid2SelValue, tag1SelValue, tag2SelValue, data1SelValue, data2SelValue, blockData, 
     	haltTagArray1SelValue, haltTagArray2SelValue, p_physical_address, p_valid1SelValue, p_valid2SelValue, p_tag1SelValue, p_tag2SelValue, 
		p_data1SelValue, p_data2SelValue, p_blockData, p_haltTagArray1SelValue, p_haltTagArray2SelValue, p_reset);
							
	comparator20bits cmp1(p_haltTagArray1SelValue, p_physical_address[31:12], p_tag1SelValue[23:4], cmp1Result);
	comparator20bits cmp2(p_haltTagArray2SelValue, p_physical_address[31:12], p_tag2SelValue[23:4], cmp2Result);
	

	assign way1Hit =  p_valid1SelValue & cmp1Result & p_haltTagArray1SelValue;
	assign way2Hit = p_valid2SelValue  & cmp2Result  & p_haltTagArray2SelValue;
	assign hit = way1Hit | way2Hit;
	
	prio_Enc wayEncoder(way1Hit, way2Hit, waySelect);
	
	mux2to1_1block finalBlock(p_data1SelValue, p_data2SelValue, waySelect, outBlock);
	
	blockUpdate update(outBlock, p_physical_address[3:0], reg_rd2, outBlockUpdated);
	mux2to1_1block finalWriteBlock(p_blockData, outBlockUpdated, write && hit, writeBlock);
	
	mux16to1_1byte finalData( outBlock, p_physical_address[3:0], data);
	
	fifo fifo_unit(clk, p_reset, !(hit), p_physical_address[7:4], fifoOut);
	
endmodule

module cacheTestBench;

	reg clk;
	reg reset;
	reg read;
	reg write;
	reg [31:0] physical_address_in;
	reg valid;
	reg [127:0] blockData_in;
	reg [15:0] reg_rd2;
	wire hit;
	wire [7:0] data;
	cache_way_halting uut(.clk(clk), .reset(reset), .read(read), .write(write), .physical_address_in(physical_address_in), .valid(valid), .blockData_in(blockData_in), .reg_rd2(reg_rd2),
			.hit(hit), .data(data));
	
	always
	#5 clk=~clk;
	
	initial
	begin
		clk=0; reset=1; write=0; physical_address_in = 32'd0; valid=1; blockData_in=128'd0; reg_rd2=16'd20;
		#10  reset=0; read=1; write=0; physical_address_in = 32'd0; valid=1; blockData_in=128'd1;
		#10  read=1; write=0; physical_address_in = 32'd1; valid=1; blockData_in=128'd1;
		#10  read=1; write=0; physical_address_in = 32'h88888000; valid=1; blockData_in=128'd30;
		#10  read=1; write=0; physical_address_in = 32'h88888800; valid=1; blockData_in=128'd30;
		#10  read=1; write=0; physical_address_in = 32'h10000030; valid=1; blockData_in=128'd128;
		#10  read=0; write=1; physical_address_in = 32'h88888004; valid=1; blockData_in=128'd128;
		#10  read=0; write=1; physical_address_in = 32'h80000004; valid=1; blockData_in=128'd120;
		
		#210 $finish; 
	end
endmodule
