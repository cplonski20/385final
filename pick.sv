module  pick ( input Reset, frame_clk,
					input [2:0] dir,
               output [9:0]  pickX, pickY);
    
    logic [9:0] pick_X_Pos, pick_X_Motion, pick_Y_Pos, pick_Y_Motion;
	 
    parameter [9:0] pick_X_Center=100;  // Center position on the X axis
    parameter [9:0] pick_Y_Center=32;  // Center position on the Y axis 
    parameter [9:0] pick_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] pick_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] pick_Y_Min=32;       // Topmost point on the Y axis // Chaz: i changed to 32 
    parameter [9:0] pick_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] pick_X_Step=1;      // Step size on the X axis
    parameter [9:0] pick_Y_Step=1; 
	 // Step size on the Y axis
	 

   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_pick
        if (Reset)  // Asynchronous Reset
        begin 
            pick_Y_Motion <= 10'd0; //Ball_Y_Step;
				pick_X_Motion <= 10'd0; //Ball_X_Step;
				pick_Y_Pos <= 32;
				pick_X_Pos <= pick_X_Center;
        end
            
		  else 
        begin 
				 if ( pick_Y_Pos > pick_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					  pick_Y_Pos = 32;  // 2's complement.
					  
				 else if ( pick_Y_Pos >= 0 && pick_Y_Pos <= 31)  // Ball is at the top edge, BOUNCE!
					  pick_Y_Pos = pick_Y_Max;
					 
					  
				 else 
    			 begin
					 
				 case (dir)	  
					3'b01 : begin

					        pick_Y_Motion <= -1;//S
							  pick_X_Motion <= 0;
							 end
							  
					3'b10 : begin
					        pick_Y_Motion <= 1;//W
							  pick_X_Motion <= 0;
							  end
					3'b011 : begin

						  pick_Y_Motion <= 2;//S
						  pick_X_Motion <= 0;
						 end
					3'b100 : begin

						  pick_Y_Motion <= -2;//S
						  pick_X_Motion <= 0;
						 end
					3'b000 : begin
					        pick_Y_Motion <= 0;//W
							  pick_X_Motion <= 0;
							 end	  
					default: ;
			   endcase
			end
				 pick_Y_Pos <= (pick_Y_Pos + pick_Y_Motion);  // Update ball position
				 pick_X_Pos <= (pick_X_Pos + pick_X_Motion);
      
			
	
    end
	 end
       
    assign pickX = pick_X_Pos;
   
    assign pickY = pick_Y_Pos;
   
    

endmodule
