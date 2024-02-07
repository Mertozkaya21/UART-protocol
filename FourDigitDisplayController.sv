module FourDigitDisplayController (
  input logic clk,
  output logic [3:0][9:0]TXBUF,
  output logic [3:0][9:0]RXBUF,      
  output logic [6:0] segDisp,
  output logic [1:0] stateLed,
  output logic lastLed,
  output logic [3:0] an  
);
    logic [32:0] clkdiv;
    logic [15:0] data;
always_comb begin
   if(stateLed == 2'b01 && lastLed == 1'b0) begin // First two element of TXBUF
    data <= {TXBUF[1][7:0],TXBUF[0][7:0]};
  end
  if(stateLed == 2'b10 && lastLed == 1'b0) begin // Last two of TXBUF
    data <= {TXBUF[3][7:0],TXBUF[2][7:0]};
  end
  if(stateLed == 2'b01 && lastLed == 1'b1) begin // First two of RXBUF
    data <= {RXBUF[1][7:0],RXBUF[0][7:0]};
  end
  if(stateLed == 2'b10 && lastLed == 1'b1) begin // Last Two of RXBUF
    data <= {RXBUF[3][7:0],RXBUF[2][7:0]};
  end
end
  always_ff @(posedge clk) begin
    if(clkdiv == 32'b111111111111111111) begin
        clkdiv <= 32'b0;
        case (an)
            4'b1110: begin // 2. segment
            case (data[7:4]) // 2. segment
              4'b0000: segDisp = 7'b1000000;  // Hex: 0
              4'b0001: segDisp = 7'b1111001;  // Hex: 1
              4'b0010: segDisp = 7'b0100100;  // Hex: 2
              4'b0011: segDisp = 7'b0110000;  // Hex: 3
              4'b0100: segDisp = 7'b0011001;  // Hex: 4
              4'b0101: segDisp = 7'b0010010;  // Hex: 5
              4'b0110: segDisp = 7'b0000010;  // Hex: 6
              4'b0111: segDisp = 7'b1111000;  // Hex: 7
              4'b1000: segDisp = 7'b0000000;  // Hex: 8
              4'b1001: segDisp = 7'b0011000;  // Hex: 9
              4'b1010: segDisp = 7'b0001000;  // Hex: A
              4'b1011: segDisp = 7'b0000011;  // Hex: B
              4'b1100: segDisp = 7'b1000110;  // Hex: C
              4'b1101: segDisp = 7'b0100001;  // Hex: D
              4'b1110: segDisp = 7'b0000110;  // Hex: E
              4'b1111: segDisp = 7'b0001110;  // Hex: F
              default: segDisp = 7'b1111111;  // Display nothing for other values
            endcase
            an <= 4'b1101;
        end
        
        4'b1101: begin // 3. segment
                case (data[11:8])
                  4'b0000: segDisp = 7'b1000000;  // Hex: 0
                  4'b0001: segDisp = 7'b1111001;  // Hex: 1
                  4'b0010: segDisp = 7'b0100100;  // Hex: 2
                  4'b0011: segDisp = 7'b0110000;  // Hex: 3
                  4'b0100: segDisp = 7'b0011001;  // Hex: 4
                  4'b0101: segDisp = 7'b0010010;  // Hex: 5
                  4'b0110: segDisp = 7'b0000010;  // Hex: 6
                  4'b0111: segDisp = 7'b1111000;  // Hex: 7
                  4'b1000: segDisp = 7'b0000000;  // Hex: 8
                  4'b1001: segDisp = 7'b0011000;  // Hex: 9
                  4'b1010: segDisp = 7'b0001000;  // Hex: A
                  4'b1011: segDisp = 7'b0000011;  // Hex: B
                  4'b1100: segDisp = 7'b1000110;  // Hex: C
                  4'b1101: segDisp = 7'b0100001;  // Hex: D
                  4'b1110: segDisp = 7'b0000110;  // Hex: E
                  4'b1111: segDisp = 7'b0001110;  // Hex: F
                  default: segDisp = 7'b1111111;  // Display nothing for other values
                endcase
             an <= 4'b1011;      
        end
        
        4'b1011: begin // 4. segment
                 case (data[15:12])
                  4'b0000: segDisp = 7'b1000000;  // Hex: 0
                  4'b0001: segDisp = 7'b1111001;  // Hex: 1
                  4'b0010: segDisp = 7'b0100100;  // Hex: 2
                  4'b0011: segDisp = 7'b0110000;  // Hex: 3
                  4'b0100: segDisp = 7'b0011001;  // Hex: 4
                  4'b0101: segDisp = 7'b0010010;  // Hex: 5
                  4'b0110: segDisp = 7'b0000010;  // Hex: 6
                  4'b0111: segDisp = 7'b1111000;  // Hex: 7
                  4'b1000: segDisp = 7'b0000000;  // Hex: 8
                  4'b1001: segDisp = 7'b0011000;  // Hex: 9
                  4'b1010: segDisp = 7'b0001000;  // Hex: A
                  4'b1011: segDisp = 7'b0000011;  // Hex: B
                  4'b1100: segDisp = 7'b1000110;  // Hex: C
                  4'b1101: segDisp = 7'b0100001;  // Hex: D
                  4'b1110: segDisp = 7'b0000110;  // Hex: E
                  4'b1111: segDisp = 7'b0001110;  // Hex: F
                  default: segDisp = 7'b1111111;  // Display nothing for other values
                endcase
            an <= 4'b0111;
        end
        
        4'b0111: begin // 1. segment
                 case (data[3:0])
                  4'b0000: segDisp = 7'b1000000;  // Hex: 0
                  4'b0001: segDisp = 7'b1111001;  // Hex: 1
                  4'b0010: segDisp = 7'b0100100;  // Hex: 2
                  4'b0011: segDisp = 7'b0110000;  // Hex: 3
                  4'b0100: segDisp = 7'b0011001;  // Hex: 4
                  4'b0101: segDisp = 7'b0010010;  // Hex: 5
                  4'b0110: segDisp = 7'b0000010;  // Hex: 6
                  4'b0111: segDisp = 7'b1111000;  // Hex: 7
                  4'b1000: segDisp = 7'b0000000;  // Hex: 8
                  4'b1001: segDisp = 7'b0011000;  // Hex: 9
                  4'b1010: segDisp = 7'b0001000;  // Hex: A
                  4'b1011: segDisp = 7'b0000011;  // Hex: B
                  4'b1100: segDisp = 7'b1000110;  // Hex: C
                  4'b1101: segDisp = 7'b0100001;  // Hex: D
                  4'b1110: segDisp = 7'b0000110;  // Hex: E
                  4'b1111: segDisp = 7'b0001110;  // Hex: F
                  default: segDisp = 7'b1111111;  // Display nothing for other values
                endcase
               an <= 4'b1110;
            end
            default: an <= 4'b1110;
    endcase
    end else begin 
        clkdiv <= clkdiv + 1;
    end
  end
  endmodule
