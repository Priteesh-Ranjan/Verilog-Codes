module fsm_tb;

  // Port declarations for the testbench
  reg clk;
  reg reset;
  reg A;
  wire Y;

  // Instantiate the module under test
  fsm_11010 uut (
    .A(A),
    .clk(clk),
    .reset(reset),
    .Y(Y)
  );

  // Clock generation process
  always #5 clk = ~clk;

  // Stimulus generation
  initial begin
    clk = 0;
    reset = 0;
    A = 1;
    #10 A = 1;
    #10 A = 0;
    #10 A = 1;
    #10 A = 0;
    #10 A = 1;
    #10 A = 0;
    #10 A = 1;
    #10 A = 1;
    #10 A = 0;
    #10 A = 1;
    #10 A = 0;
    #10;
  end

endmodule
