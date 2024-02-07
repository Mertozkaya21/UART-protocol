`timescale 1ns / 1ps

module uart#(parameter WIDTH = 8, DEPTH = 4)
    (
    // Transmitter
    input logic clk,
    input logic reset,
    input logic BTND,
    input logic switch,
    input logic BTNC,
    input logic BTNL,
    input logic BTNR,
    input logic BTNU,
    input JB,
    output JC,
    input logic [WIDTH-1:0] data,
    output logic [7:0] LEDA,
    output logic lastLed,
    output logic [1:0] stateLed,
    output logic [6:0] seg_outputs,
    output logic [3:0] an
    );
    
    // These 3 reg's are for transmitter.
    logic TXserial;
    logic [DEPTH-1:0][WIDTH+1:0] TXBUF;
    
    // Receiver
    logic [DEPTH-1:0][WIDTH+1:0] RXBUF;
    logic clkOut;
    
    // Buttons
    reg BTNCout;
    reg BTNDout;
    reg BTNLout; 
    reg BTNUout;
    reg BTNRout;
    
    initial begin
        TXBUF <= 40'b0;
        RXBUF <= 40'b0;
    end
    
    
    baudRateGenerator uut_baud(
        .clk(clk),
        .clkOut(clkOut)
    );
     receiver uut_receiver (
    .clk(clkOut),
    .reset(reset),
    .RXserial(JB),
    .RXBUF(RXBUF)
  );
  
    buttonSync uut_buttonSync(
        .clk(clkOut),
        .reset(reset),
        .bi(BTNC),
        .bo(BTNCout)
    );
    
    buttonSync uut_buttonSync2(
        .clk(clkOut),
        .reset(reset),
        .bi(BTND),
        .bo(BTNDout)
    );
    
    buttonSync uut_buttonSync3 (
        .clk(clk),
        .reset(reset),
        .bi(BTNL),
        .bo(BTNLout)
    );
    buttonSync uut_buttonSync4 (
        .clk(clk),
        .reset(reset),
        .bi(BTNR),
        .bo(BTNRout)
    );
    
    buttonSync uut_buttonSync5 (
        .clk(clk),
        .reset(reset),
        .bi(BTNU),
        .bo(BTNUout)
    );
    
    transmitter uut_transmitter (
    .clk(clkOut),
    .reset(reset),
    .switch(switch),
    .BTND(BTNDout),
    .BTNC(BTNCout),
    .data(data),
    .TXBUF(TXBUF),
    .TXserial(JC)
  );
  
  displaySecond uut_stateController(
    .clk(clk),
    .reset(reset),
    .BTNL(BTNLout),
    .BTNR(BTNRout),
    .BTNU(BTNUout),
    .lastLed(lastLed),
    .stateLed(stateLed)
  );
 
  FourDigitDisplayController sevenSeg(
    .clk(clk),
    .TXBUF(TXBUF),
    .RXBUF(RXBUF),
    .stateLed(stateLed),
    .lastLed(lastLed),
    .an(an),
    .segDisp(seg_outputs)
  );
  
  assign LEDA = TXBUF[0][WIDTH-1:0];
    
endmodule