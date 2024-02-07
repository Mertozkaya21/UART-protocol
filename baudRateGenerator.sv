`timescale 1ns / 1ps

module baudRateGenerator #(parameter BAUD_RATE = 868)
    (
    input logic clk,
    output logic clkOut
    );
    
    reg [32:0] counter;
    initial clkOut = 0;
    
    always_ff @(posedge clk) begin
        if(counter == BAUD_RATE) begin
            counter <= 0;
            clkOut <= ~clkOut;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule
