module  drawPickTwo ( input CLK,
							input [9:0] centerX,centerY,radius, PickX, drawX, drawY,
                       output logic showPick2, showPick3);
	

	
	
	
logic [9:0] radius2;
assign radius2 = radius + 40;
	
//NOTE WE CREATE A LOT OF LOOK UP TABLE MODULES BY DOING THIS. IS THAT OK?	

logic [9:0] rotateX0,rotateX1,rotateX2,rotateX3, rotateX4,rotateX5,rotateX6,rotateX7,rotateX8,rotateX9,rotateX10;
logic [9:0] rotateY0,rotateY1,rotateY2,rotateY3, rotateY4,rotateY5,rotateY6,rotateY7,rotateY8,rotateY9,rotateY10;



logic [9:0] PickrotateX0,PickrotateX1,PickrotateX2,PickrotateX3, PickrotateX4,PickrotateX5,PickrotateX6,PickrotateX7,PickrotateX8,PickrotateX9,PickrotateX10, PickrotateX11, PickrotateX12, PickrotateX13, PickrotateX14;
logic [9:0] PickrotateY0,PickrotateY1,PickrotateY2,PickrotateY3, PickrotateY4,PickrotateY5,PickrotateY6,PickrotateY7,PickrotateY8,PickrotateY9,PickrotateY10,PickrotateY11,PickrotateY12,PickrotateY13,PickrotateY14;
	
//	rotationalPick2 ball0(.CLK(CLK),
//							.centerX(centerX),.centerY(centerY),.radius(radius- 30),.PickX(PickX),.phaseShift(2'b00),
//                       .RotX(rotateX0), .RotY(rotateY0));	
//	
//	rotationalPick2 ball1(.CLK(CLK),
//							.centerX(centerX),.centerY(centerY),.radius(radius - 40), .PickX(PickX),.phaseShift(2'b00),
//                       .RotX(rotateX1), .RotY(rotateY1));
//	
//	rotationalPick2 ball2(.CLK(CLK),
//							.centerX(centerX),.centerY(centerY),.radius(radius - 50), .PickX(PickX), .phaseShift(2'b00),
//                       .RotX(rotateX2), .RotY(rotateY2));			  
//	
	
	rotationalPick2 ball0(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 63), .PickX(PickX),.phaseShift(2'b00),
                       .RotX(rotateX0), .RotY(rotateY0));
	
	rotationalPick2 ball1(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 65), .PickX(PickX),.phaseShift(2'b00),
                       .RotX(rotateX1), .RotY(rotateY1));
	
	rotationalPick2 ball2(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius -70), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX2), .RotY(rotateY2));			  
	
	
	rotationalPick2 ball3(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 75), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX3), .RotY(rotateY3));
	rotationalPick2 ball4(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 80), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX4), .RotY(rotateY4));
							  
							  
	rotationalPick2 ball5(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 85), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX5), .RotY(rotateY5));
	rotationalPick2 ball6(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 90), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX6), .RotY(rotateY6));	
				
   rotationalPick2 ball7(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 95), .PickX(PickX), .phaseShift(2'b00),
                       .RotX(rotateX7), .RotY(rotateY7));					
	rotationalPick2 ball8(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 90), .phaseShift(2'b00), .PickX(PickX),
                       .RotX(rotateX8), .RotY(rotateY8));
	rotationalPick2 ball9(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 90), .phaseShift(2'b00), .PickX(PickX),
                       .RotX(rotateX9), .RotY(rotateY9));
   rotationalPick2 ball10(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius - 100), .phaseShift(2'b00), .PickX(PickX),
                       .RotX(rotateX10), .RotY(rotateY10));
							  
							  
							  
							  
							  
//////////////////////////////////////////////////////////////////////////////
rotationalPick2 Pickball0(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2), .phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX0), .RotY(PickrotateY0));	
	
	rotationalPick2 Pickball1(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 10), .phaseShift(2'b01),.PickX(PickX),
                       .RotX(PickrotateX1), .RotY(PickrotateY1));
	
	rotationalPick2 Pickball2(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 20),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX2), .RotY(PickrotateY2));			  
	
	
	rotationalPick2 Pickball3(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 30),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX3), .RotY(PickrotateY3));
	
	rotationalPick2 Pickball4(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 40),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX4), .RotY(PickrotateY4));
	
	rotationalPick2 Pickball5(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 -50), .phaseShift(2'b01),.PickX(PickX),
                       .RotX(PickrotateX5), .RotY(PickrotateY5));			  
	
	
	rotationalPick2 Pickball6(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 60),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX6), .RotY(PickrotateY6));
							
	rotationalPick2 Pickball7(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 70),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX7), .RotY(PickrotateY7));
	
	rotationalPick2 Pickball8(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 80),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX8), .RotY(PickrotateY8));			  
	
	
	rotationalPick2 Pickball9(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 90),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX9), .RotY(PickrotateY9));
	rotationalPick2 Pickball10(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 100), .phaseShift(2'b01),.PickX(PickX),
                       .RotX(PickrotateX10), .RotY(PickrotateY10));	

	rotationalPick2 Pickball11(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 110),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX11), .RotY(PickrotateY11));	
	rotationalPick2 Pickball12(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 120),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX12), .RotY(PickrotateY12));	
	rotationalPick2 Pickball13(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 130),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX13), .RotY(PickrotateY13));	
	rotationalPick2 Pickball14(.CLK(CLK),
							.centerX(centerX),.centerY(centerY),.radius(radius2 - 140),.phaseShift(2'b01), .PickX(PickX),
                       .RotX(PickrotateX14), .RotY(PickrotateY14));							  
							  
		
//	
	int PickdistX0,PickdistX1,PickdistX2,PickdistX3,PickdistX4,PickdistX5,PickdistX6,PickdistX7,PickdistX8,PickdistX9,PickdistX10,PickdistX11,PickdistX12,PickdistX13,PickdistX14;
	int PickdistY0,PickdistY1,PickdistY2,PickdistY3,PickdistY4,PickdistY5,PickdistY6,PickdistY7,PickdistY8,PickdistY9,PickdistY10,PickdistY11,PickdistY12,PickdistY13,PickdistY14;
	
	int distX0,distX1,distX2,distX3,distX4,distX5,distX6,distX7,distX8,distX9,distX10;
	int distY0,distY1,distY2,distY3,distY4,distY5,distY6,distY7,distY8,distY9,distY10;
	
	int ballRadius, ballRadius2, ballRadius3;	
	assign ballRadius = 64;
	assign ballRadius2 = 361;
	assign ballRadius3 = 121;
	// Radius Squared
	
	always_comb
	begin
	PickdistX0 = drawX - PickrotateX0;
	PickdistX1 = drawX - PickrotateX1;
	PickdistX2 = drawX - PickrotateX2;
	PickdistX3 = drawX - PickrotateX3;
	PickdistX4 = drawX - PickrotateX4;
	PickdistX5 = drawX - PickrotateX5;
	PickdistX6 = drawX - PickrotateX6;
	PickdistX7 = drawX - PickrotateX7;
	PickdistX8 = drawX - PickrotateX8;
	PickdistX9 = drawX - PickrotateX9;
	PickdistX10 = drawX - PickrotateX10;
	PickdistX11 = drawX - PickrotateX11;
	PickdistX12 = drawX - PickrotateX12;
	PickdistX13 = drawX - PickrotateX13;
	PickdistX14 = drawX - PickrotateX14;
	
	PickdistY0 = drawY - PickrotateY0;
	PickdistY1 = drawY - PickrotateY1;
	PickdistY2 = drawY - PickrotateY2;
	PickdistY3 = drawY - PickrotateY3;
	PickdistY4 = drawY - PickrotateY4;
	PickdistY5 = drawY - PickrotateY5;
	PickdistY6 = drawY - PickrotateY6;
	PickdistY7 = drawY - PickrotateY7;
	PickdistY8 = drawY - PickrotateY8;
	PickdistY9 = drawY - PickrotateY9;
	PickdistY10 = drawY - PickrotateY10;
	PickdistY11 = drawY - PickrotateY11;
	PickdistY12 = drawY - PickrotateY12;
	PickdistY13 = drawY - PickrotateY13;
	PickdistY14 = drawY - PickrotateY14;
	
	
	
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
	distX10 = drawX - rotateX10;
	
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
	distY10 = drawY - rotateY10;
	
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
		  else if (((distX10*distX10 + distY10*distY10) <= (ballRadius2))) 
				showPick2 = 1'b1;
		  else 
				showPick2 = 1'b0;
				
				
				
				
			if (((PickdistX0*PickdistX0 + PickdistY0*PickdistY0) <= (ballRadius3)))  // !!!note ballRadius is radius squared of ball. assigned above
				showPick3 = 1'b1;
		  else if (((PickdistX1*PickdistX1 + PickdistY1*PickdistY1) <= (ballRadius3)))
				showPick3 = 1'b1;
		  else if (((PickdistX2*PickdistX2 + PickdistY2*PickdistY2) <= (ballRadius3)))
				showPick3 = 1'b1;
		  else if (((PickdistX3*PickdistX3 + PickdistY3*PickdistY3) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX4*PickdistX4 + PickdistY4*PickdistY4) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX5*PickdistX5 + PickdistY5*PickdistY5) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX6*PickdistX6 + PickdistY6*PickdistY6) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX7*PickdistX7 + PickdistY7*PickdistY7) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX8*PickdistX8 + PickdistY8*PickdistY8) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX9*PickdistX9 + PickdistY9*PickdistY9) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX10*PickdistX10 + PickdistY10*PickdistY10) <= (ballRadius3))) 
				showPick3 = 1'b1;
		  else if (((PickdistX11*PickdistX11 + PickdistY11*PickdistY11) <= (ballRadius3))) 
				showPick3 = 1'b1;
			else if (((PickdistX12*PickdistX12 + PickdistY12*PickdistY12) <= (ballRadius3))) 
				showPick3 = 1'b1;
			else if (((PickdistX13*PickdistX13 + PickdistY13*PickdistY13) <= (ballRadius3))) 
				showPick3 = 1'b1;
			else if (((PickdistX14*PickdistX14 + PickdistY14*PickdistY14) <= (ballRadius3))) 
				showPick3 = 1'b1;	
				
		  else 
				showPick3 = 1'b0;
		
	end

endmodule