module top;
wire[7:0] seg;
wire[3:0] sel;
reg clk = 1'b0;
reg rst_n = 1'b0;

initial begin
  #10 rst_n = 1'b1;
  forever #1  clk = ~clk;
end

seg  seg1(.clk(clk),
          .rst_n(rst_n),
          .SEG(seg),
          .SEL(sel));

seg_adaptor  adaptor1(.clk(clk),
                      .SEG(seg),
                      .SEL(sel));

endmodule
