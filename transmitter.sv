`timescale 1ns / 1ps

module transmitter#(parameter WIDTH = 8, DEPTH = 4,STOP_BIT = 2'b11,TOTAL_BITS = 10)
    (
    input logic clk,
    input logic reset,
    output logic BTND,
    output logic BTNC,
    output logic switch,
    input logic [WIDTH-1:0]data,
    output logic TXserial,
    output logic [DEPTH-1:0][WIDTH+1:0]TXBUF
    );
    
     // the buffer that we load the data
    logic [24:0] counter; // counts the baud rate (21 is enough but allocate extra memory)
    logic [3:0] bitcounter; // Counts the number of bits.
    logic [WIDTH+1:0] discardedData;
    logic [2:0] switchstateCounter;
    
    typedef enum logic [2:0] {idlestate, waitstate ,waitstate2, switchstate , transferstate} statetype;
    statetype state;
    
    always_ff @(posedge clk, posedge reset)begin
        if(reset == 1'b1) begin // Then we are in reset state which is idle state
            state <= idlestate;           
            counter <= 0;
            bitcounter <= 0;
            TXBUF <= 40'b0;
            TXserial <= 1'b1;
        end else begin
            // list the state here because I could not able to do that in always comb statements.
            case (state)
            // I will have 3 states
                idlestate: begin
                    TXserial <= 1'b1;
                    switchstateCounter <= 0;
                    if(BTND == 1'b1) begin
                        TXBUF <= {TXBUF[DEPTH-2:0],STOP_BIT,data};
                    end
                    if(switch == 1'b1 && BTNC == 1'b1) begin
                        $display("Idle state");
                        discardedData <= TXBUF[3];
                        state <= waitstate2; 
                    end else begin
                    if(BTNC == 1'b1) begin 
                        counter <= 0;
                        bitcounter <= 0;
                        discardedData <= TXBUF[3];
                        state <= waitstate;
                    end
                    end
                end
               
              waitstate: begin
                TXserial <= 1'b0;
                state <= transferstate;
              end
              
              waitstate2: begin
              $display("wait state 2");
                TXserial <= 1'b0;
                discardedData <= TXBUF[3];
                state <= switchstate;
              end
              
              switchstate: begin
                    if(switchstateCounter <= 3) begin
                        $display("switch 3 den küçükken");
                        TXserial <= discardedData[0];
                        bitcounter <= bitcounter +1;
                        discardedData[8:0] <= discardedData[9:1];
                        if(bitcounter == TOTAL_BITS) begin
                            TXserial <= 1'b1;
                            TXBUF <= {TXBUF[DEPTH-2:0],10'b0};
                            bitcounter <= 0;
                            switchstateCounter <= switchstateCounter + 1;
                            if(switchstateCounter <=2) begin
                                state <= waitstate2;
                            end else begin
                               state <= idlestate;
                            end
                            
                        end
                    end else begin
                    $display("switch 3 den büyükken");
                        TXserial <= 1'b1; 
                        state <= idlestate;
                    end
              end
            // Third state where we send the datas
                transferstate: begin
                    TXserial <= discardedData[0];
                    bitcounter <= bitcounter +1;
                    discardedData[8:0] <= discardedData[9:1];
                    if(bitcounter == TOTAL_BITS) begin
                        TXserial <= 1'b1;
                        state <= idlestate;
                    end
                end
            endcase
        end
    end
    
endmodule