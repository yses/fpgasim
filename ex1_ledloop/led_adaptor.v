module led_adaptor(
  input wire clk,
  input wire[3:0] LED
);
import "DPI-C"  function void  print(int a);
reg[3:0] state ;

always @(posedge clk)
  if (state != LED) begin
    print(int'(LED));
    state <= LED;
  end

endmodule
