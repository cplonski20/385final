module  drawPickTwo ( input CLK,
							input [9:0] centerX,centerY,radius, PickX, drawX, drawY,
                       output logic showPick2);
	

//NOTE WE CREATE A LOT OF LOOK UP TABLE MODULES BY DOING THIS. IS THAT OK?	

logic [9:0] rotateX0,rotateX1,rotateX2,rotateX3, rotateX4,rotateX5,rotateX6,rotateX7,rotateX8,rotateX9;
logic [9:0] rotateY0,rotateY1,rotateY2,rotateY3, rotateY4,rotateY5,rotateY6,rotateY7,rotateY8,rotateY9;
	
	rotationalPick2 ball0(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius- 30),.PickX(PickX),.phaseShift(2'b00),
                       .RotX(rotateX0), .RotY(rotateY0));	
	
	rotationalPick2 ball1(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 40), .PickX(PickX),.phaseShift(2'b00),
                       .RotX(rotateX1), .RotY(rotateY1));
	
	rotationalPick2 ball2(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 50), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX2), .RotY(rotateY2));			  
	
	
	rotationalPick2 ball3(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 60), .PickX(PickX),.phaseShift(2'b00),
                       .RotX(rotateX3), .RotY(rotateY3));
	
	rotationalPick2 ball4(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 70), .PickX(PickX),.phaseShift(2'b00),
                       .RotX(rotateX4), .RotY(rotateY4));
	
	rotationalPick2 ball5(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius -80), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX5), .RotY(rotateY5));			  
	
	
	rotationalPick2 ball6(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 90), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX6), .RotY(rotateY6));
							
	rotationalPick2 ball7(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 80), .phaseShift(2'b01), .PickX(PickX),
                       .RotX(rotateX7), .RotY(rotateY7));
	rotationalPick2 ball8(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 80), .phaseShift(2'b10), .PickX(PickX),
                       .RotX(rotateX8), .RotY(rotateY8));
   rotationalPick2 ball9(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 100), .phaseShift(2'b00), .PickX(PickX),
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
				showPick2 = 1'b1;
		  else if (((distX1*distX1 + distY1*distY1) <= (ballRadius)))
				showPick2 = 1'b1;
		  else if (((distX2*distX2 + distY2*distY2) <= (ballRadius)))
				showPick2 = 1'b1;
		  else if (((distX3*distX3 + distY3*distY3) <= (ballRadius))) 
				showPick2 = 1'b1;
		  else if (((distX4*distX4 + distY4*distY4) <= (ballRadius))) 
				showPick2 = 1'b1;
		  else if (((distX5*distX5 + distY5*distY5) <= (ballRadius))) 
				showPick2 = 1'b1;
		  else if (((distX6*distX6 + distY6*distY6) <= (ballRadius))) 
				showPick2 = 1'b1;
		  else if (((distX7*distX7 + distY7*distY7) <= (ballRadius))) 
				showPick2 = 1'b1;
		  else if (((distX8*distX8 + distY8*distY8) <= (ballRadius))) 
				showPick2 = 1'b1;
		  else if (((distX9*distX9 + distY9*distY9) <= (ballRadius))) 
				showPick2 = 1'b1;
		  else 
				showPick2 = 1'b0;
	end

endmodule