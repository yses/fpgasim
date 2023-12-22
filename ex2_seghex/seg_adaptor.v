module seg_adaptor(
  input wire clk,
  input wire[7:0] SEG,
  input wire[3:0] SEL
);
import "DPI-C"  function void  print(byte seg, byte sel);
reg[3:0] state = 4'b0001 ;

always @(posedge clk)
  if (state != SEL) begin
    print(byte'(SEG),byte'(SEL));
    state <= SEL;
  end

endmodule
