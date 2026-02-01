module DataMem(
input clk, MemRead, MemWrite,
input [31:0] addr, WriteData,
output reg [31:0] ReadData
);

reg [31:0] mem[0:255];

always @(posedge clk) begin
    if(MemWrite) mem[addr[9:2]] <= WriteData;
    if(MemRead) ReadData <= mem[addr[9:2]];
end

endmodule

