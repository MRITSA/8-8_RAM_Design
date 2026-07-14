module ram8x8_tb;
reg clk,reset,we;
reg[2:0] addr;
reg [7:0] din;
wire[7:0] dout;

ram_8x8 uut(.clk(clk),.reset(reset),.we(we),.addr(addr),.din(din),.dout(dout));

always #5 clk=~clk;
initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0,ram8x8_tb);

    clk=0;reset=1;we=0;addr=0;din=0;

    #10 reset=0;
    #10;
    we=1;
    addr=3'b101;
    din=8'b10101010;

    #10;
    we=0;
    addr=3'b011;
    #10;
    reset=0;
    #10;reset=0;
    #10;
    addr=3'b011;   #20;
    $finish;
end
initial begin
   $monitor("time=%0t |reset=%b | we=%b | addr=%d | Din=%b | Dout=%b",
   $time,reset,we,addr,din,dout);
   end
endmodule
