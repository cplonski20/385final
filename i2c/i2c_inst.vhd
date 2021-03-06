	component i2c is
		port (
			clk           : in  std_logic                     := 'X';             -- clk
			address       : out std_logic_vector(31 downto 0);                    -- address
			read          : out std_logic;                                        -- read
			readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			rst_n         : in  std_logic                     := 'X';             -- reset_n
			i2c_data_in   : in  std_logic                     := 'X';             -- conduit_data_in
			i2c_clk_in    : in  std_logic                     := 'X';             -- conduit_clk_in
			i2c_data_oe   : out std_logic;                                        -- conduit_data_oe
			i2c_clk_oe    : out std_logic                                         -- conduit_clk_oe
		);
	end component i2c;

	u0 : component i2c
		port map (
			clk           => CONNECTED_TO_clk,           --         clock.clk
			address       => CONNECTED_TO_address,       -- avalon_master.address
			read          => CONNECTED_TO_read,          --              .read
			readdata      => CONNECTED_TO_readdata,      --              .readdata
			readdatavalid => CONNECTED_TO_readdatavalid, --              .readdatavalid
			waitrequest   => CONNECTED_TO_waitrequest,   --              .waitrequest
			byteenable    => CONNECTED_TO_byteenable,    --              .byteenable
			rst_n         => CONNECTED_TO_rst_n,         --         reset.reset_n
			i2c_data_in   => CONNECTED_TO_i2c_data_in,   --   conduit_end.conduit_data_in
			i2c_clk_in    => CONNECTED_TO_i2c_clk_in,    --              .conduit_clk_in
			i2c_data_oe   => CONNECTED_TO_i2c_data_oe,   --              .conduit_data_oe
			i2c_clk_oe    => CONNECTED_TO_i2c_clk_oe     --              .conduit_clk_oe
		);

