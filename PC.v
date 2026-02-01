module PC(input clk,input [31:0] nextPC,output reg [31:0] pc);

initial pc=0;

always @(posedge clk)
    pc<=nextPC;

endmodule

