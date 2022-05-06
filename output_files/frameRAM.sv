module  frameRAM
(
		input [7:0] data_In,
		input [11:0] write_address, read_address,
		input we, Clk,

		output logic [7:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [7:0] mem [0:6962];

initial
begin
	 $readmemh("clickingSoundOut.txt", mem);
end


always @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule