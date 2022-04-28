module  rotational_motion ( input CLK,
							input [9:0] centerX,centerY,radius, PickY,
                       output logic [9:0] RotX, RotY);

//the key varibale it takes which is PickY must go from 32 to 479 inclusive

logic [8:0] cosADDR;
logic [9:0] cosDATA;
logic [8:0] sinADDR;
logic [9:0] sinDATA;

//NOTE SMALL BUG WHEN ON SPECIFIC LOCATIONS OF PICK moving

TrigLUT cosmod(.address(cosADDR),.clock(CLK),.q(cosDATA));
TrigLUT sinmod(.address(sinADDR),.clock(CLK),.q(sinDATA));

assign cosADDR = (PickY-32) % 448; 
assign sinADDR =  ((PickY-32)+ 112) % 448;

always_comb
begin
	 if(32 <= PickY & PickY < 144)
	 begin
	 	 RotX = centerX + (radius*cosDATA)/1000; // center + r*cos
		 RotY = centerY + (radius*sinDATA)/1000; // center + r*sin
	 end
	 else if(144 <= PickY & PickY < 256)
	 begin
	 	 RotX = centerX - (radius*cosDATA)/1000; // center + r*cos
		 RotY = centerY + (radius*sinDATA)/1000; // center + r*sin
	 end
	 else if(256 <= PickY & PickY < 368)
	 begin
	 	 RotX = centerX - (radius*cosDATA)/1000; // center + r*cos
		 RotY = centerY - (radius*sinDATA)/1000; // center + r*sin
	 end
	 else if (368 <= PickY & PickY < 480)
	 begin
	 	 RotX = centerX + (radius*cosDATA)/1000; // center + r*cos
		 RotY = (centerY - (radius*sinDATA)/1000); // center + r*sin
	 end
	 else
	 begin
	 	 RotX = centerX + radius;
		 RotY = centerY;
	 end
end

endmodule
