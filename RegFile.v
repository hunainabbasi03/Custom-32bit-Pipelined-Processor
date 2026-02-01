module RegFile(
input clk, RegWrite,
input [4:0] rs, rt, rd,
input [31:0] WriteData,
output [31:0] ReadData1, ReadData2
);

reg [31:0] regs[31:0];

assign ReadData1 = regs[rs];
assign ReadData2 = regs[rt];

always @(posedge clk)
    if(RegWrite)
        regs[rd] <= WriteData;

endmodule

