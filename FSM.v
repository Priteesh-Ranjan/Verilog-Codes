`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: NIT Rourkela 
// Create Date: 01.02.2023 23:10:07
// Design Name: Priteesh Ranjan
// Module Name: Finite State Machine
// Module Name: Finite State Machine (FSM) for Sequence Detection
// Description: This module detects the sequence "11010" in a serial input stream (A).
//              It transitions through states based on the input and generates an
//              output (Y) when the sequence is detected.
//////////////////////////////////////////////////////////////////////////////////


module fsm2(
  input clk,
  input rstn,
  input in,
  output out
);

  // Define states using parameters
  parameter IDLE = 0,
            S1 = 1,
            S11 = 2,
            S110 = 3,
            S1101 = 4,
            S11010 = 5;
  
  // Registers to hold current and next state
  reg [2:0] cur_state, next_state;
  
  // Output assignment based on current state
  assign out = (cur_state == S11010) ? 1 : 0;
  
  // State transition process triggered on positive clock edge
  always @ (posedge clk) begin
    if (!rstn)   // Asynchronous active-low reset
      cur_state <= IDLE;
    else
      cur_state <= next_state;  // Update current state based on next_state
  end

  // State transition logic based on current state and input
  always @ (cur_state or in) begin
    case (cur_state)
      IDLE : begin
        if (in)
          next_state = S1;  // Transition to state S1 upon input assertion
        else
          next_state = IDLE;  // Remain in IDLE state otherwise
      end

      S1: begin
        if (in)
          next_state = S11;  // Transition to state S11 upon continued input assertion
        else
          next_state = IDLE;  // Return to IDLE state upon input deassertion
      end

      S11: begin
        if (!in)
          next_state = S110;  // Transition to state S110 upon input deassertion
        else
          next_state = S11;  // Remain in S11 state upon input assertion
      end

      S110 : begin
        if (in)
          next_state = S1101;  // Transition to state S1101 upon input assertion
        else
          next_state = IDLE;  // Return to IDLE state upon input deassertion
      end

      S1101 : begin
        if (!in)
          next_state = S11010;  // Transition to state S11010 upon input deassertion
        else
          next_state = IDLE;  // Return to IDLE state upon input assertion
      end

      S11010: begin
        if (in)
          next_state = IDLE;  // Return to IDLE state upon input assertion
        else
          next_state = IDLE;  // Remain in S11010 state upon input deassertion
      end
    endcase
  end
endmodule
