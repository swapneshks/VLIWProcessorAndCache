//memory design begins
module D_ff_Mem (input clk, input reset, input regWrite, input decOut1b,input init, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=init;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule

module decoder5to32( input [4:0] destReg, output reg [31:0] decOut);
	always@(destReg)
	case(destReg)
			5'b00000: decOut=32'b00000000000000000000000000000001; 
			5'b00001: decOut=32'b00000000000000000000000000000010; 
			5'b00010: decOut=32'b00000000000000000000000000000100; 
			5'b00011: decOut=32'b00000000000000000000000000001000; 
			5'b00100: decOut=32'b00000000000000000000000000010000; 
			5'b00101: decOut=32'b00000000000000000000000000100000; 
			5'b00110: decOut=32'b00000000000000000000000001000000; 
			5'b00111: decOut=32'b00000000000000000000000010000000; 
			5'b01000: decOut=32'b00000000000000000000000100000000; 
			5'b01001: decOut=32'b00000000000000000000001000000000; 
			5'b01010: decOut=32'b00000000000000000000010000000000; 
			5'b01011: decOut=32'b00000000000000000000100000000000; 
			5'b01100: decOut=32'b00000000000000000001000000000000; 
			5'b01101: decOut=32'b00000000000000000010000000000000; 
			5'b01110: decOut=32'b00000000000000000100000000000000; 
			5'b01111: decOut=32'b00000000000000001000000000000000;
			5'b10000: decOut=32'b00000000000000010000000000000000; 
			5'b10001: decOut=32'b00000000000000100000000000000000; 
			5'b10010: decOut=32'b00000000000001000000000000000000; 
			5'b10011: decOut=32'b00000000000010000000000000000000; 
			5'b10100: decOut=32'b00000000000100000000000000000000; 
			5'b10101: decOut=32'b00000000001000000000000000000000; 
			5'b10110: decOut=32'b00000000010000000000000000000000; 
			5'b10111: decOut=32'b00000000100000000000000000000000; 
			5'b11000: decOut=32'b00000001000000000000000000000000; 
			5'b11001: decOut=32'b00000010000000000000000000000000; 
			5'b11010: decOut=32'b00000100000000000000000000000000; 
			5'b11011: decOut=32'b00001000000000000000000000000000; 
			5'b11100: decOut=32'b00010000000000000000000000000000; 
			5'b11101: decOut=32'b00100000000000000000000000000000; 
			5'b11110: decOut=32'b01000000000000000000000000000000; 
			5'b11111: decOut=32'b10000000000000000000000000000000;
	endcase
endmodule

module mux32to1( input [15:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31, input [4:0] Sel, output reg [15:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or outR16 or outR17 or outR18 or outR19 or outR20 or outR21 or outR22 or outR23 or outR24 or outR25 or outR26 or outR27 or outR28 or outR29 or outR30 or outR31 or Sel)
	case (Sel)
				5'b00000: outBus=outR0;
				5'b00001: outBus=outR1;
				5'b00010: outBus=outR2;
				5'b00011: outBus=outR3;
				5'b00100: outBus=outR4;
				5'b00101: outBus=outR5;
				5'b00110: outBus=outR6;
				5'b00111: outBus=outR7;
				5'b01000: outBus=outR8;
				5'b01001: outBus=outR9;
				5'b01010: outBus=outR10;
				5'b01011: outBus=outR11;
				5'b01100: outBus=outR12;
				5'b01101: outBus=outR13;
				5'b01110: outBus=outR14;
				5'b01111: outBus=outR15;
				5'b10000: outBus=outR16;
				5'b10001: outBus=outR17;
				5'b10010: outBus=outR18;
				5'b10011: outBus=outR19;
				5'b10100: outBus=outR20;
				5'b10101: outBus=outR21;
				5'b10110: outBus=outR22;
				5'b10111: outBus=outR23;
				5'b11000: outBus=outR24;
				5'b11001: outBus=outR25;
				5'b11010: outBus=outR26;
				5'b11011: outBus=outR27;
				5'b11100: outBus=outR28;
				5'b11101: outBus=outR29;
				5'b11110: outBus=outR30;
				5'b11111: outBus=outR31;
	endcase
endmodule

module mux16to1( input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg [31:0] outBus );
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

module register_Mem(input clk,input reset,input regWrite,input decOut1b,input [15:0]init, input [15:0] d_in, output [15:0] q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init[0],d_in[0],q_out[0]);
	D_ff_Mem dMem1 (clk,reset,regWrite,decOut1b,init[1],d_in[1],q_out[1]);
	D_ff_Mem dMem2 (clk,reset,regWrite,decOut1b,init[2],d_in[2],q_out[2]);
	D_ff_Mem dMem3 (clk,reset,regWrite,decOut1b,init[3],d_in[3],q_out[3]);
	
	D_ff_Mem dMem4 (clk,reset,regWrite,decOut1b,init[4],d_in[4],q_out[4]);
	D_ff_Mem dMem5 (clk,reset,regWrite,decOut1b,init[5],d_in[5],q_out[5]);
	D_ff_Mem dMem6 (clk,reset,regWrite,decOut1b,init[6],d_in[6],q_out[6]);
	D_ff_Mem dMem7 (clk,reset,regWrite,decOut1b,init[7],d_in[7],q_out[7]);

	D_ff_Mem dMem8 (clk,reset,regWrite,decOut1b,init[8],d_in[8],q_out[8]);
	D_ff_Mem dMem9 (clk,reset,regWrite,decOut1b,init[9],d_in[9],q_out[9]);
	D_ff_Mem dMem10 (clk,reset,regWrite,decOut1b,init[10],d_in[10],q_out[10]);
	D_ff_Mem dMem11 (clk,reset,regWrite,decOut1b,init[11],d_in[11],q_out[11]);
	
	D_ff_Mem dMem12 (clk,reset,regWrite,decOut1b,init[12],d_in[12],q_out[12]);
	D_ff_Mem dMem13 (clk,reset,regWrite,decOut1b,init[13],d_in[13],q_out[13]);
	D_ff_Mem dMem14 (clk,reset,regWrite,decOut1b,init[14],d_in[14],q_out[14]);
	D_ff_Mem dMem15 (clk,reset,regWrite,decOut1b,init[15],d_in[15],q_out[15]);
	
endmodule

module data_Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [15:0] dataIn,output [15:0] IR );
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7, Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15, Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23, Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31;
	wire[31:0] decOut;
	decoder5to32 ddec0( pc[4:0], decOut);
	
	register_Mem dr0(clk,reset,memWrite,decOut[0],16'b 101_0000_1000_01111,dataIn,Qout0); 
	register_Mem dr1(clk,reset,memWrite,decOut[1],16'b 101_0000_0101_00101,dataIn,Qout1); 
	register_Mem dr2(clk,reset,memWrite,decOut[2],16'b 101_0000_0010_00010,dataIn,Qout2); 
	register_Mem dr3(clk,reset,memWrite,decOut[3],16'b 101_0000_0000_00000,dataIn,Qout3); 
	
	register_Mem dr4(clk,reset,memWrite,decOut[4],16'b 001_1000_1000_00000,dataIn,Qout4); 
	register_Mem dr5(clk,reset,memWrite,decOut[5],16'b 100_0000_0000_01001,dataIn,Qout5); 
	register_Mem dr6(clk,reset,memWrite,decOut[6],16'b 000_0101_0101_01010,dataIn,Qout6); 
	register_Mem dr7(clk,reset,memWrite,decOut[7],16'b 101_0000_0100_00100,dataIn,Qout7);  
		
	register_Mem dr8(clk,reset,memWrite,decOut[8],16'b 111_0000_0101_00000,dataIn,Qout8); 
	register_Mem dr9(clk,reset,memWrite,decOut[9],16'b 010_1000_0010_00000,dataIn,Qout9);  
	register_Mem dr10(clk,reset,memWrite,decOut[10],16'b 011_0000_0000_00001,dataIn,Qout10); 
	register_Mem dr11(clk,reset,memWrite,decOut[11],16'b 100_0000_0000_00111,dataIn,Qout11); 
	
	register_Mem dr12(clk,reset,memWrite,decOut[12],16'b 111_0000_0000_00000,dataIn,Qout12);
	register_Mem dr13(clk,reset,memWrite,decOut[13],16'b 110_0000_0110_00000,dataIn,Qout13);
	register_Mem dr14(clk,reset,memWrite,decOut[14],16'b 000_0101_0001_00101,dataIn,Qout14); 
	register_Mem dr15(clk,reset,memWrite,decOut[15],16'b 000_0010_0001_00011,dataIn,Qout15);

	register_Mem dr16(clk,reset,memWrite,decOut[16],16'b 101_0000_0101_00101,dataIn,Qout16); 
	register_Mem dr17(clk,reset,memWrite,decOut[17],16'b 101_0000_0101_00101,dataIn,Qout17); 
	register_Mem dr18(clk,reset,memWrite,decOut[18],16'b 101_0000_0101_00101,dataIn,Qout18); 
	register_Mem dr19(clk,reset,memWrite,decOut[19],16'b 101_0000_0101_00101,dataIn,Qout19); 
	register_Mem dr20(clk,reset,memWrite,decOut[20],16'b 101_0000_0010_00010,dataIn,Qout20); 
	register_Mem dr21(clk,reset,memWrite,decOut[21],16'b 101_0000_0010_00010,dataIn,Qout21); 
	register_Mem dr22(clk,reset,memWrite,decOut[22],16'b 101_0000_0010_00010,dataIn,Qout22); 
	register_Mem dr23(clk,reset,memWrite,decOut[23],16'b 101_0000_0010_00010,dataIn,Qout23); 
	register_Mem dr24(clk,reset,memWrite,decOut[24],16'b 101_0000_0010_00010,dataIn,Qout24); 
	register_Mem dr25(clk,reset,memWrite,decOut[25],16'b 101_0000_0010_00010,dataIn,Qout25); 
	register_Mem dr26(clk,reset,memWrite,decOut[26],16'b 101_0000_0010_00010,dataIn,Qout26); 
	register_Mem dr27(clk,reset,memWrite,decOut[27],16'b 101_0000_0010_00010,dataIn,Qout27); 
	register_Mem dr28(clk,reset,memWrite,decOut[28],16'b 101_0000_0010_00010,dataIn,Qout28); 
	register_Mem dr29(clk,reset,memWrite,decOut[29],16'b 101_0000_0010_00010,dataIn,Qout29); 
	register_Mem dr30(clk,reset,memWrite,decOut[30],16'b 101_0000_0010_00010,dataIn,Qout30); 
	register_Mem dr31(clk,reset,memWrite,decOut[31],16'b 101_0000_0010_00010,dataIn,Qout31); 

	
	mux32to1 dmMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15, Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23, Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31,pc[4:0],IR);
endmodule

module instruction_Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [15:0] dataIn,output [31:0] IR );
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7, Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15, Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23, Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31;
	wire[31:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15;
	wire[31:0] decOut;
	decoder5to32 idec0( pc[5:1], decOut);
	
	register_Mem ir0(clk,reset,memWrite,decOut[0],16'b 00011_11111_001_001,dataIn,Qout0); //sub $1,$1, 7
	register_Mem ir1(clk,reset,memWrite,decOut[1],16'b 01111_00001_010_111,dataIn,Qout1);  //lw $7,$2(1)
	
	register_Mem ir2(clk,reset,memWrite,decOut[2],16'b 01000_00100_101_101,dataIn,Qout2);  //add $5, $5
	register_Mem ir3(clk,reset,memWrite,decOut[3],16'b 01111_00001_010_011,dataIn,Qout3);  //lw $3, $2(1)
	
	register_Mem ir4(clk,reset,memWrite,decOut[4],16'b 01000_00100_110_110,dataIn,Qout4);  //add $6, $6
	register_Mem ir5(clk,reset,memWrite,decOut[5],16'b 01110_00110_010_100,dataIn,Qout5);  //sw $2(6), $4
	
	register_Mem ir6(clk,reset,memWrite,decOut[6],16'b 01000_01000_001_111,dataIn,Qout6);  //lsl $7, $1	
	register_Mem ir7(clk,reset,memWrite,decOut[7],16'b 01110_00101_010_100,dataIn,Qout7);  //sw $2(5), $4  
	
	register_Mem ir8(clk,reset,memWrite,decOut[8],16'b 01000_01011_100_110,dataIn,Qout8);  //ror $6,$4
	register_Mem ir9(clk,reset,memWrite,decOut[9],16'b 01110_00110_100_101,dataIn,Qout9);  //sw $4(6), $5

	register_Mem ir10(clk,reset,memWrite,decOut[10],16'b 01000_00100_110_011,dataIn,Qout10); //add $3, $6
	register_Mem ir11(clk,reset,memWrite,decOut[11],16'b 01111_00011_010_010,dataIn,Qout11); //lw $2, $2(3)  
	
	register_Mem ir12(clk,reset,memWrite,decOut[12],16'b 01000_00100_110_001,dataIn,Qout12);  //add $1,$6
	register_Mem ir13(clk,reset,memWrite,decOut[13],16'b 01111_00101_101_111,dataIn,Qout13); //lw $7, $5(5)

	register_Mem ir14(clk,reset,memWrite,decOut[14],16'b 01000_00100_101_001,dataIn,Qout14);  //add $1,$5
	register_Mem ir15(clk,reset,memWrite,decOut[15],16'b 11010_110_00001110,dataIn,Qout15);  //branch 14

/*	register_Mem ir14(clk,reset,memWrite,decOut[14],16'b 01000_00100_101_001,dataIn,Qout14);  //add $1,$5
	register_Mem ir15(clk,reset,memWrite,decOut[15],16'b 11110_00000001110,dataIn,Qout15);  //jump 14
*/	
	register_Mem ir16(clk,reset,memWrite,decOut[16],16'b 00000_00_000_000_000,dataIn,Qout16); //nop
	register_Mem ir17(clk,reset,memWrite,decOut[17],16'b 00000_00_000_000_000,dataIn,Qout17);  //nop

	register_Mem ir18(clk,reset,memWrite,decOut[18],16'b 01010_00_000_000_000,dataIn,Qout18);  // undefined instruction 
	register_Mem ir19(clk,reset,memWrite,decOut[19],16'b 01111_00100_010_111,dataIn,Qout19); 	//lw $1, $2(4)
	
	register_Mem ir20(clk,reset,memWrite,decOut[20],16'b 00000_00_000_000_000,dataIn,Qout20); 
	register_Mem ir21(clk,reset,memWrite,decOut[21],16'b 00000_00_000_000_000,dataIn,Qout21); 
	register_Mem ir22(clk,reset,memWrite,decOut[22],16'b 00000_00_000_000_000,dataIn,Qout22); 
	register_Mem ir23(clk,reset,memWrite,decOut[23],16'b 00000_00_000_000_000,dataIn,Qout23); 
	register_Mem ir24(clk,reset,memWrite,decOut[24],16'b 00000_00_000_000_000,dataIn,Qout24); 
	register_Mem ir25(clk,reset,memWrite,decOut[25],16'b 00000_00_000_000_000,dataIn,Qout25); 
	register_Mem ir26(clk,reset,memWrite,decOut[26],16'b 00000_00_000_000_000,dataIn,Qout26); 
	register_Mem ir27(clk,reset,memWrite,decOut[27],16'b 00000_00_000_000_000,dataIn,Qout27); 
	register_Mem ir28(clk,reset,memWrite,decOut[28],16'b 00000_00_000_000_000,dataIn,Qout28); 
	register_Mem ir29(clk,reset,memWrite,decOut[29],16'b 00000_00_000_000_000,dataIn,Qout29); 
	register_Mem ir30(clk,reset,memWrite,decOut[30],16'b 00000_00_000_000_000,dataIn,Qout30); 
	register_Mem ir31(clk,reset,memWrite,decOut[31],16'b 00000_00_000_000_000,dataIn,Qout31); 
	
	assign out0[15:0] = Qout0;
	assign out0[31:16] = Qout1;

	assign out1[15:0] = Qout2;
	assign out1[31:16] = Qout3;

	assign out2[15:0] = Qout4;
	assign out2[31:16] = Qout5;

	assign out3[15:0] = Qout6;
	assign out3[31:16] = Qout7;

	assign out4[15:0] = Qout8;
	assign out4[31:16] = Qout9;

	assign out5[15:0] = Qout10;
	assign out5[31:16] = Qout11;

	assign out6[15:0] = Qout12;
	assign out6[31:16] = Qout13;

	assign out7[15:0] = Qout14;
	assign out7[31:16] = Qout15;

	assign out8[15:0] = Qout16;
	assign out8[31:16] = Qout17;

	assign out9[15:0] = Qout18;
	assign out9[31:16] = Qout19;

	assign out10[15:0] = Qout20;
	assign out10[31:16] = Qout21;

	assign out11[15:0] = Qout22;
	assign out11[31:16] = Qout23;

	assign out12[15:0] = Qout24;
	assign out12[31:16] = Qout25;

	assign out13[15:0] = Qout26;
	assign out13[31:16] = Qout27;

	assign out14[15:0] = Qout28;
	assign out14[31:16] = Qout29;

	assign out15[15:0] = Qout30;
	assign out15[31:16] = Qout31;
	
	
	mux16to1 imMem (out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15,pc[5:2],IR);
endmodule
//memory design end

//register file design
module D_ff (input clk, input reset, input regWrite1,input regWrite2 , input decOut1b, input decOut2b, input d1,input d2, output reg q);
	always @ (negedge clk)
	begin
	 if(reset==1'b1)
	 begin
	 	q=0;
	 end
	 else
	 begin  
		if(regWrite1 == 1'b1 && decOut1b==1'b1) begin q=d1; end
  		if(regWrite2 == 1'b1 && decOut2b==1'b1) begin q=d2; end
	 end
	end
endmodule

module register32bit( input clk, input reset, input regWrite1, input regWrite2, input decOut1b, input decOut2b, input [31:0] writeData1, input [31:0] writeData2, output  [31:0] outR);
	D_ff d0(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[0],writeData2[0], outR[0]);
	D_ff d1(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[1],writeData2[1], outR[1]);
	D_ff d2(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[2],writeData2[2], outR[2]);
	D_ff d3(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[3],writeData2[3], outR[3]);
	D_ff d4(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[4],writeData2[4], outR[4]);
	D_ff d5(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[5],writeData2[5], outR[5]);
	D_ff d6(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[6],writeData2[6], outR[6]);
	D_ff d7(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[7],writeData2[7], outR[7]);
	D_ff d8(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[8],writeData2[8], outR[8]);
	D_ff d9(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[9],writeData2[9], outR[9]);
	D_ff d10(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[10],writeData2[10], outR[10]);
	D_ff d11(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[11],writeData2[11], outR[11]);
	D_ff d12(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[12],writeData2[12], outR[12]);
	D_ff d13(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[13],writeData2[13], outR[13]);
	D_ff d14(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[14],writeData2[14], outR[14]);
	D_ff d15(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[15],writeData2[15], outR[15]);
	D_ff d16(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[16],writeData2[16], outR[16]);
	D_ff d17(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[17],writeData2[17], outR[17]);
	D_ff d18(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[18],writeData2[18], outR[18]);
	D_ff d19(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[19],writeData2[19], outR[19]);
	D_ff d20(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[20],writeData2[20], outR[20]);
	D_ff d21(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[21],writeData2[21], outR[21]);
	D_ff d22(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[22],writeData2[22], outR[22]);
	D_ff d23(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[23],writeData2[23], outR[23]);
	D_ff d24(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[24],writeData2[24], outR[24]);
	D_ff d25(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[25],writeData2[25], outR[25]);
	D_ff d26(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[26],writeData2[26], outR[26]);
	D_ff d27(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[27],writeData2[27], outR[27]);
	D_ff d28(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[28],writeData2[28], outR[28]);
	D_ff d29(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[29],writeData2[29], outR[29]);
	D_ff d30(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[30],writeData2[30], outR[30]);
	D_ff d31(clk, reset, regWrite1, regWrite2, decOut1b, decOut2b, writeData1[31],writeData2[31], outR[31]);
endmodule

module registerSet( input clk, input reset, input regWrite1, input regWrite2, input [7:0] decOut1, input [7:0] decOut2, input [31:0] writeData1,input [31:0] writeData2,  output [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7 );
	register32bit r0(clk,reset,regWrite1,regWrite2,decOut1[0],decOut2[0],writeData1,writeData2,outR0);
    register32bit r1(clk,reset,regWrite1,regWrite2,decOut1[1],decOut2[1],writeData1,writeData2,outR1);
    register32bit r2(clk,reset,regWrite1,regWrite2,decOut1[2],decOut2[2],writeData1,writeData2,outR2);
    register32bit r3(clk,reset,regWrite1,regWrite2,decOut1[3],decOut2[3],writeData1,writeData2,outR3);
    register32bit r4(clk,reset,regWrite1,regWrite2,decOut1[4],decOut2[4],writeData1,writeData2,outR4);
    register32bit r5(clk,reset,regWrite1,regWrite2,decOut1[5],decOut2[5],writeData1,writeData2,outR5);
    register32bit r6(clk,reset,regWrite1,regWrite2,decOut1[6],decOut2[6],writeData1,writeData2,outR6);
    register32bit r7(clk,reset,regWrite1,regWrite2,decOut1[7],decOut2[7],writeData1,writeData2,outR7);
endmodule

module decoder3to8( input [2:0] destReg, output reg [7:0] decOut);
	always@(destReg)
	case(destReg)
			3'b000: decOut=8'b00000001; 
			3'b001: decOut=8'b00000010;
			3'b010: decOut=8'b00000100;
			3'b011: decOut=8'b00001000;
			3'b100: decOut=8'b00010000;
			3'b101: decOut=8'b00100000;
			3'b110: decOut=8'b01000000;
			3'b111: decOut=8'b10000000;
			endcase
endmodule

module mux8to1( input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7, input [2:0] Sel, output reg [31:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or Sel)
	case (Sel)
				3'b000: outBus=outR0;
				3'b001: outBus=outR1;
				3'b010: outBus=outR2;
				3'b011: outBus=outR3;
				3'b100: outBus=outR4;
				3'b101: outBus=outR5;
				3'b110: outBus=outR6;
				3'b111: outBus=outR7;
	endcase
endmodule

module registerFile(input clk, input reset, input regWrite1, input [2:0] rn1, input [2:0] rd1, input [2:0] destReg1,  
input [31:0] writeData1, input regWrite2, input [2:0] rn2, input [2:0] rd2, input [2:0] destReg2,  
input [31:0] writeData2, output [31:0] outBusRn1, output [31:0] outBusRd1,output [31:0] outBusRn2, output  [31:0] outBusRd2);
	wire [7:0] decOut1;
	wire [7:0] decOut2;
	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;
	decoder3to8 d0(destReg1,decOut1);
	decoder3to8 d1(destReg2,decOut2);
	registerSet rSet0(clk,reset,regWrite1,regWrite2,decOut1,decOut2,writeData1,writeData2,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7 );
	mux8to1 m1(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,rn1,outBusRn1);
	mux8to1 m2(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,rd1,outBusRd1);
  mux8to1 m3(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,rn2,outBusRn2);
	mux8to1 m4(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,rd2,outBusRd2);
endmodule
// register file design ends

module signExt3to32(input [2:0] offset,output reg [31:0] signExtoffset) ; 
  
    always @(offset)
      begin
        signExtoffset = {{29{offset[2]}},offset[2:0]};
      end
      
endmodule

//input is offset left shifted by one bit
module signExt5to32(input [4:0] offset, output reg [31:0] signExtoffset);
    
    always @(offset)
      begin
        signExtoffset = {{27{offset[4]}},offset[4:0]};
      end
        
endmodule

module zeroExt16to32(input [15:0] offset, output reg [31:0] zeroExtoffset);
  
    always @(offset)
      begin
        zeroExtoffset = {{16{1'b0}},offset[15:0]};
      end
      
endmodule
//output should be left shifted by one bit
module signExt11to32(input [10:0] offset, output reg [31:0] signExtoffset);
    
    always @(offset)
      begin
        signExtoffset = {{21{offset[10]}},offset[10:0]};
        
      end
      
endmodule

//output should be left shifted by one bit
module signExt8to32(input [7:0] offset , output reg [31:0] signExtoffset);
  
    always @(offset)
      begin
        signExtoffset = {{24{offset[7]}},offset[7:0]};
      end
endmodule      

     
module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always@(in1 or in2)
		adder_out = in1 +in2;
endmodule

module subtractor(input [31:0] in1, input [31:0] in2, output reg [31:0] subtractor_out);
	always@(in1 or in2)
		subtractor_out = in1 - in2;
endmodule


//pipeline design
module D_ff_pipeline(input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite == 1'b1 && decOut1b==1'b1) begin q=d; end
	end
endmodule

module register3bit_pipeline( input clk, input reset, input regWrite, input decOut1b, input [2:0] writeData, output  [2:0] outR );
	D_ff_pipeline d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_pipeline d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_pipeline d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
endmodule

module register4bit_pipeline( input clk, input reset, input regWrite, input decOut1b, input [3:0] writeData, output  [3:0] outR );
	D_ff_pipeline d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_pipeline d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_pipeline d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_pipeline d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);	
endmodule


module register16bit_pipeline( input clk, input reset, input regWrite, input decOut1b, input [15:0] writeData, output  [15:0] outR );
	D_ff_pipeline d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_pipeline d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_pipeline d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_pipeline d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_pipeline d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_pipeline d5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_pipeline d6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_pipeline d7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_pipeline d8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_pipeline d9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_pipeline d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_pipeline d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_pipeline d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_pipeline d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_pipeline d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_pipeline d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
endmodule

module register1bit_pipeline( input clk, input reset, input regWrite, input decOut1b, input writeData, output outR );
	D_ff_pipeline d0(clk, reset, regWrite, decOut1b, writeData, outR);
endmodule
module register2bit_pipeline( input clk, input reset, input regWrite, input decOut1b, input [1:0] writeData, output [1:0] outR );
  D_ff_pipeline d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_pipeline d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
endmodule  

module register32bit_pipeline( input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [31:0] outR );
	D_ff_pipeline d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_pipeline d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_pipeline d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_pipeline d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_pipeline d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_pipeline d5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_pipeline d6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_pipeline d7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_pipeline d8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_pipeline d9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_pipeline d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_pipeline d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_pipeline d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_pipeline d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_pipeline d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_pipeline d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
	D_ff_pipeline d16(clk, reset, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff_pipeline d17(clk, reset, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff_pipeline d18(clk, reset, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff_pipeline d19(clk, reset, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff_pipeline d20(clk, reset, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff_pipeline d21(clk, reset, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff_pipeline d22(clk, reset, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff_pipeline d23(clk, reset, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff_pipeline d24(clk, reset, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff_pipeline d25(clk, reset, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff_pipeline d26(clk, reset, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff_pipeline d27(clk, reset, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff_pipeline d28(clk, reset, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff_pipeline d29(clk, reset, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff_pipeline d30(clk, reset, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff_pipeline d31(clk, reset, regWrite, decOut1b, writeData[31], outR[31]);
endmodule

module IF_ID(input clk, input reset,input regWrite, input decOut1b,input [15:0] instr1,input [15:0] instr2,input [31:0] pc_input, output [15:0] p0_instr1, output [15:0] p0_instr2, output [31:0] p0_pc_output);
  register16bit_pipeline r1(clk,reset, regWrite, 1'b1, instr1, p0_instr1 );
  register16bit_pipeline r2(clk,reset, regWrite, 1'b1, instr2, p0_instr2 );
  register32bit_pipeline r3(clk,reset, regWrite, 1'b1, pc_input, p0_pc_output );
endmodule

module ID_EX(input clk, input reset,input regWrite, input decOut1b,input [2:0] inst_Rd1,input [2:0] inst_Rd2, input[2:0] inst_Rn1,
    input[2:0] inst_Rn2, input[31:0] reg_rd1, input[31:0] reg_rd2, input[31:0] reg_rn1, input[31:0] reg_rn2, input[31:0] immediate, input[31:0] offset, input aluSrcB, input memRead,
    input memWrite, input regWrite1, input regWrite2, input [1:0] aluOp, input instrException, input[31:0] p0_pc_output, input pcWrite, output [2:0] p1_inst_Rd1, output [2:0] p1_inst_Rd2, output [2:0] p1_inst_Rn1, output [2:0] p1_inst_Rn2, output [31:0] p1_reg_rd1,
    output [31:0] p1_reg_rd2, output [31:0] p1_reg_rn1, output [31:0] p1_reg_rn2, output[31:0] p1_immediate, output[31:0] p1_offset, 
    output p1_aluSrcB, output p1_memRead, output p1_memWrite, output p1_regWrite1, output p1_regWrite2, output [1:0] p1_aluOp ,output p1_instrException, output[31:0] p1_pc_output, output p1_pcWrite);
    
    register3bit_pipeline r1(clk,reset, 1'b1, 1'b1, inst_Rd1, p1_inst_Rd1);
    register3bit_pipeline r2(clk,reset, 1'b1, 1'b1, inst_Rd2, p1_inst_Rd2);
    register3bit_pipeline r3(clk,reset, 1'b1, 1'b1, inst_Rn1, p1_inst_Rn1);
    register3bit_pipeline r4(clk,reset, 1'b1, 1'b1, inst_Rn2, p1_inst_Rn2);
    
    register32bit_pipeline r5(clk,reset, 1'b1, 1'b1, reg_rd1, p1_reg_rd1 );
    register32bit_pipeline r6(clk,reset, 1'b1, 1'b1, reg_rd2, p1_reg_rd2 );
    register32bit_pipeline r7(clk,reset, 1'b1, 1'b1, reg_rn1, p1_reg_rn1 );
    register32bit_pipeline r8(clk,reset, 1'b1, 1'b1, reg_rn2, p1_reg_rn2 );
    register32bit_pipeline r9(clk,reset, 1'b1, 1'b1, p0_pc_output, p1_pc_output );
    
    register32bit_pipeline r13(clk,reset, 1'b1, 1'b1, immediate, p1_immediate );
    register32bit_pipeline r14(clk,reset, 1'b1, 1'b1, offset, p1_offset );

    register1bit_pipeline r17(clk,reset, 1'b1, 1'b1, aluSrcB, p1_aluSrcB );
    register1bit_pipeline r18(clk,reset, 1'b1, 1'b1, memRead, p1_memRead );
    register1bit_pipeline r19(clk,reset, 1'b1, 1'b1, memWrite, p1_memWrite );
    register1bit_pipeline r20(clk,reset, 1'b1, 1'b1, regWrite1, p1_regWrite1);
    register1bit_pipeline r21(clk,reset, 1'b1, 1'b1, regWrite2, p1_regWrite2 );
    register2bit_pipeline r22(clk,reset,1'b1,1'b1,aluOp,p1_aluOp);
    register1bit_pipeline r23(clk,reset, 1'b1, 1'b1, instrException, p1_instrException );
	
	register1bit_pipeline r24(clk,reset, 1'b1, 1'b1, pcWrite, p1_pcWrite );
    
endmodule

module EX_MEM(input clk, input reset,input regWrite, input decOut1b,input [2:0] p1_inst_Rd1,input [2:0] p1_inst_Rd2, 
    input[2:0] p1_inst_Rn1,input[2:0] p1_inst_Rn2, input[31:0] p1_AluOut , input[31:0] p1_AdderOut,input p1_memRead,
   input p1_memWrite, input p1_regWrite1, input p1_regWrite2, input[3:0] p1_statusFlag, input p1_instrException,input[31:0] p1_reg_rd2, input p1_pcWrite,
    output [2:0] p2_inst_Rd1, output [2:0] p2_inst_Rd2, output [2:0] p2_inst_Rn1, output [2:0] p2_inst_Rn2,
     output[31:0] p2_AdderOut, output[31:0] p2_AluOut, output  p2_memRead, output p2_memWrite,
    output  p2_regWrite1, output p2_regWrite2, output[3:0] p2_statusFlag, output p2_instrException,output[31:0] p2_reg_rd2, output p2_pcWrite);

    register3bit_pipeline r1(clk,reset, 1'b1, 1'b1, p1_inst_Rd1, p2_inst_Rd1);
    register3bit_pipeline r2(clk,reset, 1'b1, 1'b1, p1_inst_Rd2, p2_inst_Rd2);
    register3bit_pipeline r3(clk,reset, 1'b1, 1'b1, p1_inst_Rn1, p2_inst_Rn1);
    register3bit_pipeline r4(clk,reset, 1'b1, 1'b1, p1_inst_Rn2, p2_inst_Rn2);
    
    register32bit_pipeline r12(clk,reset, 1'b1, 1'b1,p1_reg_rd2, p2_reg_rd2 );
    register32bit_pipeline r13(clk,reset, 1'b1, 1'b1, p1_AluOut, p2_AluOut );
    register32bit_pipeline r14(clk,reset, 1'b1, 1'b1, p1_AdderOut, p2_AdderOut );
    
    register4bit_pipeline r15(clk,reset,1'b1,1'b1,p1_statusFlag,p2_statusFlag);
    register1bit_pipeline r16(clk,reset, 1'b1, 1'b1, p1_instrException, p2_instrException);

    register1bit_pipeline r18(clk,reset, 1'b1, 1'b1, p1_memRead, p2_memRead );
    register1bit_pipeline r19(clk,reset, 1'b1, 1'b1, p1_memWrite, p2_memWrite );
    register1bit_pipeline r20(clk,reset, 1'b1, 1'b1, p1_regWrite1, p2_regWrite1);
    register1bit_pipeline r21(clk,reset, 1'b1, 1'b1, p1_regWrite2, p2_regWrite2 );
	
	register1bit_pipeline r22(clk,reset, 1'b1, 1'b1, p1_pcWrite, p2_pcWrite );

    endmodule

module MEM_WB(input clk, input reset,input regWrite, input decOut1b,input [2:0] p2_inst_Rd1,input [2:0] p2_inst_Rd2, 
    input[2:0] p2_inst_Rn1,input[2:0] p2_inst_Rn2, input[31:0] p2_AluOut , input[31:0] p2_Data,input p2_regWrite1, input p2_regWrite2, input[3:0] p2_statusFlag, 
    output [2:0] p3_inst_Rd1, output [2:0] p3_inst_Rd2, output [2:0] p3_inst_Rn1, output [2:0] p3_inst_Rn2,
     output[31:0] p3_AluOut, output[31:0] p3_Data,
    output p3_regWrite1, output p3_regWrite2, output[3:0] p3_statusFlag);

    register3bit_pipeline r1(clk,reset, 1'b1, 1'b1, p2_inst_Rd1, p3_inst_Rd1);
    register3bit_pipeline r2(clk,reset, 1'b1, 1'b1, p2_inst_Rd2, p3_inst_Rd2);
    register3bit_pipeline r3(clk,reset, 1'b1, 1'b1, p2_inst_Rn1, p3_inst_Rn1);
    register3bit_pipeline r4(clk,reset, 1'b1, 1'b1, p2_inst_Rn2, p3_inst_Rn2);
    
    register32bit_pipeline r13(clk,reset, 1'b1, 1'b1, p2_AluOut, p3_AluOut );
    register32bit_pipeline r14(clk,reset, 1'b1, 1'b1, p2_Data, p3_Data );

    register4bit_pipeline r15(clk,reset,1'b1,1'b1,p2_statusFlag,p3_statusFlag);

    register1bit_pipeline r20(clk,reset, 1'b1, 1'b1, p2_regWrite1, p3_regWrite1);
    register1bit_pipeline r21(clk,reset, 1'b1, 1'b1, p2_regWrite2, p3_regWrite2 );

endmodule
//pipeline design ends
  
 //4x1 mux 32 bit
 module mux32bit4to1(input [31:0] in1 ,input [31:0] in2 ,input [31:0] in3, input [31:0] in4,input [1:0] sel,output reg [31:0] muxout);
 
  always @(in1 or in2 or in3 or in4 or sel)
    begin
      case(sel)
        2'b00:muxout = in1;
        2'b01:muxout = in2;
        2'b10:muxout = in3;
        2'b11:muxout = in4;
    endcase
  end
 endmodule 

//2x1 mux 32 bit
 module mux32bit2to1(input [31:0] in1 ,input [31:0] in2 , input sel,output reg [31:0] muxout);
 
  always @(in1 or in2 or sel)
    begin
      case(sel)
        1'b0:muxout = in1;
        1'b1:muxout = in2;
    endcase
  end
 endmodule 

//2x1 mux 8 bit
 module mux8bit2to1(input [7:0] in1 ,input [7:0] in2 , input sel,output reg [7:0] muxout);
 
  always @(in1 or in2 or sel)
    begin
      case(sel)
        1'b0:muxout = in1;
        1'b1:muxout = in2;
    endcase
  end
 endmodule 
 
//2x1 mux 5 bit
 module mux5bit2to1(input [4:0] in1 ,input [4:0] in2 , input sel,output reg [4:0] muxout);
 
  always @(in1 or in2 or sel)
    begin
      case(sel)
        1'b0:muxout = in1;
        1'b1:muxout = in2;
    endcase
  end
 endmodule 
 

 //mux 2to1 1bit
 module mux1bit2to1(input in1, input in2 , input [1:0] sel, output reg muxout);
  
  always @(in1 or in2 or sel) 
     begin
       if(sel==0)
          muxout = in1;
       else
          muxout = in2;
     end 
 endmodule
          
  
//statusflags[3] - carryflag, statusflags[2] - overflow , statusflags[1] - negetive, statusflags[0] - zero 
module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp,input carry, output reg [31:0] aluOut1, 
output reg [3:0] statusflags);

reg [31:0] temp;
  always @(aluIn1 or aluIn2 or aluOp or carry)
    begin
        case(aluOp)
          
            2'b00: 
              begin
                temp = aluIn1 + aluIn2 + carry;
                //carry flag
                if(aluIn1[31] && aluIn2[31])
                   statusflags[3] = 1'b1;
                if(aluIn1[31] && !(temp[31]))
                   statusflags[3] = 1'b1;                 
                if(aluIn2[31] && !(temp[31]))
                   statusflags[3] = 1'b1;
                else
                   statusflags[3] = 1'b0; 
                //overflow flag
                if(aluIn1[31] && aluIn2[31] && !(temp[31]))
                  statusflags[2] = 1'b1;
                if(!(aluIn1[31]) && !(aluIn2[31]) && temp[31])
                  statusflags[2] = 1'b1;
                else
                  statusflags[2] = 1'b0;
                //negetive flag
                if(temp[31])
                  statusflags[1] = 1'b1;
                else
                  statusflags[1] = 1'b0;
                //zero flag
                if(temp == 0)
                  statusflags[0] = 1'b1;
                else
                  statusflags[0] = 1'b0;
             end
             
          2'b01:      
              begin
                temp = aluIn1 - aluIn2;
                //carry flag
                if(!temp[31])
                  statusflags[3] = 1'b1;
                if(temp == 0)
                  statusflags[3] = 1'b1;
                  //statusflags[0] = 1'b1;
                else
                  statusflags[3] = 1'b0;
                //overflow flag
                if(aluIn1[31] && !aluIn2[31] && !temp[31])
                  statusflags[2] = 1'b1;
                if(!aluIn1[31] && aluIn2[31] && temp[31]) 
                  statusflags[2] = 1'b1;
                else
                  statusflags[2] = 1'b0;
                //negetive flag
                if(temp[31])
                  statusflags[1] = 1'b1;
                else
                  statusflags[1] = 1'b0;
                //zero flag
                if(temp == 0)
                  statusflags[0] = 1'b1;
                else
                  statusflags[0] = 1'b0;
              end
          2'b10: 
              begin
                temp = aluIn2<<aluIn1;
                //carry flag
                statusflags[3] = aluIn2[32 - aluIn1];
                //negetive flag
                if(temp[31])
                  statusflags[1] = 1'b1;
                else
                  statusflags[1] = 1'b0;
                //zero flag
                if(temp == 0)
                  statusflags[0] = 1'b1;
                else
                  statusflags[0] = 1'b0;
              end
           2'b11:
              begin
                temp = (aluIn2>>aluIn1) | aluIn2<<(32 - aluIn1);
                //carry flag
                statusflags[3] = 1'b0;
                //negetive flag
                if(temp[31])
                  statusflags[1] = 1'b1;
                else
                  statusflags[1] = 1'b0;
                //zero flag
                if(temp == 0)
                  statusflags[0] = 1'b1;
                else
                  statusflags[0] = 1'b0;
              end
    endcase
      
    aluOut1 = temp;
    
  end
endmodule                  

// regWrite1 - R-Type, regWrite2 - lw/sw, pcSel1 - Branch/Jump or PC, pcSel2 - Branch or Jump
// opcode1 - 10 bits is for R-Type (IR1[15:11], opcode2 - 10 bits is for lw/sw (IR2[15:11]))

module ctrlCkt	(input [9:0] opcode1, input [4:0] opcode2, output reg aluSrcB, output reg memRead, output reg memWrite, output reg regWrite1, output reg regWrite2, output reg pcSel1, output reg pcSel2, output reg instrException, output reg [1:0] aluOp, output reg pcWriteCond, output reg pcWrite);

	reg instr1Exception;
	reg instr2Exception;

	always@(opcode1 or opcode2)
		begin
			
			casex(opcode1)

				10'b0100000100:	begin aluSrcB = 1'b0; regWrite1 = 1; instr1Exception = 0; aluOp = 2'b00; pcWriteCond = 1'b0; pcWrite = 1'b1; end //add
				10'b0001111xxx: begin aluSrcB = 1'b1; regWrite1 = 1; instr1Exception = 0; aluOp = 2'b01; pcWriteCond = 1'b0; pcWrite = 1'b1; end //sub
				10'b0100001000:	begin aluSrcB = 1'b0; regWrite1 = 1; instr1Exception = 0; aluOp = 2'b10; pcWriteCond = 1'b0; pcWrite = 1'b1; end //shift
				10'b0100001011:	begin aluSrcB = 1'b0; regWrite1 = 1; instr1Exception = 0; aluOp = 2'b11; pcWriteCond = 1'b0; pcWrite = 1'b1; end //ROR
				10'b0000000000: begin aluSrcB = 1'b0; regWrite1 = 0; instr1Exception = 0; aluOp = 2'b00; pcWriteCond = 1'b0; pcWrite = 1'b1; end //nop
			default:
				begin aluSrcB = 1'b0; memRead = 1'b0; memWrite = 1'b0; regWrite1 = 0; regWrite2 = 0; pcSel1 = 0; pcSel2 = 0; instr1Exception = 1; aluOp = 2'b00; pcWriteCond = 1'b0; pcWrite = 1'b1; end //Exception - Undefined Instruction
			endcase
			case(opcode2)
				5'b01111: begin memRead = 1'b1; memWrite = 1'b0; regWrite2 = 1; pcSel1 = 0; pcSel2 = 0; instr2Exception = 0; pcWriteCond = 1'b0; pcWrite = 1'b1; end //load
				5'b01110: begin memRead = 1'b0; memWrite = 1'b1; regWrite2 = 0; pcSel1 = 0; pcSel2 = 0; instr2Exception = 0; pcWriteCond = 1'b0; pcWrite = 1'b1; end //store
				5'b11110: begin memRead = 1'b0; memWrite = 1'b0; regWrite2 = 0; pcSel1 = 1; pcSel2 = 0; instr2Exception = 0; pcWriteCond = 1'b0; pcWrite = 1'b1; end //jump
				5'b11010: begin memRead = 1'b0; memWrite = 1'b0; regWrite2 = 0; pcSel1 = 1; pcSel2 = 1; instr2Exception = 0; pcWriteCond = 1'b1; pcWrite = 1'b0; end //branch
				5'b00000: begin memRead = 1'b0; memWrite = 1'b0; regWrite2 = 0; pcSel1 = 0; pcSel2 = 0; instr2Exception = 0; pcWriteCond = 1'b0; pcWrite = 1'b1; end //nop
			default: 
				begin aluSrcB = 1'b0; memRead = 1'b0; memWrite = 1'b0; regWrite1 = 0; regWrite2 = 0; pcSel1 = 0; pcSel2 = 0; instr2Exception = 1; aluOp = 2'b00; pcWriteCond = 1'b0; pcWrite = 1'b1; end //Exception - Undefined Instruction
			endcase

			instrException = instr1Exception | instr2Exception;

		end

endmodule


module ForawardingUnit(input[2:0] IfIdRn1, input[2:0] IfIdRd1, input[2:0] IfIdRn2, input[2:0] IfIdRd2,input [2:0] ExMemRd1, input [2:0] IdExRd1, input [2:0] IdExRn1, input [2:0] IdExRn2, 
input [2:0] MemWbRd1, input[2:0] MemWbRd2, input ExMemRegWrite1, input MemWbRegWrite1, 
input MemWbRegWrite2, input[2:0] MemWbRn1, input[2:0] MemWbRn2, input[2:0] IdExRd2, output reg [1:0] Forwarda, output reg [1:0] Forwardb, 
output reg [1:0] Forwardc, output reg [1:0] Forward1, output reg [1:0] Forward2, output reg [1:0] Forward3, output reg [1:0] Forward4 );

  always @( IfIdRd1 or IfIdRn1 or IfIdRn2 or IfIdRd2 or ExMemRd1 or IdExRd1 or IdExRn1 or IdExRn2 or MemWbRd1 or MemWbRd2 or ExMemRegWrite1 or MemWbRegWrite1 
  or MemWbRegWrite2)
    begin
	// one stage
	if((MemWbRegWrite1 && MemWbRd1 !=0) && (IfIdRn1 == MemWbRd1))
	  Forward1 = 2'b01;
	else if((MemWbRegWrite2 && MemWbRd2 !=0) && (IfIdRn1 == MemWbRd2))
	  Forward1 = 2'b10;
	else
	  Forward1 = 2'b00;

	if((MemWbRegWrite1 && MemWbRd1 !=0) && (IfIdRd1 == MemWbRd1))
	  Forward2 = 2'b01;
	else if((MemWbRegWrite2 && MemWbRd2 !=0) && (IfIdRd1 == MemWbRd2))
	  Forward2 = 2'b10;
	else
	  Forward2 = 2'b00;        


	if((MemWbRegWrite1 && MemWbRd1 !=0) && (IfIdRn2 == MemWbRd1))
	  Forward3 = 2'b01;
	else if((MemWbRegWrite2 && MemWbRd2 !=0) && (IfIdRn2 == MemWbRd2))
	  Forward3 = 2'b10;
	else
	  Forward3 = 2'b00;    

	if((MemWbRegWrite1 && MemWbRd1 !=0) && (IfIdRd2 == MemWbRd1))
	  Forward4 = 2'b01;
	else if((MemWbRegWrite2 && MemWbRd2 !=0) && (IfIdRd2 == MemWbRd2))
	  Forward4 = 2'b10;
	else if((ExMemRegWrite1 && ExMemRd1 !=0) && (IfIdRd2 == ExMemRd1))
	  Forward4 = 2'b11;
	else
	  Forward4 = 2'b00;         
              
          
	// next stage
        if((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRd1))
          Forwarda = 2'b10;
        else if((MemWbRegWrite1 && MemWbRd1 !=0) && !((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRd1)) && (MemWbRd1 == IdExRd1))
          Forwarda = 2'b11;
        else if((MemWbRegWrite2 && MemWbRd2 !=0 ) && !((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRd1)) && (MemWbRd2 == IdExRd1))
          Forwarda = 2'b01;  
        else 
          Forwarda = 2'b00;
        if((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRn1))
          Forwardb = 2'b10;
        else if((MemWbRegWrite1 && MemWbRd1 !=0) && !((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRn1)) && (MemWbRd1 == IdExRn1))
          Forwardb = 2'b11;
        else if((MemWbRegWrite2 && MemWbRd2 !=0 ) && !((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRn1)) && (MemWbRd2 == IdExRn1))  
          Forwardb = 2'b01;
        //one more condition
        else
          Forwardb = 2'b00;
        if((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRn2))
          Forwardc = 2'b10;
        else if((MemWbRegWrite2 && MemWbRd2 !=0) && !((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRn2)) && (MemWbRd2 == IdExRn2)) 
          Forwardc = 2'b11;
        else if((MemWbRegWrite1 && MemWbRd1 !=0) && !((ExMemRegWrite1 && ExMemRd1 !=0) && (ExMemRd1 == IdExRn2)) && (MemWbRd1 == IdExRn2))
          Forwardc = 2'b01;
        else
          Forwardc = 2'b00;      
    end  
endmodule           
      
//oring negetive flag in mem stage of load and zero flag of load with n,Z of Ex
  module orgate(input NflagLoad, input ZflagLoad, input NflagEx, input ZflagEx, output reg N, output reg Z);
    
      always @(NflagLoad or ZflagLoad or NflagEx or ZflagEx )
        begin
          N = NflagLoad | NflagEx ;
          Z = ZflagLoad | ZflagLoad;
        end
  endmodule
  
module hazardunit(input idexMemRead, input[2:0] idexrd2, input[2:0] ifidrn2, input[2:0] ifidrd1, input[2:0] ifidrn1, output reg pcWrite, output reg ifidWrite, output reg flush);
	always @(idexMemRead or idexrd2 or ifidrn2 or ifidrd1 or ifidrn1)
	begin
		if((idexMemRead == 1'b1)&&(idexrd2 != 3'b000)&&((idexrd2 == ifidrn2) || (idexrd2 == ifidrd1) || (idexrd2 == ifidrn1)))
		begin
			pcWrite = 1'b0;
			ifidWrite = 1'b0;
			flush = 1'b1;
		end
		else
		begin
			pcWrite = 1'b1;
			ifidWrite = 1'b1;
			flush = 1'b0;
		end
	end

endmodule
// flag[1] = negative; flag[0] = zero
module loadflagsetter(input[15:0] memOut, output reg[1:0] flag);
	always @(memOut)
	begin
		if(memOut[15] == 1'b1)
			flag[1] = 1'b1;
		else
			flag[1] = 1'b0;
		if (memOut == 16'd0)
			flag[0] = 1'b1;
		else
			flag[0] = 1'b0;
	end
endmodule

module vliw(input clk, input reset, output[31:0] result1, output[31:0] result2);
	wire pcWrite;
	wire[31:0] pcOut;
	wire[31:0] pcIn;
	wire[31:0] imOut;
	wire[31:0] pcadderOut;
	wire[31:0] ifm32b21_1_Out;
	wire pcWriteCondAndC;
	wire[15:0] p0_instr1;
	wire[31:0] p0_pc_output;
	wire[15:0] p0_instr2;
	wire[31:0] p0_seext332_Out;
	wire[31:0] p0_seext532_Out;
	wire[31:0] p0_seext532_Out_Shift;
	wire[31:0] p0_seext1132_Out;
	wire[31:0] p0_seext832_Out;
	wire[31:0] branchJumpMuxOut;
	wire hazardPcWrite;
	wire hazardIfIdWrite;
	wire p0_hazardFlush;
	wire[31:0] outBusRn1;
	wire[31:0] outBusRd1;
	wire[31:0] outBusRn2;
	wire[31:0] outBusRd2;
	wire carryOut;
	wire overflowOut;
	wire negOut;
	wire zeroOut;
	wire[31:0] branchOrJump;
	wire[7:0] p0_controlMuxOut;
	wire[2:0] p1_inst_Rd1;
	wire[2:0] p1_inst_Rd2;
	wire[2:0] p1_inst_Rn1;
	wire[2:0] p1_inst_Rn2;
	wire[31:0] p1_reg_rd1;
    	wire[31:0] p1_reg_rd2;
	wire[31:0] p1_reg_rn1;
	wire[31:0] p1_reg_rn2;
	wire[31:0] p1_immediate;
	wire[31:0] p1_offset;
	wire p1_aluSrcB;
	wire p1_memRead;
	wire p1_memWrite;
    	wire p1_regWrite1;
	wire p1_regWrite2;
	wire[1:0] p1_aluOp;
	wire p1_instrException;
	wire[1:0] Forwarda;
	wire[1:0] Forwardb;
	wire[1:0] Forwardc;
	wire[1:0] Forward1;
	wire[1:0] Forward2;
	wire[1:0] Forward3;
	wire[1:0] Forward4;
	wire[31:0] muxAOut, muxBOut, muxCOut;
	wire[31:0] mux1Out, mux2Out, mux3Out, mux4Out;
	wire[31:0] aluIn2;
	wire[31:0] p1_AluOut;
	wire[31:0] p1_AdderOut;
	wire[4:0] p1_controlMuxOut;
	wire[31:0] p1_pc_output;
	wire p1_pcWrite;
	wire[31:0] p1_EPCIn;
	wire[31:0] p1_EPCOut;
	wire p1_causeOut;
	wire[3:0] p1_statusFlag;
	wire[3:0] p2_statusFlagNew;
	wire[3:0] p2_statusFlag;
	wire[2:0] p2_inst_Rd1;
	wire p2_regWrite1;
	wire[2:0] p2_inst_Rd2;
	wire[2:0] p2_inst_Rn1;
	wire[2:0] p2_inst_Rn2;
	wire[31:0] p2_AdderOut;
	wire[31:0] p2_AluOut;
	wire p2_pcWrite;
	wire  p2_memRead;
	wire p2_memWrite;
    	wire p2_regWrite2;
	wire p2_instrException;
	wire exceptionOrOut;
	wire[31:0] p2_reg_rd2;
	wire[15:0] p2_memOut;
	wire[1:0] p2_flag;
	wire[31:0] p2_memExtendedOut;
	wire[2:0] p3_inst_Rd1;
	wire[2:0] p3_inst_Rd2;
	wire p3_regWrite2;
	wire p3_regWrite1;
	wire[31:0] p3_Data,p3_AluOut;
	wire[3:0] p3_statusFlag;
	wire[2:0] p3_inst_Rn1;
	wire[2:0] p3_inst_Rn2;
	wire[31:0]p0_seext832_Out_Branch;
	wire[31:0]p0_seext1132_Out_Jump;
	// Signals
	wire aluSrcB;
	wire memRead;
	wire memWrite;
	wire regWrite1; 
	wire regWrite2;
	wire pcSel1;
	wire pcSel2;
	wire instrException;
	wire[1:0] aluOp;
	wire pcWriteCond;
	wire cuPcWrite;
	
	
	//
	  // pcwritecond to be on cu
	

	// IF Stage
	register32bit_pipeline pc(clk,reset, pcWrite,1'b1,pcIn,pcOut);
	instruction_Mem im(clk,reset,1'b0,1'b1,pcOut,16'd0,imOut);
	adder pcadder(pcOut,32'd4,pcadderOut);
	mux32bit2to1 ifm32b21_1(pcadderOut,branchOrJump,pcSel1,ifm32b21_1_Out);
	mux32bit2to1 ifm32b21_2(ifm32b21_1_Out,32'h80000180,exceptionOrOut,pcIn);
	assign pcWriteCondAndC = pcWriteCond & p1_statusFlag[3];
	assign pcWrite = pcWriteCondAndC | (hazardPcWrite & cuPcWrite);

	// IF/ID Stage
	// reset | exceptionOrOut
	// 0-15 R-type; 16 - 31 Lw / Sw/ B/ Jmp 
	IF_ID ifidpipiline(clk,reset|exceptionOrOut,hazardIfIdWrite,1'b1,imOut[15:0],imOut[31:16],pcadderOut, p0_instr1, p0_instr2, p0_pc_output);
	// p0_instr1 - R-type; p0_instr2 - Mem-Type
	
	// ID Stage
	ctrlCkt	cu(p0_instr1[15:6], p0_instr2[15:11],aluSrcB,memRead,memWrite,regWrite1,regWrite2,pcSel1,pcSel2,instrException,aluOp,pcWriteCond,cuPcWrite);
	registerFile regfile(clk,reset,p3_regWrite1,p0_instr1[5:3],p0_instr1[2:0],p3_inst_Rd1,p3_AluOut,p3_regWrite2,p0_instr2[5:3],p0_instr2[2:0],p3_inst_Rd2,p3_Data,outBusRn1,outBusRd1,outBusRn2,outBusRd2);
	//statusflags[3] - carryflag, statusflags[2] - overflow , statusflags[1] - negetive, statusflags[0] - zero 
	register1bit_pipeline cflag(clk,reset,p3_regWrite1,1'b1,p3_statusFlag[3],carryOut);
	register1bit_pipeline vflag(clk,reset,p3_regWrite1,1'b1,p3_statusFlag[2],overflowOut);
	register1bit_pipeline nflag(clk,reset,p3_regWrite1 | p3_regWrite2,1'b1,p3_statusFlag[1],negOut);
	register1bit_pipeline zflag(clk,reset, p3_regWrite1 | p3_regWrite2,1'b1,p3_statusFlag[0],zeroOut);

	// imm
	signExt3to32 p0_seext332(p0_instr1[8:6],p0_seext332_Out);
	// offset 
	signExt5to32 p0_seext532(p0_instr2[10:6],p0_seext532_Out);
	assign p0_seext532_Out_Shift = p0_seext532_Out << 1;
	//jump
	signExt11to32 p0_seext1132(p0_instr2[10:0],p0_seext1132_Out);
	assign p0_seext1132_Out_Jump = p0_seext1132_Out<< 1;
	
	signExt8to32 p0_seext832(p0_instr2[7:0],p0_seext832_Out);
	assign p0_seext832_Out_Branch = p0_seext832_Out << 1;
	
	mux32bit2to1 p0_m32b21_1(p0_seext1132_Out_Jump,p0_seext832_Out_Branch,pcSel2,branchJumpMuxOut);
	adder p0_pcadder(p0_pc_output,branchJumpMuxOut,branchOrJump);

	hazardunit hazard(p1_memRead, p1_inst_Rd2, p0_instr2[5:3],p0_instr1[2:0],p0_instr1[5:3],hazardPcWrite, hazardIfIdWrite,p0_hazardFlush);
	mux8bit2to1 p0_m8b21({{aluSrcB},{memRead},{memWrite},{regWrite1},{regWrite2},{aluOp[1:0]},{instrException}} ,8'd0,p0_hazardFlush|exceptionOrOut,p0_controlMuxOut);

	mux32bit4to1 p0_fm1(outBusRn1,p3_AluOut,p3_Data,p3_Data,Forward1,mux1Out);
    mux32bit4to1 p0_fm2(outBusRd1,p3_AluOut,p3_Data,p3_Data,Forward2,mux2Out);
	mux32bit4to1 p0_fm3(outBusRn2,p3_AluOut,p3_Data,p3_Data,Forward3,mux3Out);
	mux32bit4to1 p0_fm4(outBusRd2,p3_AluOut,p3_Data,p2_AluOut,Forward4,mux4Out);


	// ID/EX Stage
	ID_EX idexpipeline(clk,reset,1'b1,1'b1,p0_instr1[2:0],p0_instr2[2:0],p0_instr1[5:3],p0_instr2[5:3],mux2Out,mux4Out,mux1Out,mux3Out,p0_seext332_Out,p0_seext532_Out_Shift,p0_controlMuxOut[7],p0_controlMuxOut[6],p0_controlMuxOut[5],p0_controlMuxOut[4],p0_controlMuxOut[3],p0_controlMuxOut[2:1],p0_controlMuxOut[0],p0_pc_output, cuPcWrite,
	p1_inst_Rd1,p1_inst_Rd2,p1_inst_Rn1,p1_inst_Rn2,p1_reg_rd1,p1_reg_rd2,p1_reg_rn1,p1_reg_rn2,p1_immediate,p1_offset,p1_aluSrcB,p1_memRead,p1_memWrite,
	p1_regWrite1,p1_regWrite2,p1_aluOp,p1_instrException,p1_pc_output, p1_pcWrite);

	// EX Stage
	ForawardingUnit forward(p0_instr1[5:3],p0_instr1[2:0],p0_instr2[5:3], p0_instr2[2:0],p2_inst_Rd1,p1_inst_Rd1,p1_inst_Rn1,p1_inst_Rn2,p3_inst_Rd1,p3_inst_Rd2,p2_regWrite1,p3_regWrite1,p3_regWrite2,p3_inst_Rn1,p3_inst_Rn2,p1_inst_Rd2,Forwarda,Forwardb,Forwardc,Forward1,Forward2,Forward3,Forward4);
	
	mux32bit4to1 A(p1_reg_rn1,p3_Data,p2_AluOut,p3_AluOut,Forwarda,muxAOut);
        mux32bit4to1 B(p1_reg_rd1,p3_Data,p2_AluOut,p3_AluOut,Forwardb,muxBOut);
	mux32bit4to1 C(p1_reg_rn2,p3_AluOut,p2_AluOut,p3_Data,Forwardc,muxCOut);
  
	mux32bit2to1 p1_m32b211(muxBOut,p1_immediate,p1_aluSrcB,aluIn2);
	alu p1_alu(muxAOut,aluIn2,p1_aluOp,p2_statusFlag[3],p1_AluOut,p1_statusFlag);
	adder p1_adder(muxCOut,p1_offset,p1_AdderOut);

	mux5bit2to1 p1_m5b211({{p1_memRead},{p1_memWrite},{p1_regWrite1},{p1_regWrite2},{p1_instrException}} ,5'd0,exceptionOrOut,p1_controlMuxOut);

	subtractor subtract(p1_pc_output,32'd4,p1_EPCIn);
	register32bit_pipeline epc(clk,reset,exceptionOrOut,1'b1,p1_EPCIn,p1_EPCOut);
	
	register1bit_pipeline cause(clk,reset,exceptionOrOut,1'b1,p1_instrException,p1_causeOut);

	assign exceptionOrOut = p1_instrException | p1_statusFlag[2];


	// EX/MEM Stage
	EX_MEM exmempipeline(clk,reset,1'b1,1'b1,p1_inst_Rd1,p1_inst_Rd2,p1_inst_Rn1,p1_inst_Rn2,p1_AluOut, p1_AdderOut,p1_controlMuxOut[4],
   p1_controlMuxOut[3],p1_controlMuxOut[2],p1_controlMuxOut[1],p1_statusFlag,p1_controlMuxOut[0],p1_reg_rd2, p1_pcWrite, p2_inst_Rd1,p2_inst_Rd2,p2_inst_Rn1,p2_inst_Rn2,
     p2_AdderOut,p2_AluOut,p2_memRead,p2_memWrite,p2_regWrite1,p2_regWrite2,p2_statusFlag,p2_instrException,p2_reg_rd2, p2_pcWrite);
	
	// MEM Stage

	data_Mem dm(clk,reset,p2_memWrite,p2_memRead,p2_AdderOut,p2_reg_rd2[15:0],p2_memOut);
	loadflagsetter p2_lfs(p2_memOut,p2_flag);
	
	zeroExt16to32 p2_zero16to32(p2_memOut,p2_memExtendedOut);

	assign p2_statusFlagNew[1] = p2_statusFlag[1] | p2_flag[1];
	assign p2_statusFlagNew[0] = p2_statusFlag[0] | p2_flag[0];
	assign p2_statusFlagNew[3:2] = p2_statusFlag[3:2];

	// MEM/WB Stage
	MEM_WB memwbpipeline(clk,reset,1'b1,1'b1,p2_inst_Rd1,p2_inst_Rd2,p2_inst_Rn1,p2_inst_Rn2,p2_AluOut,p2_memExtendedOut,p2_regWrite1,p2_regWrite2,p2_statusFlagNew, 
    p3_inst_Rd1,p3_inst_Rd2,p3_inst_Rn1,p3_inst_Rn2,p3_AluOut,p3_Data,p3_regWrite1,p3_regWrite2,p3_statusFlag);
	
	assign result1 = p3_AluOut;
	assign result2 = p3_Data;

endmodule

module vliwTestBench;
	reg clk;
	reg reset;
	wire [31:0] result1;
	wire [31:0] result2;
	vliw uut (.clk(clk), .reset(reset), .result1(result1), .result2(result2));

	always
	#5 clk=~clk;
	
	initial
	begin
		clk=0; reset=1;
		#10  reset=0;	
		
		#210 $finish; 
	end
endmodule









