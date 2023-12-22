module ledloop(
  input wire clk,
  output wire[3:0] LED
);

  reg[31:0] cnt = 32'h00000000;

  always @(posedge clk)
     cnt <= cnt + 1;

  assign LED = 4'b0001 << cnt[21:20];
endmodule
