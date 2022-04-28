	component adc_qsys is
		port (
			clk_clk                              : in    std_logic                     := 'X';             -- clk
			clock_bridge_sys_out_clk_clk         : out   std_logic;                                        -- clk
			modular_adc_0_command_valid          : in    std_logic                     := 'X';             -- valid
			modular_adc_0_command_channel        : in    std_logic_vector(4 downto 0)  := (others => 'X'); -- channel
			modular_adc_0_command_startofpacket  : in    std_logic                     := 'X';             -- startofpacket
			modular_adc_0_command_endofpacket    : in    std_logic                     := 'X';             -- endofpacket
			modular_adc_0_command_ready          : out   std_logic;                                        -- ready
			modular_adc_0_response_valid         : out   std_logic;                                        -- valid
			modular_adc_0_response_channel       : out   std_logic_vector(4 downto 0);                     -- channel
			modular_adc_0_response_data          : out   std_logic_vector(11 downto 0);                    -- data
			modular_adc_0_response_startofpacket : out   std_logic;                                        -- startofpacket
			modular_adc_0_response_endofpacket   : out   std_logic;                                        -- endofpacket
			reset_reset_n                        : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr                      : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                        : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                     : out   std_logic;                                        -- cas_n
			sdram_wire_cke                       : out   std_logic;                                        -- cke
			sdram_wire_cs_n                      : out   std_logic;                                        -- cs_n
			sdram_wire_dq                        : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                       : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n                     : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                      : out   std_logic;                                        -- we_n
			sdrampll_c1_clk                      : out   std_logic                                         -- clk
		);
	end component adc_qsys;

	u0 : component adc_qsys
		port map (
			clk_clk                              => CONNECTED_TO_clk_clk,                              --                      clk.clk
			clock_bridge_sys_out_clk_clk         => CONNECTED_TO_clock_bridge_sys_out_clk_clk,         -- clock_bridge_sys_out_clk.clk
			modular_adc_0_command_valid          => CONNECTED_TO_modular_adc_0_command_valid,          --    modular_adc_0_command.valid
			modular_adc_0_command_channel        => CONNECTED_TO_modular_adc_0_command_channel,        --                         .channel
			modular_adc_0_command_startofpacket  => CONNECTED_TO_modular_adc_0_command_startofpacket,  --                         .startofpacket
			modular_adc_0_command_endofpacket    => CONNECTED_TO_modular_adc_0_command_endofpacket,    --                         .endofpacket
			modular_adc_0_command_ready          => CONNECTED_TO_modular_adc_0_command_ready,          --                         .ready
			modular_adc_0_response_valid         => CONNECTED_TO_modular_adc_0_response_valid,         --   modular_adc_0_response.valid
			modular_adc_0_response_channel       => CONNECTED_TO_modular_adc_0_response_channel,       --                         .channel
			modular_adc_0_response_data          => CONNECTED_TO_modular_adc_0_response_data,          --                         .data
			modular_adc_0_response_startofpacket => CONNECTED_TO_modular_adc_0_response_startofpacket, --                         .startofpacket
			modular_adc_0_response_endofpacket   => CONNECTED_TO_modular_adc_0_response_endofpacket,   --                         .endofpacket
			reset_reset_n                        => CONNECTED_TO_reset_reset_n,                        --                    reset.reset_n
			sdram_wire_addr                      => CONNECTED_TO_sdram_wire_addr,                      --               sdram_wire.addr
			sdram_wire_ba                        => CONNECTED_TO_sdram_wire_ba,                        --                         .ba
			sdram_wire_cas_n                     => CONNECTED_TO_sdram_wire_cas_n,                     --                         .cas_n
			sdram_wire_cke                       => CONNECTED_TO_sdram_wire_cke,                       --                         .cke
			sdram_wire_cs_n                      => CONNECTED_TO_sdram_wire_cs_n,                      --                         .cs_n
			sdram_wire_dq                        => CONNECTED_TO_sdram_wire_dq,                        --                         .dq
			sdram_wire_dqm                       => CONNECTED_TO_sdram_wire_dqm,                       --                         .dqm
			sdram_wire_ras_n                     => CONNECTED_TO_sdram_wire_ras_n,                     --                         .ras_n
			sdram_wire_we_n                      => CONNECTED_TO_sdram_wire_we_n,                      --                         .we_n
			sdrampll_c1_clk                      => CONNECTED_TO_sdrampll_c1_clk                       --              sdrampll_c1.clk
		);

