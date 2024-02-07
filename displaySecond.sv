`timescale 1ns / 1ps

module displaySecond #(parameter WIDTH = 8, DEPTH = 4)
    (
    input logic clk,
    input logic reset,
    output logic BTNR,
    output logic BTNL,
    output logic BTNU,
    output logic lastLed,
    output logic [1:0] stateLed
    );
    
    typedef enum logic [1:0] {S0,S1,S2,S3} statetype;
    statetype state, nextstate;
    
    reg [4:0] counter;
    reg [32:0] clkdiv;
    
always_ff @(posedge clk) begin
    if(reset) begin
        state <= S0;
        clkdiv <= 0;
        counter <= 0;
    end else begin
            case (state)
        S0: begin
            lastLed <= 1'b0;
            stateLed <= 2'b01;
            if(BTNU == 1'b1) begin
                state <= S1;
            end 
            if(BTNR || BTNL) begin
                state <= S2;
            end
        end
        S1: begin
            lastLed <= 1'b1;
            stateLed <= 2'b01;
            if(BTNU == 1'b1) begin
                state <= S0;
            end
            if (BTNR == 1'b1 || BTNL == 1'b1) begin
                state <= S3;
            end
        end
        
        S2: begin
            lastLed <= 1'b0;
            stateLed <= 2'b10;
            if(BTNU == 1'b1) begin
                state <= S1;
            end
            if (BTNR== 1'b1 || BTNL == 1'b1) begin
                state <= S0;
            end      
        end
        
        S3: begin
            lastLed <= 1'b1;
            stateLed <= 2'b10;
            if(BTNU == 1'b1) begin
                state <= S0;
            end
            if (BTNR == 1'b1 || BTNL == 1'b1) begin
                state <= S1;
            end
        end
        default: state <= S0;  
    endcase
            
    end
end

endmodule