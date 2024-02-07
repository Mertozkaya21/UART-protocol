`timescale 1ns / 1ps

module receiver#(parameter WIDTH = 8, DEPTH = 4,STOP_BIT = 2'b00, TOTAL_BITS = 10)
    (
    input logic clk,
    input logic reset,
    input logic RXserial,
    output logic [DEPTH-1:0][WIDTH+1:0] RXBUF
    );
    
    //logic [DEPTH-1:0] [WIDTH+1:0]RXBUF; // the buffer that we load the data
    logic [24:0] counter; // counts the baud rate (21 is enough but allocate extra memory)
    logic [3:0] bitcounter; // Counts the number of bits.
    logic [WIDTH+1:0] data; // This stores the received bits
    logic [1:0] switchstateCounter;
    
    typedef enum logic [1:0] {idlestate ,waitstate,receivestate} statetype;
    statetype state;
    
    always_ff @(posedge clk, posedge reset)begin
        if(reset == 1'b1) begin
            counter <= 0;
            bitcounter <= 0;
            RXBUF <= 40'b0;
            state <= idlestate;
        end else begin
            case (state)
                idlestate: begin
                    counter <= 0;
                    bitcounter <= 0;
                    if(RXserial == 1'b0) begin// check whether or not the system turns off 0 bit.
                        state <= receivestate;
                    end
                end
                
                waitstate: begin
                    state <= receivestate;
                end
                
                receivestate: begin
                    bitcounter <= bitcounter + 1;
                    data <= {RXserial, data[WIDTH+1:1]};
                    if(bitcounter == TOTAL_BITS) begin
                        RXBUF <= {RXBUF[DEPTH-2:0],data};
                        state <= idlestate;
                    end    
                end
            endcase 
        end
    end
endmodule


