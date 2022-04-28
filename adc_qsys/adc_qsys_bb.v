
module adc_qsys (
	clk_clk,
	clock_bridge_sys_out_clk_clk,
	modular_adc_0_command_valid,
	modular_adc_0_command_channel,
	modular_adc_0_command_startofpacket,
	modular_adc_0_command_endofpacket,
	modular_adc_0_command_ready,
	modular_adc_0_response_valid,
	modular_adc_0_response_channel,
	modular_adc_0_response_data,
	modular_adc_0_response_startofpacket,
	modular_adc_0_response_endofpacket,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	sdrampll_c1_clk);	

	input		clk_clk;
	output		clock_bridge_sys_out_clk_clk;
	input		modular_adc_0_command_valid;
	input	[4:0]	modular_adc_0_command_channel;
	input		modular_adc_0_command_startofpacket;
	input		modular_adc_0_command_endofpacket;
	output		modular_adc_0_command_ready;
	output		modular_adc_0_response_valid;
	output	[4:0]	modular_adc_0_response_channel;
	output	[11:0]	modular_adc_0_response_data;
	output		modular_adc_0_response_startofpacket;
	output		modular_adc_0_response_endofpacket;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output		sdrampll_c1_clk;
endmodule
