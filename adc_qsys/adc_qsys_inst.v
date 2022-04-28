	adc_qsys u0 (
		.clk_clk                              (<connected-to-clk_clk>),                              //                      clk.clk
		.clock_bridge_sys_out_clk_clk         (<connected-to-clock_bridge_sys_out_clk_clk>),         // clock_bridge_sys_out_clk.clk
		.modular_adc_0_command_valid          (<connected-to-modular_adc_0_command_valid>),          //    modular_adc_0_command.valid
		.modular_adc_0_command_channel        (<connected-to-modular_adc_0_command_channel>),        //                         .channel
		.modular_adc_0_command_startofpacket  (<connected-to-modular_adc_0_command_startofpacket>),  //                         .startofpacket
		.modular_adc_0_command_endofpacket    (<connected-to-modular_adc_0_command_endofpacket>),    //                         .endofpacket
		.modular_adc_0_command_ready          (<connected-to-modular_adc_0_command_ready>),          //                         .ready
		.modular_adc_0_response_valid         (<connected-to-modular_adc_0_response_valid>),         //   modular_adc_0_response.valid
		.modular_adc_0_response_channel       (<connected-to-modular_adc_0_response_channel>),       //                         .channel
		.modular_adc_0_response_data          (<connected-to-modular_adc_0_response_data>),          //                         .data
		.modular_adc_0_response_startofpacket (<connected-to-modular_adc_0_response_startofpacket>), //                         .startofpacket
		.modular_adc_0_response_endofpacket   (<connected-to-modular_adc_0_response_endofpacket>),   //                         .endofpacket
		.reset_reset_n                        (<connected-to-reset_reset_n>),                        //                    reset.reset_n
		.sdram_wire_addr                      (<connected-to-sdram_wire_addr>),                      //               sdram_wire.addr
		.sdram_wire_ba                        (<connected-to-sdram_wire_ba>),                        //                         .ba
		.sdram_wire_cas_n                     (<connected-to-sdram_wire_cas_n>),                     //                         .cas_n
		.sdram_wire_cke                       (<connected-to-sdram_wire_cke>),                       //                         .cke
		.sdram_wire_cs_n                      (<connected-to-sdram_wire_cs_n>),                      //                         .cs_n
		.sdram_wire_dq                        (<connected-to-sdram_wire_dq>),                        //                         .dq
		.sdram_wire_dqm                       (<connected-to-sdram_wire_dqm>),                       //                         .dqm
		.sdram_wire_ras_n                     (<connected-to-sdram_wire_ras_n>),                     //                         .ras_n
		.sdram_wire_we_n                      (<connected-to-sdram_wire_we_n>),                      //                         .we_n
		.sdrampll_c1_clk                      (<connected-to-sdrampll_c1_clk>)                       //              sdrampll_c1.clk
	);

