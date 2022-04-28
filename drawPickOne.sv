module  drawPickOne ( input CLK,
							input [9:0] centerX,centerY,radius, PickY,drawX, drawY,
                       output logic showPick);
	

//NOTE WE CREATE A LOT OF LOOK UP TABLE MODULES BY DOING THIS. IS THAT OK?	

logic [9:0] rotateX0,rotateX1,rotateX2,rotateX3, rotateX4,rotateX5,rotateX6,rotateX7,rotateX8,rotateX9;
logic [9:0] rotateY0,rotateY1,rotateY2,rotateY3, rotateY4,rotateY5,rotateY6,rotateY7,rotateY8,rotateY9;
	
	rotational_motion ball0(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius), .PickY(PickY),
                       .RotX(rotateX0), .RotY(rotateY0));	
	
	rotational_motion ball1(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 10), .PickY(PickY),
                       .RotX(rotateX1), .RotY(rotateY1));
	
	rotational_motion ball2(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 20), .PickY(PickY),
                       .RotX(rotateX2), .RotY(rotateY2));			  
	
	
	rotational_motion ball3(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 30), .PickY(PickY),
                       .RotX(rotateX3), .RotY(rotateY3));
	
	rotational_motion ball4(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 40), .PickY(PickY),
                       .RotX(rotateX4), .RotY(rotateY4));
	
	rotational_motion ball5(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius -50), .PickY(PickY),
                       .RotX(rotateX5), .RotY(rotateY5));			  
	
	
	rotational_motion ball6(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 60), .PickY(PickY),
                       .RotX(rotateX6), .RotY(rotateY6));
							
	rotational_motion ball7(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 70), .PickY(PickY),
                       .RotX(rotateX7), .RotY(rotateY7));
	
	rotational_motion ball8(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 80), .PickY(PickY),
                       .RotX(rotateX8), .RotY(rotateY8));			  
	
	
	rotational_motion ball9(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 90), .PickY(PickY),
                       .RotX(rotateX9), .RotY(rotateY9));		
//	
	int distX0,distX1,distX2,distX3,distX4,distX5,distX6,distX7,distX8,distX9;
	int distY0,distY1,distY2,distY3,distY4,distY5,distY6,distY7,distY8,distY9;
	
	int ballRadius;	
	assign ballRadius = 121; // Radius Squared
	
	always_comb
	begin
	distX0 = drawX - rotateX0;
	distX1 = drawX - rotateX1;
	distX2 = drawX - rotateX2;
	distX3 = drawX - rotateX3;
	distX4 = drawX - rotateX4;
	distX5 = drawX - rotateX5;
	distX6 = drawX - rotateX6;
	distX7 = drawX - rotateX7;
	distX8 = drawX - rotateX8;
	distX9 = drawX - rotateX9;
	
	distY0 = drawY - rotateY0;
	distY1 = drawY - rotateY1;
	distY2 = drawY - rotateY2;
	distY3 = drawY - rotateY3;
	distY4 = drawY - rotateY4;
	distY5 = drawY - rotateY5;
	distY6 = drawY - rotateY6;
	distY7 = drawY - rotateY7;
	distY8 = drawY - rotateY8;
	distY9 = drawY - rotateY9;
	
		  if (((distX0*distX0 + distY0*distY0) <= (ballRadius)))  // !!!note ballRadius is radius squared of ball. assigned above
				showPick = 1'b1;
		  else if (((distX1*distX1 + distY1*distY1) <= (ballRadius)))
				showPick = 1'b1;
		  else if (((distX2*distX2 + distY2*distY2) <= (ballRadius)))
				showPick = 1'b1;
		  else if (((distX3*distX3 + distY3*distY3) <= (ballRadius))) 
				showPick = 1'b1;
		  else if (((distX4*distX4 + distY4*distY4) <= (ballRadius))) 
				showPick = 1'b1;
		  else if (((distX5*distX5 + distY5*distY5) <= (ballRadius))) 
				showPick = 1'b1;
		  else if (((distX6*distX6 + distY6*distY6) <= (ballRadius))) 
				showPick = 1'b1;
		  else if (((distX7*distX7 + distY7*distY7) <= (ballRadius))) 
				showPick = 1'b1;
		  else if (((distX8*distX8 + distY8*distY8) <= (ballRadius))) 
				showPick = 1'b1;
		  else if (((distX9*distX9 + distY9*distY9) <= (ballRadius))) 
				showPick = 1'b1;
		  else 
				showPick = 1'b0;
	end

endmodule
