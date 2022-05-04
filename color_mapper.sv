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


module  color_mapper ( input CLK, VGA_clk, blank, closeEasy, closeMedium,
							input [9:0] DrawX, DrawY, PickX, PickY, pickLRx, pickLRy,
								input [2:0] currScreen, guessesEasy, guessesMedium,
                       output logic [3:0]  Red, Green, Blue );

	  
	  
	 int DistX, DistY, ballSize, LRDistX, LRDistY, closeX, closeY;
	 assign DistX = DrawX - PickX;
    assign DistY = DrawY - PickY;
	 assign LRDistX = DrawX - pickLRx;
	 assign LRDistY = DrawY - pickLRy;
	 logic linearBall, LRBall, closeBallEasy, closeBallMedium;
	 assign ballSize = 8;
	 assign closeX = DrawX - 500;
	 assign closeY = DrawY - 100;
	 
	 
	 int EasylifeBall0X,EasylifeBall0Y, EasylifeBall1X, EasylifeBall1Y, EasylifeBall2X, EasylifeBall2Y;
	 logic EasylifeBall0, EasylifeBall1, EasylifeBall2;
	 
	 assign EasylifeBall0X = DrawX - 100;
	 assign EasylifeBall0Y = DrawY - 50;
	 assign EasylifeBall1X = DrawX - 120;
	 assign EasylifeBall1Y = DrawY - 50;
	 assign EasylifeBall2X = DrawX - 140;
	 assign EasylifeBall2Y = DrawY - 50;
	 
	 
	 int MediumlifeBall0X,MediumlifeBall0Y, MediumlifeBall1X, MediumlifeBall1Y, MediumlifeBall2X, MediumlifeBall2Y;
	 logic MediumlifeBall0, MediumlifeBall1, MediumlifeBall2;
	 
	 assign MediumlifeBall0X = DrawX - 100;
	 assign MediumlifeBall0Y = DrawY - 50;
	 assign MediumlifeBall1X = DrawX - 120;
	 assign MediumlifeBall1Y = DrawY - 50;
	 assign MediumlifeBall2X = DrawX - 140;
	 assign MediumlifeBall2Y = DrawY - 50;
	 
	 
	 
	 assign Red = thisRed;
	 assign Green = thisGreen;
	 assign Blue = thisBlue;
	 
	 logic [3:0] thisRed, thisBlue, thisGreen;
	 
	 logic [3:0] palRed, palGreen, palBlue;	 
	 //logic //[2:0] palSelect;
    logic pick1_on, pick2_on, pick3_on; // x=310 and y =240 for pick 1 center. R = 100

drawPickOne firstPick (.CLK(CLK),
							.centerX(320), .centerY(240),.radius(100), .PickY(PickY), .drawX(DrawX),.drawY(DrawY),
                       .showPick(pick1_on));
							  
drawPickTwo secondPick (.CLK(CLK),
							.centerX(320), .centerY(240),.radius(100), .PickX(pickLRx), .drawX(DrawX),.drawY(DrawY),
                       .showPick2(pick2_on), .showPick3(pick3_on));
							  
colorPalette palette(.drawX(DrawX), .drawY(DrawY), .Clk(CLK), .red(palRed), .green(palGreen), .blue(palBlue), .palSelect(currScreen));

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
				
				
		  if(((closeX*closeX + closeY*closeY) <= (ballSize * ballSize)) & closeEasy)
				closeBallEasy = 1'b1;
		  else
				closeBallEasy = 1'b0;
				
		  if(((closeX*closeX + closeY*closeY) <= (ballSize * ballSize)) & closeMedium)
				closeBallMedium = 1'b1;
		  else
				closeBallMedium = 1'b0;
				
				
		  if(((EasylifeBall0X*EasylifeBall0X + EasylifeBall0Y*EasylifeBall0Y) <= (ballSize * ballSize)) & (guessesEasy == 3'b000 || guessesEasy == 3'b001 || guessesEasy == 3'b010))
				begin
				EasylifeBall0 = 1'b1;
			end
		  else
			begin
				EasylifeBall0 = 1'b0;
			end
			
			
			if(((EasylifeBall1X*EasylifeBall1X + EasylifeBall1Y*EasylifeBall1Y) <= (ballSize * ballSize)) & (guessesEasy == 3'b000 || guessesEasy == 3'b001))
				begin
				EasylifeBall1 = 1'b1;
			end
		  else
			begin
				EasylifeBall1 = 1'b0;
			end
			
			if(((EasylifeBall2X*EasylifeBall2X + EasylifeBall2Y*EasylifeBall2Y) <= (ballSize * ballSize)) & (guessesEasy == 3'b000))
				begin
				EasylifeBall2 = 1'b1;
			end
		  else
			begin
				EasylifeBall2 = 1'b0;
			end
			
			
			
			
			if(((MediumlifeBall0X*MediumlifeBall0X + MediumlifeBall0Y*MediumlifeBall0Y) <= (ballSize * ballSize)) & (guessesMedium == 3'b000 || guessesMedium == 3'b001 || guessesMedium == 3'b010))
				begin
				MediumlifeBall0 = 1'b1;
			end
		  else
			begin
				MediumlifeBall0 = 1'b0;
			end
			
			
			if(((MediumlifeBall1X*MediumlifeBall1X + MediumlifeBall1Y*MediumlifeBall1Y) <= (ballSize * ballSize)) & (guessesMedium == 3'b000 || guessesMedium == 3'b001))
				begin
				MediumlifeBall1 = 1'b1;
			end
		  else
			begin
				MediumlifeBall1 = 1'b0;
			end
			
			if(((MediumlifeBall2X*MediumlifeBall2X + MediumlifeBall2Y*MediumlifeBall2Y) <= (ballSize * ballSize)) & (guessesMedium == 3'b000))
				begin
				MediumlifeBall2 = 1'b1;
			end
		  else
			begin
				MediumlifeBall2 = 1'b0;
			end
				
//		  if(((EasylifeBall0X*EasylifeBall0X + EasylifeBall0Y*EasylifeBall0Y) <= (ballSize * ballSize)) & ((EasylifeBall1X*EasylifeBall1X + EasylifeBall1Y*EasylifeBall1Y) <= (ballSize * ballSize)) & ((EasylifeBall2X*EasylifeBall2X + EasylifeBall2Y*EasylifeBall2Y) <= (ballSize * ballSize)) &  (guessesEasy == 0))
//			begin
//				EasylifeBall0 = 1'b1;
//				EasylifeBall1 = 1'b1;
//				EasylifeBall2 = 1'b1;
//			end
//		  else
//			begin
//				EasylifeBall0 = 1'b0;
//				EasylifeBall1 = 1'b0;
//				EasylifeBall2 = 1'b0;
//			end
//			
//			if(((EasylifeBall0X*EasylifeBall0X + EasylifeBall0Y*EasylifeBall0Y) <= (ballSize * ballSize)) & ((EasylifeBall1X*EasylifeBall1X + EasylifeBall1Y*EasylifeBall1Y) <= (ballSize * ballSize)) & (guessesEasy == 1))
//			begin
//				EasylifeBall0 = 1'b1;
//				EasylifeBall1 = 1'b1;
//				EasylifeBall2 = 1'b0;
//			end
//		  else
//			begin
//				EasylifeBall0 = 1'b0;
//				EasylifeBall1 = 1'b0;
//				EasylifeBall2 = 1'b0;
//			end
//			
//			if(((EasylifeBall0X*EasylifeBall0X + EasylifeBall0Y*EasylifeBall0Y) <= (ballSize * ballSize)) & (guessesEasy == 2))
//			begin
//				EasylifeBall0 = 1'b1;
//				EasylifeBall1 = 1'b0;
//				EasylifeBall2 = 1'b0;
//			end
//		  else
//			begin
//				EasylifeBall0 = 1'b0;
//				EasylifeBall1 = 1'b0;
//				EasylifeBall2 = 1'b0;
//			end
		  
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
		
				  if(EasylifeBall0)
					begin
					thisRed <= 4'h0;
					thisGreen <= 4'hf;
					thisBlue <= 4'h0;
					end
					
					else if(EasylifeBall1)
					begin
					thisRed <= 4'h0;
					thisGreen <= 4'hf;
					thisBlue <= 4'h0;
					end
					
					else if(EasylifeBall2)
					begin
					thisRed <= 4'h0;
					thisGreen <= 4'hf;
					thisBlue <= 4'h0;
					end
					
					
				  else if ((linearBall == 1'b1) | (pick1_on == 1'b1) | (LRBall == 1'b1) | (closeBallEasy == 1'b1)) 
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
					
					if(MediumlifeBall0)
					begin
					thisRed <= 4'h0;
					thisGreen <= 4'hf;
					thisBlue <= 4'h0;
					end
					
					else if(MediumlifeBall1)
					begin
					thisRed <= 4'h0;
					thisGreen <= 4'hf;
					thisBlue <= 4'h0;
					end
					
					else if(MediumlifeBall2)
					begin
					thisRed <= 4'h0;
					thisGreen <= 4'hf;
					thisBlue <= 4'h0;
					end
				  else if ((linearBall == 1'b1) | (pick1_on == 1'b1) | (LRBall == 1'b1) | (closeBallMedium == 1'b1)) 
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
	 
	 
	 
	
	 
	 3'b111:
	 begin
			thisRed <= DrawX - 4'hf;
			thisGreen <= DrawX - 4'h0;
			thisBlue <= DrawX - 4'h0;
	end
	 
	 default:
	 begin
	 thisRed <= 4'h0;
	 thisGreen <= 4'h0;
	 thisBlue <= 4'hf;
	 end
	 
 endcase
 
 end
end
 
endmodule
