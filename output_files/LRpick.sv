module  LRpick ( input Reset, frame_clk, pickMode,
					input [2:0] LRdir,
               output [9:0]  pickLRx, pickLRy);
    
    logic [9:0] pick_X_Pos, pick_X_Motion, pick_Y_Pos, pick_Y_Motion;
	 
    parameter [9:0] pick_X_Center=600;  // Center position on the X axis
    parameter [9:0] pick_Y_Center=300;  // Center position on the Y axis
    parameter [9:0] pick_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] pick_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] pick_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] pick_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] pick_X_Step=1;      // Step size on the X axis
    parameter [9:0] pick_Y_Step=1; 
	 // Step size on the Y axis
	 
	logic [2:0] ffDir;
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_pick
        if (Reset)  // Asynchronous Reset
        begin 
				ffDir <= LRdir;
            pick_Y_Motion <= 10'd0; //Ball_Y_Step;
				pick_X_Motion <= 10'd0; //Ball_X_Step;
				pick_Y_Pos <= pick_Y_Center;
				pick_X_Pos <= pick_X_Center;
        end
            
		  else 
        begin 
				 if (pickMode == 0)  // Ball is at the bottom edge, BOUNCE!
					  pick_X_Pos = 600;  // 2's complement.
					  
				 if ( pick_X_Pos < 488)  // Ball is at the top edge, BOUNCE!
					  pick_X_Pos = 488;
				 
				 
					 
					  
				 else 
    			 begin
					 
				 case (LRdir)	  
					3'b001 : begin

					        pick_Y_Motion <= 0;//S
							  pick_X_Motion <= -1;
							 end
							  
					3'b010 : begin
					        pick_Y_Motion <= 0;//W
							  pick_X_Motion <= -2;
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
	 
       
    assign pickLRx = pick_X_Pos;
   
    assign pickLRy = pick_Y_Pos;
   
    

endmodule
