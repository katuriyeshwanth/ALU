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
