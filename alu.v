`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2013
// Design Name:
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
           clk,           // system clock              (input)
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );

input           clk;
input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;

reg          zero;
reg          overflow;
reg          cout;
reg [32-1:0] result;

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

wire   [32-1:0] carry;
wire   [32-1:0] r;
wire     [2-1:0] operation;
wire             less;
wire            A_invert;
wire            B_invert;
wire            first;
reg             tmp1;
reg             tmp2;
    
always@( posedge clk or negedge rst_n) 
begin
    if(!rst_n)     
        begin     
        
	     //zero = zero;
         //overflow = overflow;
         //cout = cout;
         //result = result; 

        end
    else begin
         
        result = r;
        zero = (result == 0)? 1: 0;
        cout = (operation == 2)? carry[31] : 0; 
        overflow = ((src1[31]&(src2[31]^B_invert))^result[31])&(B_invert^A_invert)&~(src1[31]^src2[31]);
         
	end

end

assign A_invert = ALU_control[3];
assign B_invert = ALU_control[2];
assign operation = ALU_control[1:0];
assign first = (ALU_control == 4'b0110)? 1: (ALU_control == 4'b0111)? 1: 0;
assign less = (src1[31]^(~src2[31])^carry[30]);

alu_top a0(.src1(src1[0]), .src2(src2[0]), .less(less), .A_invert(A_invert), .B_invert(B_invert), .cin(first), .operation(operation), .result(r[0]), .cout(carry[0]));
alu_top a1(.src1(src1[1]), .src2(src2[1]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[0]), .operation(operation), .result(r[1]), .cout(carry[1]));
alu_top a2(.src1(src1[2]), .src2(src2[2]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[1]), .operation(operation), .result(r[2]), .cout(carry[2]));
alu_top a3(.src1(src1[3]), .src2(src2[3]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[2]), .operation(operation), .result(r[3]), .cout(carry[3]));
alu_top a4(.src1(src1[4]), .src2(src2[4]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[3]), .operation(operation), .result(r[4]), .cout(carry[4]));
alu_top a5(.src1(src1[5]), .src2(src2[5]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[4]), .operation(operation), .result(r[5]), .cout(carry[5]));
alu_top a6(.src1(src1[6]), .src2(src2[6]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[5]), .operation(operation), .result(r[6]), .cout(carry[6]));
alu_top a7(.src1(src1[7]), .src2(src2[7]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[6]), .operation(operation), .result(r[7]), .cout(carry[7]));
alu_top a8(.src1(src1[8]), .src2(src2[8]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[7]), .operation(operation), .result(r[8]), .cout(carry[8]));
alu_top a9(.src1(src1[9]), .src2(src2[9]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[8]), .operation(operation), .result(r[9]), .cout(carry[9]));
alu_top a10(.src1(src1[10]), .src2(src2[10]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[9]), .operation(operation), .result(r[10]), .cout(carry[10]));
alu_top a11(.src1(src1[11]), .src2(src2[11]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[10]), .operation(operation), .result(r[11]), .cout(carry[11]));
alu_top a12(.src1(src1[12]), .src2(src2[12]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[11]), .operation(operation), .result(r[12]), .cout(carry[12]));
alu_top a13(.src1(src1[13]), .src2(src2[13]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[12]), .operation(operation), .result(r[13]), .cout(carry[13]));
alu_top a14(.src1(src1[14]), .src2(src2[14]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[13]), .operation(operation), .result(r[14]), .cout(carry[14]));
alu_top a15(.src1(src1[15]), .src2(src2[15]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[14]), .operation(operation), .result(r[15]), .cout(carry[15]));
alu_top a16(.src1(src1[16]), .src2(src2[16]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[15]), .operation(operation), .result(r[16]), .cout(carry[16]));
alu_top a17(.src1(src1[17]), .src2(src2[17]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[16]), .operation(operation), .result(r[17]), .cout(carry[17]));
alu_top a18(.src1(src1[18]), .src2(src2[18]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[17]), .operation(operation), .result(r[18]), .cout(carry[18]));
alu_top a19(.src1(src1[19]), .src2(src2[19]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[18]), .operation(operation), .result(r[19]), .cout(carry[19]));
alu_top a20(.src1(src1[20]), .src2(src2[20]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[19]), .operation(operation), .result(r[20]), .cout(carry[20]));
alu_top a21(.src1(src1[21]), .src2(src2[21]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[20]), .operation(operation), .result(r[21]), .cout(carry[21]));
alu_top a22(.src1(src1[22]), .src2(src2[22]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[21]), .operation(operation), .result(r[22]), .cout(carry[22]));
alu_top a23(.src1(src1[23]), .src2(src2[23]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[22]), .operation(operation), .result(r[23]), .cout(carry[23]));
alu_top a24(.src1(src1[24]), .src2(src2[24]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[23]), .operation(operation), .result(r[24]), .cout(carry[24]));
alu_top a25(.src1(src1[25]), .src2(src2[25]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[24]), .operation(operation), .result(r[25]), .cout(carry[25]));
alu_top a26(.src1(src1[26]), .src2(src2[26]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[25]), .operation(operation), .result(r[26]), .cout(carry[26]));
alu_top a27(.src1(src1[27]), .src2(src2[27]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[26]), .operation(operation), .result(r[27]), .cout(carry[27]));
alu_top a28(.src1(src1[28]), .src2(src2[28]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[27]), .operation(operation), .result(r[28]), .cout(carry[28]));
alu_top a29(.src1(src1[29]), .src2(src2[29]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[28]), .operation(operation), .result(r[29]), .cout(carry[29]));
alu_top a30(.src1(src1[30]), .src2(src2[30]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[29]), .operation(operation), .result(r[30]), .cout(carry[30]));
alu_top a31(.src1(src1[31]), .src2(src2[31]), .less(0), .A_invert(A_invert), .B_invert(B_invert), .cin(carry[30]), .operation(operation), .result(r[31]), .cout(carry[31]));

endmodule

