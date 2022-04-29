// ============================================================================
// Copyright (c) 2016 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================



module LockPicker(

      ///////// Clocks /////////
      input              ADC_CLK_10,
      input              MAX10_CLK1_50,
      input              MAX10_CLK2_50,

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,
		output   [ 7: 0]   HEX5fake,
		output   [ 7: 0]   HEX0fake,
      output   [ 7: 0]   HEX1fake,
      output   [ 7: 0]   HEX2fake,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,

      ///////// Clock Generator I2C /////////
      output             CLK_I2C_SCL,
      inout              CLK_I2C_SDA,

      ///////// GSENSOR /////////
      output             GSENSOR_SCLK,
      inout              GSENSOR_SDO,
      inout              GSENSOR_SDI,
      input    [ 2: 1]   GSENSOR_INT,
      output             GSENSOR_CS_N,

      ///////// GPIO /////////
      inout    [35: 0]   GPIO,

      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N,
		//output reg [12:0] thisAcc,
		//output reg [12:0] thisVol,
		output [2:0] thisDir
		
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire reset_n;
wire sys_clk;


//=======================================================
//  Structural coding
//=======================================================

assign reset_n = 1'b1;



    adc_qsys u0 (
        .clk_clk                              (MAX10_CLK1_50),                              //                    clk.clk
        .reset_reset_n                        (reset_n),                        //                  reset.reset_n
        .modular_adc_0_command_valid          (command_valid),          //  modular_adc_0_command.valid
        .modular_adc_0_command_channel        (command_channel),        //                       .channel
        .modular_adc_0_command_startofpacket  (command_startofpacket),  //                       .startofpacket
        .modular_adc_0_command_endofpacket    (command_endofpacket),    //                       .endofpacket
        .modular_adc_0_command_ready          (command_ready),          //                       .ready
        .modular_adc_0_response_valid         (response_valid),         // modular_adc_0_response.valid
        .modular_adc_0_response_channel       (response_channel),       //                       .channel
        .modular_adc_0_response_data          (response_data),          //                       .data
        .modular_adc_0_response_startofpacket (response_startofpacket), //                       .startofpacket
        .modular_adc_0_response_endofpacket   (response_endofpacket),    //                       .endofpacket
        .clock_bridge_sys_out_clk_clk         (sys_clk)          // clock_bridge_sys_out_clk.clk
    );

	 
////////////////////////////////////////////
// command
wire  command_valid;
wire  [4:0] command_channel;
wire  command_startofpacket;
wire  command_endofpacket;
wire command_ready;

// continused send command
assign command_startofpacket = 1'b1; // // ignore in altera_adc_control core
assign command_endofpacket = 1'b1; // ignore in altera_adc_control core
assign command_valid = 1'b1; // 
assign command_channel = SW[2:0]+1; // SW2/SW1/SW0 down: map to arduino ADC_IN0

////////////////////////////////////////////
// response
wire response_valid/* synthesis keep */;
wire [4:0] response_channel;
wire [11:0] response_data;
wire response_startofpacket;
wire response_endofpacket;
reg [4:0]  cur_adc_ch /* synthesis noprune */;
reg [11:0] adc_sample_data /* synthesis noprune */;
reg [12:0] vol /* synthesis noprune */;




always @ (posedge sys_clk)
begin
	if (response_valid)
	begin
		adc_sample_data <= response_data;
		cur_adc_ch <= response_channel;
		
		vol <= response_data * 2 * 2500 / 4095;
	end
end			

// adc_sample_data: hold 12-bit adc sample value
// Vout = Vin (12-bit x2 x 2500 / 4095)	


assign LEDR[9:0] = vol[12:3];  // led is high active


assign HEX5fake[7] = 1'b1; // low active
assign HEX4[7] = 1'b1; // low active
assign HEX3[7] = 1'b0; // low active
assign HEX2[7] = 1'b1; // low active
assign HEX1[7] = 1'b1; // low active
assign HEX0[7] = 1'b1; // low active

assign HEX2fake[7] = 1'b1; // low active
assign HEX1fake[7] = 1'b1; // low active
assign HEX0fake[7] = 1'b1; // low active

//always HEX5[7] = currentACC;



//mine
wire [12:0] currentAcc;



SEG7_LUT	SEG7_LUT_ch (
	.oSEG(HEX5fake),
	.iDIG(SW[2:0])
);

//assign HEX4 = 8'b10111111;

SEG7_LUT	SEG7_LUT_v (
	.oSEG(HEX3),
	.iDIG(vol/1000)
);

SEG7_LUT	SEG7_LUT_v_1 (
	.oSEG(HEX2),
	.iDIG(vol/100 - (vol/1000)*10)
);

SEG7_LUT	SEG7_LUT_v_2 (
	.oSEG(HEX1),
	.iDIG(vol/10 - (vol/100)*10)
);

SEG7_LUT	SEG7_LUT_v_3 (
	.oSEG(HEX0),
	.iDIG(vol - (vol/10)*10)
);


acceleration accMaker(
	.vol(vol), .pickMode(pickMode), .sys_clk(sys_clk), .dir(dir), .LRdir(LRdir)
	);

HexDriver accHex(.In0(currScreen), .Out0(HEX5));

HexDriver hex0(.In0(coolbot[3:0]), .Out0(HEX4));
//HexDriver hex1(.In0(pickysig[7:4]), .Out0(HEX1));
//HexDriver hex2(.In0(pickysig[9:8]), .Out0(HEX2));
//	
//always thisAcc = currentAcc;
//always thisVol = vol;

wire [2:0] dir, LRdir;




vga_controller vga_ctrl(
								.Clk(MAX10_CLK1_50),
								.Reset(Reset_h), 
								.hs(VGA_HS), 
								.vs(VGA_VS),
								.pixel_clk(VGA_clk), 
								.blank(blank), 
								.sync(sync), 
								.DrawX(drawxsig), 
								.DrawY(drawysig) );
pick Pick(
			.Reset(Reset_h | SW[9]), .pickMode(pickMode), .frame_clk(VGA_VS),
			.dir(dir), .pickX(pickxsig), .pickY(pickysig));
			
			
LRpick LRpick(
.Reset(Reset_h | SW[9]), .frame_clk(VGA_VS),
 .pickMode(pickMode), .LRdir(LRdir), .pickLRx(pickLRx), .pickLRy(pickLRy));			
			
			
			
			
color_mapper COLOR_MAPPER( .CLK(MAX10_CLK1_50), .VGA_clk(VGA_clk), .blank(blank), .pickLRx(pickLRx), .pickLRy(pickLRy),
				.PickX(pickxsig), .PickY(pickysig), .DrawX(drawxsig), .DrawY(drawysig), .currScreen(currScreen), .close(close),
				.Red(Red), .Green(Green), .Blue(Blue) );


wire Reset_h, vssig, blank, sync, VGA_Clk;
wire [3:0] Red, Blue, Green;
wire [9:0] drawxsig, drawysig, pickxsig, pickysig;

assign VGA_R = Red;
assign VGA_B = Blue;
assign VGA_G = Green;
assign thisDir = dir;

wire levelEasyDone;
wire [2:0] currScreen;
wire levelEasyStart;
wire levelMedDone;
wire levelMedStart;

wire [3:0] coolbot, coolbotstorage;

wire pickMode, close;

assign pickMode = SW[0];

wire [9:0] pickLRx, pickLRy;





controlUnit control (.Clk(sys_clk), .reset(SW[9]), .start(SW[8]), .levelEasyDone(levelEasyDone), .levelMedDone(levelMedDone), .screen(currScreen), .levelEasyStart(levelEasyStart), .levelMedStart(levelMedStart));

levelEasy levelEasy( .levelEasyStart(levelEasyStart), .Clk(sys_clk), .openner(KEY[1]), .pickY(pickysig), .pickLRx(pickLRx), .close(close), .levelEasyDone(levelEasyDone), .HEXOUT(coolbot));

levelMedium levelMedium(.levelMedStart(levelMedStart), .Clk(sys_clk), .openner(KEY[1]), .pickY(pickysig), .levelMedDone(levelMedDone), .HEXOUT(coolbotstorage));

endmodule
