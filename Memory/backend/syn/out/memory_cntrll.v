
// Generated by Cadence Genus(TM) Synthesis Solution 17.11-s014_1
// Generated on: Dec  3 2021 10:39:15 CET (Dec  3 2021 09:39:15 UTC)

// Verification Directory fv/memory_cntrll 

module countextend(clk, rst, incrIN, incrOUT);
  input clk, rst, incrIN;
  output incrOUT;
  wire clk, rst, incrIN;
  wire incrOUT;
endmodule

module counter8b(clk, rst, countOUT);
  input clk, rst;
  output [7:0] countOUT;
  wire clk, rst;
  wire [7:0] countOUT;
endmodule

module counter5b(clk, rst, countOUT);
  input clk, rst;
  output [4:0] countOUT;
  wire clk, rst;
  wire [4:0] countOUT;
endmodule

module readwrite(clk, WEIN, WEMEM, GOTOIN, MEMEM, XincrMEM, YincrMEM,
     WincrMEM, AddressIN, WriteIN, readyOUT, rstIN, rstMEM, curW, curX,
     curY);
  input clk, WEIN, GOTOIN, rstIN;
  input [9:0] AddressIN;
  input [7:0] WriteIN, curW;
  input [4:0] curX, curY;
  output WEMEM, MEMEM, XincrMEM, YincrMEM, WincrMEM, readyOUT, rstMEM;
  wire clk, WEIN, GOTOIN, rstIN;
  wire [9:0] AddressIN;
  wire [7:0] WriteIN, curW;
  wire [4:0] curX, curY;
  wire WEMEM, MEMEM, XincrMEM, YincrMEM, WincrMEM, readyOUT, rstMEM;
endmodule

module memory_cntrll(readMEM, clk, XincrMEM, YincrMEM, WincrMEM,
     rstMEM, WEMEM, MEMEM, readOUT, writeIN, WEIN, AddressIN, GOTOIN,
     rstIN, clrIN, XincrIN, YincrIN, readyOUT, curXOUT, curYOUT,
     clrMEM, rstVGA);
  input [7:0] readMEM, writeIN;
  input clk, WEIN, GOTOIN, rstIN, clrIN, XincrIN, YincrIN, clrMEM,
       rstVGA;
  input [9:0] AddressIN;
  output XincrMEM, YincrMEM, WincrMEM, rstMEM, WEMEM, MEMEM, readyOUT;
  output [7:0] readOUT;
  output [4:0] curXOUT, curYOUT;
  wire [7:0] readMEM, writeIN;
  wire clk, WEIN, GOTOIN, rstIN, clrIN, XincrIN, YincrIN, clrMEM,
       rstVGA;
  wire [9:0] AddressIN;
  wire XincrMEM, YincrMEM, WincrMEM, rstMEM, WEMEM, MEMEM, readyOUT;
  wire [7:0] readOUT;
  wire [4:0] curXOUT, curYOUT;
  wire [7:0] curW;
  wire Xincr1, Xincr2, Yincr1, Yincr2, rwrst;
  countextend cex(.clk (clk), .rst (rstIN), .incrIN (XincrIN), .incrOUT
       (Xincr2));
  countextend cey(.clk (clk), .rst (rstIN), .incrIN (YincrIN), .incrOUT
       (Yincr2));
  counter8b cw(.clk (WincrMEM), .rst (rstMEM), .countOUT (curW));
  counter5b cx(.clk (XincrMEM), .rst (rstMEM), .countOUT (curXOUT));
  counter5b cy(.clk (YincrMEM), .rst (rstMEM), .countOUT (curYOUT));
  readwrite rw(.clk (clk), .WEIN (WEIN), .WEMEM (WEMEM), .GOTOIN
       (GOTOIN), .MEMEM (MEMEM), .XincrMEM (Xincr1), .YincrMEM
       (Yincr1), .WincrMEM (WincrMEM), .AddressIN (AddressIN), .WriteIN
       (writeIN), .readyOUT (readyOUT), .rstIN (rstIN), .rstMEM
       (rwrst), .curW (curW), .curX (curXOUT), .curY (curYOUT));
  OR2D4BWP7T g5(.A1 (Xincr1), .A2 (Xincr2), .Z (XincrMEM));
  OR2D4BWP7T g6(.A1 (Yincr1), .A2 (Yincr2), .Z (YincrMEM));
  OR3D4BWP7T g16(.A1 (rwrst), .A2 (rstVGA), .A3 (rstIN), .Z (rstMEM));
  BUFFD4BWP7T drc_bufs(.I (readMEM[7]), .Z (readOUT[7]));
  BUFFD4BWP7T drc_bufs19(.I (readMEM[0]), .Z (readOUT[0]));
  BUFFD4BWP7T drc_bufs22(.I (readMEM[1]), .Z (readOUT[1]));
  BUFFD4BWP7T drc_bufs25(.I (readMEM[2]), .Z (readOUT[2]));
  BUFFD4BWP7T drc_bufs28(.I (readMEM[3]), .Z (readOUT[3]));
  BUFFD4BWP7T drc_bufs31(.I (readMEM[4]), .Z (readOUT[4]));
  BUFFD4BWP7T drc_bufs34(.I (readMEM[5]), .Z (readOUT[5]));
  BUFFD4BWP7T drc_bufs37(.I (readMEM[6]), .Z (readOUT[6]));
endmodule

