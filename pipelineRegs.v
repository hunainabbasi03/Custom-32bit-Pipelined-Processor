module IF_ID(input clk,input [31:0] pc_in,instr_in,
output reg [31:0] pc_out,instr_out);
always @(posedge clk) begin
pc_out<=pc_in;
instr_out<=instr_in;
end
endmodule


module ID_EX(input clk,input [31:0] a,b,
input [4:0] rd_in,
output reg [31:0] a_o,b_o,
output reg [4:0] rd_o);
always @(posedge clk) begin
a_o<=a; b_o<=b; rd_o<=rd_in;
end
endmodule


module EX_MEM(input clk,input [31:0] alu,
input [4:0] rd_in,
output reg [31:0] alu_o,
output reg [4:0] rd_o);
always @(posedge clk) begin
alu_o<=alu; rd_o<=rd_in;
end
endmodule


module MEM_WB(input clk,input [31:0] data,
input [4:0] rd_in,
output reg [31:0] data_o,
output reg [4:0] rd_o);
always @(posedge clk) begin
data_o<=data; rd_o<=rd_in;
end
endmodule

