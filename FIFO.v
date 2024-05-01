`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: NIT Rourkela 
// Create Date: 02.03.2023 12:16:24
// Design Name: Priteesh Ranjan
// Module Name: FIFO
// Project Name: FIFO 
// Description: This module implements a simple 8-entry FIFO (First-In-First-Out) buffer.
//              It supports read (RD) and write (WR) operations, as well as reset (Rst),
//              clock (Clk), enable (EN), and data interfaces.
//////////////////////////////////////////////////////////////////////////////////




module fifo_nit( 
    input  Clk,       // Clock input
    input  RD,        // Read enable
    input  WR,        // Write enable
    input  EN,        // Module enable
    input  [31:0] dataIn,   // Data input
    output reg [31:0] dataOut,  // Data output
    input  Rst,       // Reset
    output EMPTY,     // Empty flag
    output FULL       // Full flag
);

reg [2:0] Count = 0;            // Counter to track number of valid entries
reg [31:0] FIFO [0:7];          // Array to store FIFO data
reg [2:0] readCounter = 0;      // Read pointer
reg [2:0] writeCounter = 0;     // Write pointer

// Determine if FIFO is empty or full
assign EMPTY = (Count == 0) ? 1'b1 : 1'b0;
assign FULL = (Count == 8) ? 1'b1 : 1'b0;

// Sequential logic for FIFO operation on positive clock edge
always @ (posedge Clk) begin
    if (EN == 1'b0);  // Module disabled, do nothing
    else begin
        if (Rst) begin
            // Reset FIFO pointers and counters
            readCounter <= 0;
            writeCounter <= 0;
            Count <= 0;
        end
        else begin
            // Read operation
            if (RD == 1'b1 && Count != 0) begin
                // Output data from FIFO
                dataOut <= FIFO[readCounter];
                // Increment read pointer
                readCounter <= readCounter + 1;
                // Decrement count of valid entries
                Count <= Count - 1;
            end
            // Write operation
            else if (WR == 1'b1 && Count < 8) begin
                // Write data into FIFO
                FIFO[writeCounter] <= dataIn;
                // Increment write pointer
                writeCounter <= writeCounter + 1;
                // Increment count of valid entries
                Count <= Count + 1;
            end
        end
    end

    // Wrap around logic for pointers
    if (writeCounter == 8)
        writeCounter <= 0;
    else if (readCounter == 8)
        readCounter <= 0;
end

endmodule
