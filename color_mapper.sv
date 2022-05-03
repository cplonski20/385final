//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input CLK, VGA_clk, blank, close,
							input [9:0] DrawX, DrawY, PickX, PickY, pickLRx, pickLRy,
								input [2:0] currScreen,
                       output logic [3:0]  Red, Green, Blue );

	  
	  
	 int DistX, DistY, ballSize, LRDistX, LRDistY, closeX, closeY;
	 assign DistX = DrawX - PickX;
    assign DistY = DrawY - PickY;
	 assign LRDistX = DrawX - pickLRx;
	 assign LRDistY = DrawY - pickLRy;
	 logic linearBall, LRBall, closeBall;
	 assign ballSize = 8;
	 assign closeX = DrawX - 500;
	 assign closeY = DrawY - 100;
	 
	 
	 assign Red = thisRed;
	 assign Green = thisGreen;
	 assign Blue = thisBlue;
	 
	 logic [3:0] thisRed, thisBlue, thisGreen;
	 
	 logic [3:0] palRed, palGreen, palBlue;	 
    logic pick1_on, pick2_on, pick3_on; // x=310 and y =240 for pick 1 center. R = 100

drawPickOne firstPick (.CLK(CLK),
							.centerX(320), .centerY(240),.radius(100), .PickY(PickY), .drawX(DrawX),.drawY(DrawY),
                       .showPick(pick1_on));
							  
drawPickTwo secondPick (.CLK(CLK),
							.centerX(320), .centerY(240),.radius(100), .PickX(pickLRx), .drawX(DrawX),.drawY(DrawY),
                       .showPick2(pick2_on), .showPick3(pick3_on));
							  
colorPalette palette(.drawX(DrawX), .drawY(DrawY), .Clk(CLK), .red(palRed), .green(palGreen), .blue(palBlue));

always_comb
begin		
        if ((DistX*DistX + DistY*DistY) <= (ballSize * ballSize)) 
            linearBall = 1'b1;
        else 
            linearBall = 1'b0;
				
		  if ((LRDistX*LRDistX + LRDistY*LRDistY) <= (ballSize * ballSize)) 
            LRBall = 1'b1;
        else 
            LRBall = 1'b0;
				
				
		  if(((closeX*closeX + closeY*closeY) <= (ballSize * ballSize)) & close)
				closeBall = 1'b1;
		  else
				closeBall = 1'b0;
				
		  
end

	 
always_ff @ (posedge VGA_clk)
begin
if(blank)
begin
	
   case(currScreen) 
	
	3'b000:
		begin
			thisRed <= 4'h7 - DrawX[9:3];
			thisGreen <= 4'h0;
			thisBlue <= 4'h0;
		end
	
	
   3'b001:
		begin
				  if ((linearBall == 1'b1) | (pick1_on == 1'b1) | (LRBall == 1'b1) | (closeBall == 1'b1)) 
					  begin 
							thisRed <= 4'h0;
							thisGreen <= 4'h0;
							thisBlue <= 4'h0;
					  end 
				  else if(pick3_on == 1'b1)
						begin
							thisRed <= 4'hD;
							thisGreen <= 4'hD;
							thisBlue <= 4'hD;
						end
					 
				  else if(pick2_on == 1'b1)
						begin
							thisRed <= 4'hF;
							thisGreen <= 4'hD;
							thisBlue <= 4'h0;
						end
				  
				  else 
					  begin 
							thisRed <= palRed;
							thisGreen <= palGreen;
							thisBlue <= palBlue;
					  end
					  
    end
	 
	 3'b010:
		begin
				  if ((linearBall == 1'b1) | (pick1_on == 1'b1)) 
					  begin 
							thisRed <= 4'h0;
							thisGreen <= 4'h7;
							thisBlue <= 4'h0;
					  end       
				  else 
					  begin 
							thisRed <= 4'h0;
							thisGreen <= 4'h6;
							thisBlue <= 4'h0;
					  end      
    end
	 
	 
	 
	
	 
	 3'b111:
	 begin
			thisRed <= 4'hf;
			thisGreen <= 4'h0;
			thisBlue <= 4'h0;
	end
	 
	 default:
	 begin
	 thisRed <= 4'h0;
	 thisGreen <= 4'h0;
	 thisBlue <= 4'h7;
	 end
	 
 endcase
 
 end
end
 
endmodule
