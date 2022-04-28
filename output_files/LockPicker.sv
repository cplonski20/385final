module colorPalette(input logic [9:0] drawX, drawY, input logic Clk, output logic [3:0] red, green, blue)

logic [18:0] pixel;
logic [2:0] colorCode;

assign pixel = drawX * drawY;

backgroundEasyMem coolMemory(.Clk(Clk), .address(pixel), .q(colorCode));

endmodule
