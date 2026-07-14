module ram_8x8(input clk,reset,we,
input [2:0] addr,
input [7:0] din,
output reg [7:0] dout);

reg[7:0] mem [0:7];
integer i;

always@(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=0;i<8;i++)
          mem[i]<=8'b0;
        dout<=8'b0;
    end
    else begin
        if(we)
          mem[addr]<=din;
          else
          dout<=mem[addr];
    end
end
endmodule   
