module myRandStateMedium(input logic Clk, input logic enable, output logic [4:0] myState);


logic [4:0] currRand = 0;

always_ff @ (posedge Clk)
begin
if(~enable)
begin
currRand <= currRand + 1;
end
end

assign myState = currRand;

endmodule