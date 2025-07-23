module test;
reg [15:0]x,y;
wire [15:0]z;
wire sign,zero,carry,parity,overflow;
alu dut(x,y,z,sign,zero,carry,parity,overflow);
initial
begin
$monitor($time,"x=%h,y=%h,z=%h,sign=%b,zero=%b,carry=%b,parity=%b,overflow=%b",x,y,z,sign,zero,carry,parity,overflow);
x=16'h8fff;y=16'h8000;
#5 x=16'hfffe;y=16'h0002;
#5 x=16'haaaa;y=16'h5555;
#5 $finish;
end
endmodule


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
