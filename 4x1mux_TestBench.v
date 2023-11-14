module tb_mux4x1();
reg a,b,c,d,s1,s2;
wire y;

mux4x1 tb_mux4x1(a,b,c,d,s1,s2,y);

initial
begin
a = 1'b0;
b = 1'b0;
c = 1'b0;
d = 1'b0;
s1 = 1'b0;
s2 = 1'b0;
#64 $stop;
end

always #32 s1 = ~s1;
always #16 s2 = ~s2;
always #8 a = ~a;
always #4 b = ~b;
always #2 c = ~c;
always #1 d = ~d;


endmodule
