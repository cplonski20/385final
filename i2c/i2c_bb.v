
module i2c (
	clk,
	address,
	read,
	readdata,
	readdatavalid,
	waitrequest,
	byteenable,
	rst_n,
	i2c_data_in,
	i2c_clk_in,
	i2c_data_oe,
	i2c_clk_oe);	

	input		clk;
	output	[31:0]	address;
	output		read;
	input	[31:0]	readdata;
	input		readdatavalid;
	input		waitrequest;
	output	[3:0]	byteenable;
	input		rst_n;
	input		i2c_data_in;
	input		i2c_clk_in;
	output		i2c_data_oe;
	output		i2c_clk_oe;
endmodule
