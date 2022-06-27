`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:01 10/10/2013
// Design Name: 
// Module Name:    alu_top 
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

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output       result;
output       cout;

reg          result;

wire r0, r1, r2, r3;
wire tmp1, tmp2;

assign tmp1 = A_invert ? ~src1: src1;
assign tmp2 = B_invert ? ~src2: src2;
assign {cout,r2} = tmp1 + tmp2 + cin;

and g1(r0, tmp1, tmp2);
or  g2(r1, tmp1, tmp2);

always@(*)
begin   
    case(operation)
        0: result = r0; //AND or NOR
        1: result = r1;
        2: result = r2; 
        3: result = less;
    endcase
    
end

endmodule
