module colorPalette(input logic [9:0] drawX, drawY, input logic [2:0] palSelect,  input logic Clk, output logic [3:0] red, green, blue);

logic [18:0] pixel;
logic [2:0] colorCode;

always_comb
begin


if(palSelect == 3'b001)
begin

case(colorCode)
3'b000:
begin
red = 4'b0011;
green = 4'b0010;
blue = 4'b0000;
end


3'b001:
begin
red = 4'b1010;
green = 4'b0111;
blue = 4'b0101;
end

3'b010:
begin
red = 4'b1000;
green = 4'b1000;
blue = 4'b1000;
end
3'b011:
begin
red = 4'b1100;
green = 4'b1011;
blue = 4'b1001;
end
3'b100:
begin
red = 4'h6;
green = 4'h3;
blue = 4'h1;
end
3'b101:
begin
red = 4'h1;
green = 4'h1;
blue = 4'h1;
end
3'b110:
begin
red = 4'h4;
green = 4'h4;
blue = 4'h3;
end
3'b111:
begin
red = 4'hf;
green = 4'hf;
blue = 4'hf;
end



endcase



end

if(palSelect == 3'b010)
begin

case(colorCode)
3'b000:
begin
red = 4'hf;
green = 4'h0;
blue = 4'b0;
end


3'b001:
begin
red = 4'hA;
green = 4'h7;
blue = 4'hF;
end

3'b010:
begin
red = 4'hf;
green = 4'hf;
blue = 4'h0;
end
3'b011:
begin
red = 4'h0;
green = 4'h2;
blue = 4'hf;
end
3'b100:
begin
red = 4'h4;
green = 4'h7;
blue = 4'h2;
end
3'b101:
begin
red = 4'h3;
green = 4'h4;
blue = 4'h6;
end
3'b110:
begin
red = 4'h7;
green = 4'h3;
blue = 4'h2;
end
3'b111:
begin
red = 4'hf;
green = 4'hf;
blue = 4'hf;
end



endcase



end

else
begin

case(colorCode)
3'b000:
begin
red = 4'b0011;
green = 4'b0010;
blue = 4'b0000;
end


3'b001:
begin
red = 4'b1010;
green = 4'b0111;
blue = 4'b0101;
end

3'b010:
begin
red = 4'b1000;
green = 4'b1000;
blue = 4'b1000;
end
3'b011:
begin
red = 4'b1100;
green = 4'b1011;
blue = 4'b1001;
end
3'b100:
begin
red = 4'h6;
green = 4'h3;
blue = 4'h1;
end
3'b101:
begin
red = 4'h1;
green = 4'h1;
blue = 4'h1;
end
3'b110:
begin
red = 4'h4;
green = 4'h4;
blue = 4'h3;
end
3'b111:
begin
red = 4'hf;
green = 4'hf;
blue = 4'hf;
end



endcase

end


end






assign pixel = drawX + 640 * drawY;

backgroundEasyMem coolMemory(.clock(Clk), .address(pixel), .q(colorCode));

endmodule
