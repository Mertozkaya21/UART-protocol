`timescale 1ns / 1ps

module buttonSync(
    input logic bi,
    input logic reset,
    input logic clk,
    output logic bo
    );
    
    typedef enum logic [1:0] {S0,S1,S2} statetype;
    statetype state;
    reg [16:0] counter;
    
    always_ff @(posedge clk)begin
    if(reset == 1'b1)begin
        bo <= 1'b0;
        state <= S0;
    end else  begin
        case (state)
            S0: begin
                bo <= 1'b0;
                if(bi == 1'b1)begin 
                    state <= S1;
                end else begin
                    state <= S0;
                end
            end
            
            S1: begin
                bo <= 1'b1;      
                if(bi == 1'b0)begin
                        state <= S0;
                    end else begin
                        state <= S2;
                    end
            end
            
            S2: begin
                bo <= 1'b0;
                if(bi == 1'b1) begin
                    state <= S2;
                end else begin
                    state <= S0;
                end
            end
            default: begin
                bo <= 1'b0;
                if(bi == 1'b1)begin 
                    state <= S1;
                end
            end
        endcase
    end 
    end
endmodule