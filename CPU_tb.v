module CPU_tb;

reg clk;
CPU uut(clk);

always #5 clk=~clk;

initial begin
clk=0;
#300 $finish;
end

endmodule

