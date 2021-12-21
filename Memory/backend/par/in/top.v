
// Generated by Cadence Genus(TM) Synthesis Solution 17.11-s014_1
// Generated on: Dec  3 2021 11:46:42 CET (Dec  3 2021 10:46:42 UTC)

// Verification Directory fv/memory_cntrll 

module countextend(clk, rst, incrIN, incrOUT);
  input clk, rst, incrIN;
  output incrOUT;
  wire clk, rst, incrIN;
  wire incrOUT;
endmodule

module memclear(clk, rst, clearMEM, XincrMEM, YincrMEM, rstMEM, WEMEM,
     MEMEM, readyOUT, curX, curY);
  input clk, rst, clearMEM;
  input [4:0] curX, curY;
  output XincrMEM, YincrMEM, rstMEM, WEMEM, MEMEM, readyOUT;
  wire clk, rst, clearMEM;
  wire [4:0] curX, curY;
  wire XincrMEM, YincrMEM, rstMEM, WEMEM, MEMEM, readyOUT;
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
     rstVGA);
  input [7:0] readMEM, writeIN;
  input clk, WEIN, GOTOIN, rstIN, clrIN, XincrIN, YincrIN, rstVGA;
  input [9:0] AddressIN;
  output XincrMEM, YincrMEM, WincrMEM, rstMEM, WEMEM, MEMEM, readyOUT;
  output [7:0] readOUT;
  output [4:0] curXOUT, curYOUT;
  wire [7:0] readMEM, writeIN;
  wire clk, WEIN, GOTOIN, rstIN, clrIN, XincrIN, YincrIN, rstVGA;
  wire [9:0] AddressIN;
  wire XincrMEM, YincrMEM, WincrMEM, rstMEM, WEMEM, MEMEM, readyOUT;
  wire [7:0] readOUT;
  wire [4:0] curXOUT, curYOUT;
  wire [7:0] curW;
  wire MEclr, MErw, WEclr, WErw, Xincr1, Xincr2, Xincr3, Yincr1;
  wire Yincr2, Yincr3, clrrst, readyclr, readyrw, rwrst;
  countextend cex(.clk (clk), .rst (rstIN), .incrIN (XincrIN), .incrOUT
       (Xincr2));
  countextend cey(.clk (clk), .rst (rstIN), .incrIN (YincrIN), .incrOUT
       (Yincr2));
  memclear cm(.clk (clk), .rst (rstIN), .clearMEM (clrIN), .XincrMEM
       (Xincr3), .YincrMEM (Yincr3), .rstMEM (clrrst), .WEMEM (WEclr),
       .MEMEM (MEclr), .readyOUT (readyclr), .curX (curXOUT), .curY
       (curYOUT));
  counter8b cw(.clk (WincrMEM), .rst (rstMEM), .countOUT (curW));
  counter5b cx(.clk (XincrMEM), .rst (rstMEM), .countOUT (curXOUT));
  counter5b cy(.clk (YincrMEM), .rst (rstMEM), .countOUT (curYOUT));
  readwrite rw(.clk (clk), .WEIN (WEIN), .WEMEM (WErw), .GOTOIN
       (GOTOIN), .MEMEM (MErw), .XincrMEM (Xincr1), .YincrMEM (Yincr1),
       .WincrMEM (WincrMEM), .AddressIN (AddressIN), .WriteIN
       (writeIN), .readyOUT (readyrw), .rstIN (rstIN), .rstMEM (rwrst),
       .curW (curW), .curX (curXOUT), .curY (curYOUT));
  OR3D4BWP7T g22(.A1 (Xincr3), .A2 (Xincr1), .A3 (Xincr2), .Z
       (XincrMEM));
  OR3D4BWP7T g21(.A1 (Yincr3), .A2 (Yincr1), .A3 (Yincr2), .Z
       (YincrMEM));
  CKAN2D4BWP7T g18(.A1 (WErw), .A2 (WEclr), .Z (WEMEM));
  OR2D4BWP7T g12(.A1 (MErw), .A2 (MEclr), .Z (MEMEM));
  CKAN2D4BWP7T g23(.A1 (readyrw), .A2 (readyclr), .Z (readyOUT));
  OR4D4BWP7T g26(.A1 (clrrst), .A2 (rwrst), .A3 (rstVGA), .A4 (rstIN),
       .Z (rstMEM));
  BUFFD4BWP7T drc_bufs(.I (readMEM[7]), .Z (readOUT[7]));
  BUFFD4BWP7T drc_bufs29(.I (readMEM[0]), .Z (readOUT[0]));
  BUFFD4BWP7T drc_bufs32(.I (readMEM[1]), .Z (readOUT[1]));
  BUFFD4BWP7T drc_bufs35(.I (readMEM[2]), .Z (readOUT[2]));
  BUFFD4BWP7T drc_bufs38(.I (readMEM[3]), .Z (readOUT[3]));
  BUFFD4BWP7T drc_bufs41(.I (readMEM[4]), .Z (readOUT[4]));
  BUFFD4BWP7T drc_bufs44(.I (readMEM[5]), .Z (readOUT[5]));
  BUFFD4BWP7T drc_bufs47(.I (readMEM[6]), .Z (readOUT[6]));
endmodule
