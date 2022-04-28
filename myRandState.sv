module myRandState(input logic Clk, input logic enable, output logic [3:0] myStateEasy, output logic [4:0] myStateMedium, output logic [5:0] myStateHard);


logic [3:0] currRandEasy = 0;
logic [4:0] currRandMedium = 0;
logic [5:0] currRandHard = 0;

always_ff @ (posedge Clk)
begin
if(~enable)
begin
currRandEasy <= currRandEasy + 1;
currRandMedium <= currRandMedium + 1;
currRandHard <= currRandHard + 1;
end
end

assign myStateEasy = currRandEasy;
assign myStateMedium = currRandMedium;
assign myStateHard = currRandHard;

endmodule