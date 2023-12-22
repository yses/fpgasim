module seg(
  input wire clk,
  input wire rst_n,
  output wire[7:0] SEG,
  output wire[3:0] SEL
);

reg[7:0]  digit[0:15] = '{8'h3f, 8'h06, 8'h5b, 8'h4f, 8'h66, 8'h6d, 8'h7d,8'h07,
                          8'h7f,8'h6f, 8'h77, 8'h7c, 8'h39, 8'h5e, 8'h79, 8'h71};

reg[31:0] cnt = 32'h0000000000;

always @(posedge clk or negedge rst_n) begin
  if (!rst_n)
    cnt <= 32'h00000000;
  else
   cnt <= cnt + 1;
end

reg[1:0] shift;

assign shift = cnt[16:15];

assign SEL = 4'b0001 << shift;
assign SEG = digit[4'(cnt[31:20]>>shift*4)];

endmodule
