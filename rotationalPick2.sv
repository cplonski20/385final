module  rotationalPick2 ( input CLK, input [1:0] phaseShift,
							input [9:0] centerX,centerY,radius, PickX,
                       output logic [9:0] RotX, RotY);

//the key varibale it takes which is PickY must go from 32 to 479 inclusive

logic [8:0] cosADDR;
logic [9:0] cosDATA;
logic [8:0] sinADDR;
logic [9:0] sinDATA;

//NOTE SMALL BUG WHEN ON SPECIFIC LOCATIONS OF PICK moving




//phase shift:: 0 - none :: 1 - 90 degrees clockwise :: 2 - 90 degrees counterclockwise

logic [9:0] phase; 
always_comb
begin
case(phaseShift)
2'b00: 
begin
cosADDR = ((PickX-488) -1);
sinADDR = ((PickX-488) + 112 - 1);
end
2'b01:
begin
cosADDR = PickX-488+112 - 1;
sinADDR = PickX-488 + 1;
end

2'b10:
begin
cosADDR = PickX-488+112 - 1;
sinADDR = PickX-488 - 1;
end

default:
begin
cosADDR = ((PickX-488)) -1;
sinADDR = ((PickX-488) + 112 - 1);
end

endcase
end

TrigLUT cosmod(.address(cosADDR),.clock(CLK),.q(cosDATA));
TrigLUT sinmod(.address(sinADDR),.clock(CLK),.q(sinDATA));

//assign cosADDR = (PickX-488); //start at 112 which is 90 degrres cuz pickx start at 600
//assign sinADDR =  ((PickX-488) + 112);

always_comb
begin
	 if(phaseShift == 2'b01)
	 begin
	 	 RotX = centerX + (radius*cosDATA)/1000; // center + r*cos
		 RotY = centerY + (radius*sinDATA)/1000; // center + r*sin
	 end
	 else if(phaseShift == 2'b10)
	 begin
	 	 RotX = centerX - (radius*cosDATA)/1000; // center + r*cos
		 RotY = centerY - (radius*sinDATA)/1000; // center + r*sin
	 end
	 else if(PickX >= 486 && PickX <= 600)
	 begin
	 	 RotX = centerX - (radius*cosDATA)/1000; // center + r*cos
		 RotY = centerY + (radius*sinDATA)/1000; // center + r*sin
	 end
	 else
	 begin
	 	 RotX = centerX + radius;
		 RotY = centerY;
	 end
end

endmodule
