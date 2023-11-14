`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: NIT Rourkela 
// Create Date: 01.02.2023 23:10:07
// Design Name: Priteesh Ranjan
// Module Name: Finite State Machine
// Project Name: FSM
//////////////////////////////////////////////////////////////////////////////////

module fsm_11010 (
    input A, // serial bit Input sequence
    input clk, // clock signal
    input reset, // reset signal
    output reg Y // Output
);

// Enumeration for states
typedef enum logic [2:0] {
    S0, S1, S2, S3, S4
} state_type;

// State registers
reg state_reg, next_state_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Synchronous Reset
        state_reg <= S0;
    end else begin
        // Rising edge of Clock
        state_reg <= next_state_reg;
    end
end

always @(state_reg or A) begin
    // Output default value
    Y = 0;

    case (state_reg)
        S0: begin
            if (A) begin
                next_state_reg = S1;
            end else begin
                next_state_reg = S0;
            end
        end

        S1: begin
            if (A) begin
                next_state_reg = S2;
            end else begin
                next_state_reg = S0;
            end
        end

        S2: begin
            if (A) begin
                next_state_reg = S2;
            end else begin
                next_state_reg = S3;
            end
        end

        S3: begin
            if (A) begin
                next_state_reg = S4;
            end else begin
                next_state_reg = S0;
            end
        end

        S4: begin
            if (A) begin
                next_state_reg = S2;
                Y = 1;
            end else begin
                next_state_reg = S0;
            end
        end

        default: begin
            // Do nothing for other states
        end
    endcase
end

endmodule
