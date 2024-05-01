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

module fsm_11010 (
    input A,       // Serial bit input sequence
    input clk,     // Clock signal
    input reset,   // Reset signal
    output reg Y   // Output indicating sequence detection
);

// Enumeration for states
typedef enum logic [2:0] {
    S0, S1, S2, S3, S4
} state_type;

// State registers
reg state_reg, next_state_reg;

// State transition and output generation logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Synchronous Reset: Reset to initial state S0
        state_reg <= S0;
    end else begin
        // Update state on positive clock edge
        state_reg <= next_state_reg;
    end
end

// State transition and output assignment logic
always @(state_reg or A) begin
    // Default output value
    Y = 0;

    // State transition logic based on current state (state_reg) and input (A)
    case (state_reg)
        S0: begin
            if (A) begin
                next_state_reg = S1; // Transition to S1 on input '1'
            end else begin
                next_state_reg = S0; // Remain in S0 on input '0'
            end
        end

        S1: begin
            if (A) begin
                next_state_reg = S2; // Transition to S2 on input '1'
            end else begin
                next_state_reg = S0; // Reset to S0 on input '0'
            end
        end

        S2: begin
            if (A) begin
                next_state_reg = S2; // Remain in S2 on input '1'
            end else begin
                next_state_reg = S3; // Transition to S3 on input '0'
            end
        end

        S3: begin
            if (A) begin
                next_state_reg = S4; // Transition to S4 on input '1'
            end else begin
                next_state_reg = S0; // Reset to S0 on input '0'
            end
        end

        S4: begin
            if (A) begin
                next_state_reg = S2; // Transition back to S2 on input '1'
                Y = 1;              // Output '1' when sequence "11010" is detected
            end else begin
                next_state_reg = S0; // Reset to S0 on input '0'
            end
        end

        default: begin
            // Default case: No action needed for other states
        end
    endcase
end

endmodule

