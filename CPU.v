module CPU(input clk);

wire [31:0] pc,nextPC,instr;

PC pc0(clk,nextPC,pc);
assign nextPC=pc+4;

InstrMem imem(pc,instr);

// IF/ID
wire [31:0] if_instr;
IF_ID ifid(clk,pc,instr,,if_instr);

// Decode
wire [4:0] rs=if_instr[25:21];
wire [4:0] rt=if_instr[20:16];
wire [4:0] rd=if_instr[15:11];

wire [31:0] rd1,rd2;

wire [31:0] wb_data;
wire [4:0] wb_rd;

RegFile rf(clk,1'b1,rs,rt,wb_rd,wb_data,rd1,rd2);

// ID/EX
wire [31:0] ex_a,ex_b;
wire [4:0] ex_rd;

ID_EX idex(clk,rd1,rd2,rd,ex_a,ex_b,ex_rd);

// Execute
wire [31:0] alu_out;
ALU alu(ex_a,ex_b,3'b000,alu_out,);

// EX/MEM
wire [31:0] mem_in;
wire [4:0] mem_rd;

EX_MEM exmem(clk,alu_out,ex_rd,mem_in,mem_rd);

// MEM (pass through)
wire [31:0] mem_data = mem_in;

// MEM/WB
MEM_WB memwb(clk,mem_data,mem_rd,wb_data,wb_rd);

endmodule

