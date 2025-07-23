Behavioral modelling
module alu(x,y,z,sign,zero,carry,parity,overflow);
input [15:0]x,y;
output [15:0]z;
output sign,zero,carry,parity,overflow;
assign {carry,z}=x+y;
assign sign=z[15];
assign zero=~|z;
assign parity=~^z;
assign overflow=(x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);
endmodule

structural modelling

module adder4(s,cout,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
assign {cout,s}=a+b+cin;
endmodule

module alu(x,y,z,sign,zero,carry,parity,overflow);
input [15:0]x,y;
output [15:0]z;
output sign,zero,carry,parity,overflow;
wire [3:1]c;
assign sign=z[15];
assign zero=~|z;
assign parity=~^z;
assign overflow=(x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);
adder4 a0(z[3:0],c[1],x[3:0],y[3:0],1'b0);
adder4 a1(z[7:4],c[2],x[7:4],y[7:4],c[1]);
adder4 a2(z[11:8],c[3],x[11:8],y[11:8],c[2]);
adder4 a3(z[15:12],carry,x[15:12],y[15:12],c[3]);
endmodule

Using Case statement
module alu4_bit(op,a,b,f);
input [1:0]op;
input [7:0]a,b;
output reg [7:0]f;
parameter add=2'b00,sub=2'b01,mul=2'b10,div=2'b11;
always @(*)
begin
case (op)
add : f=a+b;
sub : f=a-b;
mul : f=a*b;
div : f=(b!=0)? a/b : 8'h00; //prevent division by zero
default f=8'h00;
endcase
end
endmodule
