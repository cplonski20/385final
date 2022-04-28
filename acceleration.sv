//module acceleration( input logic [12:0] vol, input logic sys_clk, 
//output logic [12:0] acc, pos, output logic [1:0] dir);


module acceleration(input logic sys_clk, pickMode, input logic [12:0] vol, output logic [2:0] dir, LRdir);


always_comb
begin
		//LRdir = 0;
		if(vol >= 2000 & vol <= 3000)
		begin
			dir = 1;
		end
		else if(vol <= 1000 & vol >= 150)
		begin
			dir = 2;
		end
		else if(vol < 150)
		begin
			dir = 3;
		end
		else if(vol > 3000)
		begin
			dir = 4;
		end
		else
		begin
			dir = 0;
		end

	
		//dir = 0;
		if(vol >= 2000 & vol <= 3000)
		begin
			LRdir = 1;
		end
		else if(vol > 3000)
		begin
			LRdir = 2;
		end
		else
		begin
			LRdir = 0;
		end


end

endmodule 