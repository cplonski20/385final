	i2c u0 (
		.clk           (<connected-to-clk>),           //         clock.clk
		.address       (<connected-to-address>),       // avalon_master.address
		.read          (<connected-to-read>),          //              .read
		.readdata      (<connected-to-readdata>),      //              .readdata
		.readdatavalid (<connected-to-readdatavalid>), //              .readdatavalid
		.waitrequest   (<connected-to-waitrequest>),   //              .waitrequest
		.byteenable    (<connected-to-byteenable>),    //              .byteenable
		.rst_n         (<connected-to-rst_n>),         //         reset.reset_n
		.i2c_data_in   (<connected-to-i2c_data_in>),   //   conduit_end.conduit_data_in
		.i2c_clk_in    (<connected-to-i2c_clk_in>),    //              .conduit_clk_in
		.i2c_data_oe   (<connected-to-i2c_data_oe>),   //              .conduit_data_oe
		.i2c_clk_oe    (<connected-to-i2c_clk_oe>)     //              .conduit_clk_oe
	);

