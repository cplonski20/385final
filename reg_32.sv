module reg_32 ( input						Clk, Reset, Load, ShiftIn, Shift_En,
					input						[31:0] D,
					output logic 			[31:0] Data_Out, output logic ShiftOut);
					
		always_ff @ (posedge Clk or posedge Reset)
		begin
				// Setting the output Q[16..0] of the register to zeros as Reset is pressed
				if(Reset)
					Data_Out <= 32'b0;
				// Loading D into register when load button is pressed (will eiher be switches or result of sum)
				else if(Load)
					Data_Out <= D;
				else if(Shift_En)
					begin
					ShiftOut <= Data_Out[31];
					Data_Out <= {Data_Out[30:0],ShiftIn};
					end
					
		end
		
endmodule