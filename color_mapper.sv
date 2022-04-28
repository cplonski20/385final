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


module  color_mapper ( input CLK,
							input [9:0] DrawX, DrawY, PickX, PickY,
								input [2:0] currScreen,
                       output logic [7:0]  Red, Green, Blue );

	  
	  
	 int DistX, DistY, ballSize;
	 assign DistX = DrawX - PickX;
    assign DistY = DrawY - PickY;
	 logic linearBall;
	 assign ballSize = 8;
	 
logic pick1_on; // x=310 and y =240 for pick 1 center. R = 100

drawPickOne firstPick (.CLK(CLK),
							.centerX(310), .centerY(240),.radius(100), .PickY(PickY), .drawX(DrawX),.drawY(DrawY),
                       .showPick(pick1_on));

always_comb
begin		
        if ((DistX*DistX + DistY*DistY) <= (ballSize * ballSize)) 
            linearBall = 1'b1;
        else 
            linearBall = 1'b0;
		  
end
	 
always_comb
begin

	
   case(currScreen) 
	
	3'b000:
		begin
			Red = 8'h7f - DrawX[9:3];
			Green = 8'h00;
			Blue = 8'h00;
		end
	
	
   3'b001:
		begin
				  if ((linearBall == 1'b1) | (pick1_on == 1'b1)) 
					  begin 
							Red = 8'h00;
							Green = 8'h7f;
							Blue = 8'h00;
					  end       
				  else 
					  begin 
							Red = 8'h70;
							Green = 8'h00;
							Blue = 8'h00;
					  end
					  
    end
	 
	 3'b010:
		begin
				  if ((linearBall == 1'b1)) 
					  begin 
							Red = 8'h00;
							Green = 8'h7f;
							Blue = 8'h00;
					  end       
				  else 
					  begin 
							Red = 8'h11 - DrawY[9:3];
							Green = 8'h00;
							Blue = 8'h00;
					  end      
    end
	 
	 
	 
	
	 
	 3'b111:
	 begin
			Red = 8'h00;
			Green = 8'h7f - DrawX[9:3];
			Blue = 8'h00;
	end
	 
	 default:
	 begin
	 Red = 8'h00;
	 Green = 8'h00;
	 Blue = 8'h77;
	 end
	 
 endcase
 
 end
 
endmodule
