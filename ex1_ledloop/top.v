module top;
wire[3:0] led;
reg clk = 1'b0;

initial begin
  forever #1  clk = ~clk;
end

ledloop  loop1(.clk(clk),
          .LED(led));

led_adaptor  adaptor1(.clk(clk),
		.LED(led));

endmodule
