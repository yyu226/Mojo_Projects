`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Description: this project is created for the augmented reality paper. In AR mode
//              every 8th frame coming from the PC is replaced with a gray-scale
//              plain pattern. In SLI mode, the 24-frame composite pattern is
//              projected.
//					 This single bit file can do both face paint and position tracking.
//					 The face tracking experiment uses two Basler camera and one Optoma ML750ST
//					 projector, sequentially collects the scanning data from two cameras
//					 using my big desktop PC (QT:LauMultipathTool)
//////////////////////////////////////////////////////////////////////////////////
module dvi_demo(
  //input wire        rstbtn_n,    //The pink reset button
  input wire  clk100,      //50 MHz osicallator
  
  input wire  CLK_EXT,
  inout wire  PO_SDA,
  output wire PO_SCL,
  
  input wire [3:0]  RX0_TMDS,
  input wire [3:0]  RX0_TMDSB,

  output wire [3:0] TX0_TMDS,
  output wire [3:0] TX0_TMDSB,
  
  inout wire DDC_SCL,
  inout wire DDC_SDA,
  
  //BASLER1
  input wire  sync_in_1,
  input wire  sync_in_2,
  output wire sync_out_1,
  output wire sync_out_2,
  //BASLER2
  input wire  sync_in_1B2,
  input wire  sync_in_2B2,
  output wire sync_out_1B2,
  output wire sync_out_2B2,

  output wire [7:0] LED,
  output wire [1:0] test_pin,
  
  //UART with AVR
  input  wire RST_N,
  input  wire CCLK,
  input  wire AVR_RX_BUSY,
  input  wire UART_RX,
  output wire UART_TX,
  
  //SPI with AVR
  output SPI_MISO,
  input  SPI_SS,
  input  SPI_MOSI,
  input  SPI_SCK
);

  wire rstbtn_n;
  wire [1:0] SW;
  wire [29:0] sl_extc;
  wire po_hsync, po_vsync, po_de;
  wire sync_hs, sync_vs, de;
  
  wire gclk;
  wire clock_pix, clock_tmds;
  wire extc_serdesstrobe;
  wire dp_rstin;
  wire clkext;
  wire [15:0] pout, pvout;
  
  wire dds_start;
  wire CLK_40M;
  
  reg rMSW;
  reg [1:0] rMODE = 2'b00;
  reg [1:0] oMODE = 2'b00;
  reg [7:0] lut [0:1023];
  
  
  initial
  begin
		rMSW = 0;
  end
  
  assign rstbtn_n = 1'b1;
  assign SW = 2'b00;

  ////////////////////////////////////////////////////
  // 25 MHz and switch debouncers
  ////////////////////////////////////////////////////
  wire clk10, clk10m;

  BUFIO2 #(.DIVIDE_BYPASS("FALSE"), .DIVIDE(4))
  sysclk_div (.DIVCLK(clk10m), .IOCLK(), .SERDESSTROBE(), .I(clk100));

  BUFG clk10_buf (.I(clk10m), .O(clk10));

  wire [1:0] sws;

  synchro #(.INITIALIZE("LOGIC0"))
  synchro_sws_0 (.async(SW[0]),.sync(sws[0]),.clk(clk10));

  synchro #(.INITIALIZE("LOGIC0"))
  synchro_sws_1 (.async(SW[1]),.sync(sws[1]),.clk(clk10));

  wire [1:0] select = sws;

  reg [1:0] select_q = 2'b00;
  reg [1:0] switch = 2'b00;
  always @ (posedge clk10) begin
    select_q <= select;

    switch[0] = select[0] ^ select_q[0];
    switch[1] = select[1] ^ select_q[1];
  end

edid_256 OPTOMA(
				.CLOCK_50					(clk10),
				
				.SCL							(DDC_SCL),
				.SDA							(DDC_SDA),
				
				.SW							(),
				.dLED							()				//NC or LED
    );
  /////////////////////////
  //
  // Input Port 0
  //
  /////////////////////////
  wire rx0_pclk, rx0_pclkx2, rx0_pclkx10, rx0_pllclk0;
  wire rx0_plllckd;
  wire rx0_reset;
  wire rx0_serdesstrobe;
  wire rx0_hsync;          // hsync data
  wire rx0_vsync;          // vsync data
  wire rx0_de;             // data enable
  wire rx0_psalgnerr;      // channel phase alignment error
  wire [7:0] rx0_red;      // pixel data out
  wire [7:0] rx0_green;    // pixel data out
  wire [7:0] rx0_blue;     // pixel data out
  wire [29:0] rx0_sdata;
  wire rx0_blue_vld;
  wire rx0_green_vld;
  wire rx0_red_vld;
  wire rx0_blue_rdy;
  wire rx0_green_rdy;
  wire rx0_red_rdy;

  dvi_decoder dvi_rx0 (
    //These are input ports
    .tmdsclk_p   (RX0_TMDS[3]),
    .tmdsclk_n   (RX0_TMDSB[3]),
    .blue_p      (RX0_TMDS[0]),
    .green_p     (RX0_TMDS[1]),
    .red_p       (RX0_TMDS[2]),
    .blue_n      (RX0_TMDSB[0]),
    .green_n     (RX0_TMDSB[1]),
    .red_n       (RX0_TMDSB[2]),
    .exrst       (~rstbtn_n),

    //These are output ports
    .reset       (rx0_reset),
    .pclk        (rx0_pclk),
    .pclkx2      (rx0_pclkx2),
    .pclkx10     (rx0_pclkx10),
    .pllclk0     (rx0_pllclk0), // PLL x10 output
    .pllclk1     (rx0_pllclk1), // PLL x1 output
    .pllclk2     (rx0_pllclk2), // PLL x2 output
    .pll_lckd    (rx0_plllckd),
    .tmdsclk     (rx0_tmdsclk),
    .serdesstrobe(rx0_serdesstrobe),
    .hsync       (rx0_hsync),
    .vsync       (rx0_vsync),
    .de          (rx0_de),

    .blue_vld    (rx0_blue_vld),
    .green_vld   (rx0_green_vld),
    .red_vld     (rx0_red_vld),
    .blue_rdy    (rx0_blue_rdy),
    .green_rdy   (rx0_green_rdy),
    .red_rdy     (rx0_red_rdy),

    .psalgnerr   (rx0_psalgnerr),

    .sdout       (rx0_sdata),
    .red         (rx0_red),
    .green       (rx0_green),
    .blue        (rx0_blue)); 

    wire CLOCK100;
	 BUFG inbufg (.I(clk100), .O(CLOCK100));

  // TMDS output
  /////////////////
  //
  // Output Port 0
  //
  /////////////////
  wire         tx0_de;
  wire         tx0_pclk;
  wire         tx0_pclkx2;
  wire         tx0_pclkx10;
  wire         tx0_serdesstrobe;
  wire         tx0_reset;
  wire [7:0]   tx0_blue;
  wire [7:0]   tx0_green;
  wire [7:0]   tx0_red;
  wire         tx0_hsync;
  wire         tx0_vsync;
  wire         tx0_pll_reset;
  
  /*assign tx0_de           = (select[0]) ? rx1_de    : rx0_de;
  assign tx0_blue         = (select[0]) ? rx1_blue  : rx0_blue;
  assign tx0_green        = (select[0]) ? rx1_green : rx0_green;
  assign tx0_red          = (select[0]) ? rx1_red   : rx0_red;
  assign tx0_hsync        = (select[0]) ? rx1_hsync : rx0_hsync;
  assign tx0_vsync        = (select[0]) ? rx1_vsync : rx0_vsync;
  assign tx0_pll_reset    =  switch[0] | ((select[0]) ? rx1_reset : rx0_reset);*/
  assign tx0_de           = (rMODE!=2'b00) ? rx0_de : po_de;
  assign tx0_blue         = rx0_blue;
  assign tx0_green        = rx0_green;
  assign tx0_red          = rx0_red;
  assign tx0_hsync        = (rMODE!=2'b00) ? rx0_hsync : po_hsync;
  assign tx0_vsync        = (rMODE!=2'b00) ? rx0_vsync : po_vsync;
  //assign tx0_pll_reset    = switch[0] | rx0_reset;
  assign tx0_pll_reset    = (rMODE==2'b00) ? (!dds_start | (rMODE!=oMODE)) : (rx0_reset | (rMODE!=oMODE));

  //////////////////////////////////////////////////////////////////
  // Instantiate a dedicate PLL for output port
  //////////////////////////////////////////////////////////////////
  wire tx0_clkfbout, tx0_clkfbin, tx0_plllckd;
  wire tx0_pllclk0, tx0_pllclk1, tx0_pllclk2;
  wire sel, clkmux;
  
  /*wire new_pllclk0, new_pllclk1, new_pllclk2;
  wire new_clkfbout, new_plllckd;
  wire new_pclk, new_pclkx2, new_pclkx10;
  wire new_serdesstrobe, new_bufpll_lock;*/

  PLL_BASE # (
    .CLKIN_PERIOD(10),
    .CLKFBOUT_MULT(10), //set VCO to 10x of CLKIN
    .CLKOUT0_DIVIDE(1),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT2_DIVIDE(5),
    .COMPENSATION("SOURCE_SYNCHRONOUS")
  ) PLL_OSERDES_0 (
    .CLKFBOUT(tx0_clkfbout),
    .CLKOUT0(tx0_pllclk0),
    .CLKOUT1(tx0_pllclk1),
    .CLKOUT2(tx0_pllclk2),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(tx0_plllckd),
    .CLKFBIN(tx0_clkfbin),
    .CLKIN(clkmux),
    .RST(tx0_pll_reset)
  );
  
  IBUFG si514(.O(clkext), .I(CLK_EXT));
  assign sel = (rMODE==2'b00) ? 1 : 0;
  BUFGMUX clkinbufg(
							.O		(clkmux), 
							.I0	(rx0_pllclk1),
							.I1	(clkext),
							.S		(sel)
	);
  //
  // This BUFGMUX directly selects between two RX PLL pclk outputs
  // This way we have a matched skew between the RX pclk clocks and the TX pclk
  //
  /*BUFGMUX tx0_bufg_pclk (.S(select[0]), .I1(rx1_pllclk1), .I0(rx0_pllclk1), .O(tx0_pclk));*/
  BUFG tx0_bufg_pclk (.I(tx0_pllclk1), .O(tx0_pclk));				//rx0_pllclk1

  //
  // This BUFG is needed in order to deskew between PLL clkin and clkout
  // So the tx0 pclkx2 and pclkx10 will have the same phase as the pclk input
  //
  BUFG tx0_clkfb_buf (.I(tx0_clkfbout), .O(tx0_clkfbin));

  //
  // regenerate pclkx2 for TX
  //
  BUFG tx0_pclkx2_buf (.I(tx0_pllclk2), .O(tx0_pclkx2));

  //
  // regenerate pclkx10 for TX
  //
  wire tx0_bufpll_lock;
  BUFPLL #(.DIVIDE(5)) tx0_ioclk_buf (.PLLIN(tx0_pllclk0), .GCLK(tx0_pclkx2), .LOCKED(tx0_plllckd),
           .IOCLK(tx0_pclkx10), .SERDESSTROBE(tx0_serdesstrobe), .LOCK(tx0_bufpll_lock));

  assign tx0_reset = ~tx0_bufpll_lock;
  
  
  reg [2:0] ar_count = 0;
  reg [2:0] sl_count = 0;
  dvi_encoder_top dvi_tx0 (
    .pclk        (tx0_pclk),
    .pclkx2      (tx0_pclkx2),
    .pclkx10     (tx0_pclkx10),
    .serdesstrobe(tx0_serdesstrobe),
    .rstin       (tx0_reset),
    .blue_din    ((ar_count[2:0]==3'b000)?8'h40:tx0_blue),
    .green_din   ((ar_count[2:0]==3'b000)?8'h40:tx0_green),
    .red_din     ((ar_count[2:0]==3'b000)?8'h40:tx0_red),
    .hsync       (tx0_hsync),
    .vsync       (tx0_vsync),
    .de          (tx0_de),
    .TMDS        (TX0_TMDS),
    .TMDSB       (TX0_TMDSB),
	 
	 .sl_rgb		  ({hdata[9:2], 8'h00, hdata[9:2]}),
	 .enable_sel  (rMSW),
	 
	 .extc_30b	  (sl_extc),
	 .sl_extc	  ({8'hee, 8'h00, 8'h00}),
	 .mode_sel	  (rMODE)
	 );
	/* Add some logic that replaces the tx0_blue, tx0_green, tx0_red with 3 MUX */


  //////////////////////////////////////
  // Status LED
  //////////////////////////////////////
  reg [31:0] crx0 = 0;
  reg [31:0] cpll = 0;
  reg [31:0] cpll25 = 0;
  reg [31:0] ctmds = 0;
  always@(posedge tx0_pclk)
		crx0 = crx0 + 1;
  always@(posedge rx0_hsync)
	   cpll = cpll + 1;
  /*always@(posedge tx0_pllclk0)
	   cpll = cpll + 1;
  always@(posedge tx0_pclkx2)
	   cpll25 = cpll25 + 1;
  always@(posedge rx0_tmdsclk)
      ctmds = ctmds + 1;*/
		
  //assign LED[7:0] = {2'b00, MSW, crx0[15], cpll[5], cpll25[23], ctmds[24], rx0_psalgnerr};
  assign LED = {cpll[16],  crx0[25], sync_out_1, sync_in_1, sync_out_2, sync_in_2, rMODE};
  //***************** For test use only, test the EEPROM loaded LUT *****************
  reg [9:0] idx = 0;
  reg [31:0] pcnt = 0;
  always@(posedge clk10)
  begin
		if(m==1024) begin
			if(pcnt<20000000)
				pcnt = pcnt + 1;
			else begin
				pcnt = 0;
				if(idx < 50)
					idx = idx + 1;
				else
					idx = idx;
			end
		end
		else begin
			pcnt = 0;
			idx = 0;
		end
  end
//******************* Below is the Structured Light output ***************************
wire [7:0] cosd3;
wire [31:0] phase_i, phase_o;

wire [7:0] ired, igreen, iblue;
wire [7:0] pdata, vdata;
wire V_polarity, H_polarity;

reg [31:0] px_cntr = 0;
reg [7:0] pixelr_1st = 0;
reg [7:0] pixelg_1st = 0;
reg [7:0] pixelb_1st = 0;

/*******************************************************************************
After I observe the waveforms of rx0_hsync, rx0_vsync, rx0_de, I discovered that
when active pixels are being sent, rx0_hsync is logic low (0), rx0_de is logic
high (1), rx0_vsync is logic low (0). That's the polarities of them.
rx0_hsync -> negative;
rx0_vsync -> negative;
rx0_de    -> positive;
*******************************************************************************/
assign sync_hs = (H_polarity == 1'b1) ? rx0_hsync : ~rx0_hsync;
assign de = rx0_de;
//assign sync_vs = (rMODE==2'b01) ? ~rx0_vsync : ~rx0_vsync;
assign sync_vs = (V_polarity == 1'b1) ? rx0_vsync : ~rx0_vsync;
//******* the 4 lines of code above have been tested to be working ************
/********* Replace every 8th frame with plane gray 128 ************/
always@(posedge sync_vs)
	ar_count = ar_count + 1;
//************************* Use "ENABLE" bit to switch ************************
reg [15:0] frame1 = 0;
wire rstb;
always@(posedge rx0_pllclk1)
begin
		if(sync_vs)
			rMSW = sync_in_1;
		else
			rMSW = rMSW;
end

hdmi_sl  HDMI1_PC_CLK(
					.clock_pixel			(rx0_pllclk1),
					.clock_TMDS				(rx0_pllclk0),
					.iRed						(8'h00),
					.iGreen					(8'h00),
					.iBlue					(8'h00),
									
					.SYNC_H					(sync_hs),
					.SYNC_V					(sync_vs),
					.DE						(de),
					
					.oRequest				(rstb),				//signal to reset the DDS
					.tmdso					(),
					.tmds_30b				()
);

reg [9:0] hdata = 0;
wire [9:0] cosd_ud0, cosd_lr0;
wire [31:0] phase_i1e, phase_i2e, phase_o1e, phase_o2e;
ddsc UP_DOWN(
			.clk				(sync_hs),
			.sclr				(~rstb),
			
			.pinc_in			(phase_i1e),
			.poff_in			(phase_o1e),
			.cosine			(cosd_ud0),
			.phase_out		()
);
ddsc LEFT_RIGHT(
			.clk				(rx0_pllclk1),
			.sclr				(~de),
			
			.pinc_in			(phase_i2e),
			.poff_in			(phase_o2e),
			.cosine			(cosd_lr0),
			.phase_out		()
);

always@(posedge rx0_pllclk1)
begin
	if((cosd_ud0[9]==0)&&(cosd_lr0[9]==0))
		hdata = 512 + (cosd_ud0>>1) + (cosd_lr0>>1);
	else if((cosd_ud0[9]==1)&&(cosd_lr0[9]==1))
		hdata = (cosd_ud0[8:0]>>1) + (cosd_lr0[8:0]>>1);
	else
		hdata = 256 + (cosd_ud0[8:0]>>1) + (cosd_lr0[8:0]>>1);
end
/********************************************************************/

/* This part was for the minispartan6+ board, not for Mojo(removed) */
/* Mojo board UART */
wire tx_busy;
wire new_spi;
wire [7:0] rx_spi;

reg new_tx_data = 0;
reg [10:0] m = 0;
wire spi_bss;

avr_interface#(.CLK_RATE(50000000), .SERIAL_BAUD_RATE(500000))
INSTANTIATION1(
				 .clk								(CLOCK100),
				 .rst								(~RST_N),			 
				 .cclk							(CCLK),
				 
				 // AVR SPI Signals
				 .spi_miso						(SPI_MISO),
				 .spi_mosi						(SPI_MOSI),
				 .spi_sck						(SPI_SCK),
				 .spi_ss							(SPI_SS),
				 .spi_channel					(),
				 
				 // AVR Serial Signals
				 .tx								(UART_TX),
				 .rx								(UART_RX),
				 
				 // ADC Interface Signals
				 .channel						(),
				 .new_sample					(new_spi),
				 .sample							(),
				 .sample_channel				(),
				 
				 .spi_rcv						(rx_spi),
				 
				 // Serial TX User Interface
				 .tx_data						(/*tdata[n]*/),
				 .new_tx_data					(new_tx_data),			//trig the transmission of a new byte
				 .tx_busy						(tx_busy),				//1: being transmitting; 0: IDLE
				 .tx_block						(1'b1),
				 
				 // Serial Rx User Interface
				 .rx_data						(),
				 .new_rx_data					()							//indicate that just received a new byte

);

/*** SPI receiver used to load the LUT of the projector ***/
edgedtct SPI_ON_REC(
				.clk		(CLK_40M),
				.signl	(new_spi),
				.re		(spi_bss)
);

always@(posedge CLK_40M)
begin
	if(spi_bss)
	begin
		if(m<=1023)
		begin
			lut[m] = rx_spi;
			m = m + 1;
		end
		else
			m = m;
	end
end
/**********************************************************/
/*always@(posedge new_data or posedge new_tx_data)
begin
	if(new_data)
		n = 0;
	else
	begin
		if(n<=4)
			n = n + 1;
		else
			n = n;
	end
end

always@(posedge CLOCK100)
begin
	if(tx_busy == 1) //the UART works well without the involvement of the AVR_RX_BUSY
		new_tx_data = 0;
	else if(n<=4)
		new_tx_data = 1;
	else
		new_tx_data = 0;
end
//End of UART
always@(posedge clk100)
begin
		tdata[0] <= 48 + ir;
		tdata[1] <= 48 + jr;
		tdata[2] <= 48 + kr;
end*/
//************ Logic for synchronization with the Prosilica camera *******************
//************ Ported from the project "twohdmi" that is on the XPS ******************
/************* 1. determine the polarities of H_SYNC & V_SYNC ********************/
reg [15:0] row_cntr   = 0;
reg [15:0] row_cntr_i = 0;
reg [15:0] row_cntr_H = 0;
reg [15:0] row_cntr_L = 0;

reg [15:0] column_cntr   = 0;
reg [15:0] column_cntr_i = 0;
reg [15:0] column_cntr_H = 0;
reg [15:0] column_cntr_L = 0;

always@(posedge rx0_hsync)
begin
	if(rx0_vsync)
		row_cntr = row_cntr + 1;
	else
		row_cntr = 0;
end
always@(negedge rx0_vsync)
	row_cntr_H = row_cntr;
always@(posedge rx0_hsync)
begin
	if(!rx0_vsync)
		row_cntr_i = row_cntr_i + 1;
	else
		row_cntr_i = 0;
end
always@(posedge rx0_vsync)
	row_cntr_L = row_cntr_i;
assign V_polarity = (row_cntr_H > row_cntr_L) ? 1'b1 : 1'b0;

always@(posedge rx0_pllclk1)
begin
	if(rx0_hsync)
		column_cntr = column_cntr + 1;
	else
		column_cntr = 0;
end
always@(negedge rx0_hsync)
	column_cntr_H = column_cntr;
always@(posedge rx0_pllclk1)
begin
	if(!rx0_hsync)
		column_cntr_i = column_cntr_i + 1;
	else
		column_cntr_i = 0;
end
always@(posedge rx0_hsync)
	column_cntr_L = column_cntr_i;
assign H_polarity = (column_cntr_H > column_cntr_L) ? 1'b1 : 1'b0;
/************************* 2. for PC topleft pixel *******************************/
wire sync_out_1pc;
wire sync_out_1pcp;				//this is the trigger for 2nd camera in AR mode
wire sync_out_2pc;

assign sync_out_1pc = (ar_count[2:0]==3'b001) ? sync_vs : 0;
assign sync_out_1pcp = (ar_count[2:0]==3'b101) ? sync_vs : 0;
assign sync_out_2pc = 0;

/*reg [7:0] last_pixel = 0;
reg trig_synco1 = 0;
reg trig_synco2 = 0;
reg sync_out_2pc = 0;
reg trig_ar = 0;

wire sync_out_1pc;

always@(posedge new_data)
begin
		last_pixel <= pixelr_1st;
		if(pixelr_1st != last_pixel)
		begin
			trig_synco1 <= 1;
		   if(pixelr_1st==8'h00)
				trig_synco2 <= 1;
			else
				trig_synco2 <= 0;
		end
		else begin
			trig_synco1 <= 0;
			if(pixelr_1st==8'h00)
				trig_synco2 <= 1;
			else
				trig_synco2 <= 0;
		end
end
always@(posedge sync_vs)
begin
	case ({trig_synco1, trig_synco2})
		2'b00: begin trig_ar <= 0; sync_out_2pc <= 0; end
		2'b01: begin trig_ar <= 0; sync_out_2pc <= 1; end
		2'b10: begin trig_ar <= 1; sync_out_2pc <= 0; end
		2'b11: begin trig_ar <= 1; sync_out_2pc <= 1; end
	endcase
end
assign sync_out_1pc = (trig_ar==1'b1) ? sync_vs : 0;*/
/******* 3. for structured light (including both clock from PC and external oscillator)*******/
reg sync_out_2r = 0;
reg [1:0] delay_st = 2'b11;
reg stch = 0;
reg projector = 0;
reg [7:0] co_K;
reg [7:0] co_n;
reg [31:0] phase_inc = 0;
reg [31:0] phase_inc_LR = 0;
reg [31:0] phase_off_8 = 0;

reg tg = 0;
reg [15:0] frc = 0;
wire ret, re; 
wire sync_out_1slr;

wire SYNC_VS;
wire sync_out_1sl, sync_out_2sl;

always@(frame1)
begin
	if(frame1 % 8 == 1)
			sync_out_2r = 1'b1;
	else
			sync_out_2r = 1'b0;
end
assign sync_out_2sl = sync_out_2r;

assign SYNC_VS = (rMODE==2'b00) ? po_vsync : sync_vs;								//need to add a MUX if it is from external oscillator

/******************* Old synchronization which is not perfect *************************/
always@(negedge SYNC_VS or negedge sync_in_1)
begin
	if(!sync_in_1)
		begin
			stch = 0;
			delay_st = 2'b11;
		end
	else if(!sync_in_2)
		begin
			stch = 0;
			delay_st = 2'b10;
		end
	else
	begin
		if(delay_st == 2'b11)
			begin
				delay_st = 2'b01;
				stch = 0;
			end
		else if(delay_st == 2'b10)
			begin
				delay_st =2'b00;
				if(frame1==65535)
					stch = 0;
				else
					stch = 1;
			end
		else if(delay_st == 2'b01)
			begin
				delay_st =2'b00;
				stch = 1;
			end
		else
			begin
				delay_st =2'b00;
				stch = 1;
			end
	end
end

edgedtct FRAME_TRIGGER_WAIT(
				.clk		(CLK_40M),
				.signl	(sync_in_2),
				.re		(re)
);
edgedtct CAMERA_TRIG(
				.clk		(CLK_40M),
				.signl	(sync_out_1sl),
				.re		(ret)
);
always@(posedge CLK_40M or negedge sync_in_1)
begin
	if(!sync_in_1)
		tg = sync_in_2;
	else if(re)
		tg = 1;
	else if(ret)
		tg = 0;
end
assign sync_out_1sl = (stch == 1'b1) ? SYNC_VS : 0;

reg stchp = 0;
reg [1:0] delay_stp = 2'b11;
always@(negedge SYNC_VS or negedge sync_in_1)
begin
	if(!sync_in_1)
		begin
			stchp = 0;
			delay_stp = 2'b11;
		end
	else if(!tg)
		begin
			stchp = 0;
			delay_stp = 2'b10;
		end
	else
	begin
		if(delay_stp == 2'b11)
			begin
				delay_stp = 2'b01;
				stchp = 0;
			end
		else if(delay_stp == 2'b10)
			begin
				delay_stp = 2'b00;
				if(frame1==65535)
					stchp = 0;
				else
					stchp = 1;
			end
		else if(delay_stp == 2'b01)
			begin
				delay_stp = 2'b00;
				stchp = 1;
			end
		else begin
			delay_stp = 2'b00;
			stchp = 1;
		end
	end
end
assign sync_out_1slr = (stchp==1'b1) ? SYNC_VS : 0;
always@(posedge CLK_40M)
begin
	if(!sync_in_1)
		frc = 0;
	else if(ret)
	begin
		if(frc==27)
			frc = 0;
		else
			frc = frc + 1;
	end
	else
		frc = frc;
end
always@(negedge SYNC_VS or negedge sync_in_1)
begin
	if(!sync_in_1)
		frame1 = 65535;
	else if(!sync_in_2)				//!tg
	begin
		if(frame1==65535)
			frame1 = 65535;
		else
			frame1 = frame1;
	end
	else
	begin
		if(frame1==65535)
			frame1 = 0;
		else
			frame1 = frc + 1;
	end
end
/********* Composite SLI patterns for headset tracking ************/
reg [31:0] phsr1 = 0;
reg [31:0] phsr2 = 0;
always@(*)				//posedge wrst is WRONG
begin
	begin
		case(frame1)
			// f = 1
			0: begin
					phsr1 = 32'd159072863;
					phsr2 = 32'd357913941;		//[0, 80); [80, 880); [880, 960)
				end
			1: begin
					phsr1 = 32'd695943775;
					phsr2 = 32'd1431655765;
				end
			2: begin
					phsr1 = 32'd1232814687;
					phsr2 = 32'd2505397589;
				end
			3: begin
					phsr1 = 32'd1769685599;
					phsr2 = 32'd3579139413;
				end
			4: begin
					phsr1 = 32'd2306556511;
					phsr2 = 32'd357913941;
				end
			5: begin
					phsr1 = 32'd2843427423;
					phsr2 = 32'd1431655765;
				end
			6: begin
					phsr1 = 32'd3380298335;
					phsr2 = 32'd2505397589;
				end
			7: begin
					phsr1 = 32'd3917169247;
					phsr2 = 32'd3579139413;
				end
				
				// f = 6
			8: begin
					phsr1 = 32'd954437177;				//32'd159072863*6;
					phsr2 = 32'd2147483648;
				end
			9: begin
					phsr1 = 32'd1491308089;
					phsr2 = 32'd3221225472;
				end
		  10: begin
					phsr1 = 32'd2028179001;
					phsr2 = 32'd0;
				end
		  11: begin
					phsr1 = 32'd2565049913;
					phsr2 = 32'd1073741824;
				end
		  12: begin
					phsr1 = 32'd3101920825;
					phsr2 = 32'd2147483648;
				end
		  13: begin
					phsr1 = 32'd3638791737;
					phsr2 = 32'd3221225472;
				end
		  14: begin
					phsr1 = 32'd4175662649;
					phsr2 = 32'd0;
				end
		  15: begin
					phsr1 = 32'd417566265;
					phsr2 = 32'd1073741824;
			   end
		
		      // f = 36
		  16: begin
					phsr1 = 32'd1431655765;				//32'd159072863*36 - 2^32;
					phsr2 = 32'd0;
				end
		  17: begin
					phsr1 = 32'd1968526677;
					phsr2 = 32'd1073741824;
				end
		  18: begin
					phsr1 = 32'd2505397589;
					phsr2 = 32'd2147483648;
				end
		  19: begin
					phsr1 = 32'd3042268501;
					phsr2 = 32'd3221225472;
				end
		  20: begin
					phsr1 = 32'd3579139413;
					phsr2 = 32'd0;
				end
		  21: begin
					phsr1 = 32'd4116010325;
					phsr2 = 32'd1073741824;
				end
		  22: begin
					phsr1 = 32'd357913941;
					phsr2 = 32'd2147483648;
				end
		  23: begin
					phsr1 = 32'd894784853;
					phsr2 = 32'd3221225472;
				end
		  default: begin
					phsr1 = 32'd0;
					phsr2 = 32'd0;
		      end
		endcase
	end
end

always@(frame1)
begin
    co_n <= frame1 % 8;
    co_K <= (frame1 / 8) + 1;
end


always@(frame1)
begin
		case(co_K)
		  1: begin
			      phase_inc = 32'd6628036;				//2^32 / 648 (1 wave length across 648 rows)
					phase_inc_LR = 32'd4473924;
			  end
		  2: begin
		         phase_inc = 32'd39768216;			//2^32 / 108 (6 wave lengths)
					phase_inc_LR = 32'd26843546;
			  end
		  3: begin
				   phase_inc = 32'd238609294;			//2^32 / 18  (36 wave lengths)
					phase_inc_LR = 32'd161061274;
			  end
		  default: begin
		               phase_inc = 32'd0;
							phase_inc_LR = 32'd0;
			        end
		endcase
end
/********************* Add 8 new frames **************************/
assign phase_i1e = (frame1 < 24) ? phase_inc : 32'd0;
assign phase_i2e = (frame1 < 24) ? phase_inc_LR : 32'd0;
assign phase_o1e = (frame1 < 24) ? phsr1 : phase_off_8;
assign phase_o2e = (frame1 < 24) ? phsr2 : phase_off_8;

always@(frame1)
begin
		if((frame1==25)||(frame1==27))
				phase_off_8 <= 32'd2147483648;
		else if((frame1==24)||(frame1==26))
				phase_off_8 <= 32'd0;
		else
				phase_off_8 <= 32'd2147483648;
end

//***************************************************************************************************	 
/************* New Synchronization Scheme ******************************/
/*wire fe_si2, re_si2, fe_vs, re_vs;
reg [7:0] trig_count = 0;
reg [2:0] state = 0;
reg [2:0] sync_state = 0;
reg [2:0] Pre_state = 0;
always@(posedge clk10)
begin
	if(sync_in_1 == 0)
		state = 3'b000;
	else
	begin
		if(fe_si2 == 1)
			state = 3'b011;
		else if(re_si2 == 1)
			state = 3'b010;
		else
		begin
			if(state == 3'b000)
			begin
				if(sync_in_2 == 0)				//condition where FrameTriggerReady is low at the rising edge of the Enable bit
					state = 3'b001;
				else
					state = 3'b100;				//condition where FrameTriggerReady is high at the rising edge of the Enable bit
			end
			else
				state = state;
		end
	end
end
always@(posedge clk10)
begin
	if(fe_vs == 1)
	begin
		sync_state = state;
	end
	else
		sync_state = sync_state;
end

always@(posedge clk10)
begin
	Pre_state <= state;
	if(state != Pre_state)
		trig_count <= 0;
	else
	begin
		if(fe_vs == 1)
		begin
			if(trig_count == 255)
				trig_count <= trig_count;
			else
				trig_count <= trig_count + 1;
		end
		else
			trig_count <= trig_count;
	end
end
reg csi = 0;
always@(posedge clk10)
begin
    if(re_vs == 1)
    begin
        if(trig_count <= 1)
            csi = 0;
        else
            csi = 1;
    end
    else
        csi = csi;
end
//assign sync_out_1slr = SYNC_VS & (((trig_count <= 1) & (sync_state == 3'b010)) | ((trig_count == 2) & (sync_state == 3'b100)));						//this logic triggers on both edges of sync_in_2
//assign sync_out_1slr = SYNC_VS & (((trig_count == 1) & (sync_state == 3'b010)) | ((trig_count == 2) & (sync_state == 3'b100)));						//this logic toggles the polarity of triggers
assign sync_out_1slr = SYNC_VS & (((sync_state == 3'b010) & (trig_count <= 1) & (csi  == 0)) | ((trig_count == 1) & (sync_state == 3'b010) & (csi == 1)) | ((trig_count == 2) & (sync_state == 3'b100)));				//this is the good so far

edgedtct FRAME_TRIGGER_WAIT_R(
				.clk		(clk10),
				.signl	(sync_in_2),
				.re		(re_si2)
);
edgedtct_f FRAME_TRIGGER_WAIT_F(
				.clk		(clk10),
				.signl	(sync_in_2),
				.re		(fe_si2)
);
edgedtct VSYNC_R(
				.clk		(clk10),
				.signl	(SYNC_VS),
				.re		(re_vs)
);
edgedtct_f VSYNC_F(
				.clk		(clk10),
				.signl	(SYNC_VS),
				.re		(fe_vs)
);
wire re_trig;
always@(posedge clk10)				//increment the frame counter on every camara trigger
begin
	if(sync_in_1 == 0)
		frame1 = 0;
	else if(re_trig == 1)
	begin
		if(frame1 == 27)
			frame1 = 0;
		else
			frame1 = frame1 + 1;
	end
	else
		frame1 = frame1;
end

edgedtct TRIGGER(
				.clk		(clk10),
				.signl	(sync_out_1slr),
				.re		(re_trig)
);*/

/************* conbine the output 4 wires between FPGA and camera ***********/
always@(posedge po_vsync)
		sl_count = sl_count + 1;

assign sync_out_1 = (sync_in_1==1) ? sync_out_1slr : ((rMODE!=2'b00) ? sync_out_1pc : (sl_count==3'b010)&po_vsync);
assign sync_out_2 = (sync_in_1==1) ? sync_out_2sl : sync_out_2pc;

//assign sync_out_1B2 = (sync_in_1==1) ? sync_out_1slr : ((rMODE!=2'b00) ?  sync_out_1pcp : (sl_count==3'b010)&po_vsync);				//identical triggers for both cameras at anytime
assign sync_out_1B2 = (sync_in_1==1) ? sync_out_1slr : 0;																//only triggers the 2nd camera in SLI mode
assign sync_out_2B2 = sync_out_2;
/************************ 5. watchdog timer that is 
									  used to determine the clock source *************/
reg [31:0] wdt_timer = 0;
reg rcs = 0;
reg [7:0] fc = 0;

always@(posedge clk100)
begin
	if(wdt_timer < 50000000)			//if no clock in 1 second, reset
	begin
		wdt_timer <= wdt_timer + 1;
		rcs       <= 0;
	end
	else
	begin
		wdt_timer <= 0;
		rcs       <= 1;
	end
end
always@(posedge sync_vs or posedge rcs)
begin
	if(rcs == 1)
		fc = 0;
	else
		fc = fc + 1;
end
always@(posedge clk100)
begin
	if(wdt_timer == 49999990)
	begin
		if(fc > 100) begin
			oMODE = rMODE;
			rMODE = 2'b10;		//120Hz clock from PC
		end
		else if(fc < 10) begin
			oMODE = rMODE;
			rMODE = 2'b00;		//disconnected from PC, apply programmable oscillator
		end
		else begin
			oMODE = rMODE;
			rMODE = 2'b01;		//60Hz clock from PC
		end
	end
	else
		rMODE = rMODE;
end
/***** 6. structured light patterns generated from external programmable oscillator *****/
wire goo;
wire pll_locked;
wire [9:0] cosd_ud, cosd_lr;

reg [9:0] pd = 0;

i2c_master	PROGRAMMABLE_OSC(
								.CLOCK_IN				(CLOCK100),
								.CLOCK_OUT1				(CLK_40M),				//40Mhz clock actually
					
								.SCL						(PO_SCL),
								.SDA						(PO_SDA),
					
								.DDS_START				(dds_start),
								.wLED						()
);
/************** Bypassed by LUT ****************/
ddsc BOTTOM_UP_E(
			.clk				(po_hsync),
			.sclr				((!dds_start) || (!goo)),
			
			.pinc_in			(phase_i1e),
			.poff_in			(phase_o1e),
			.cosine			(cosd_ud),
			.phase_out		()
);
ddsc LEFT_RIGHT_E(
			.clk				(tx0_pclk),
			.sclr				((!dds_start) || (!po_de)),
			
			.pinc_in			(phase_i2e),
			.poff_in			(phase_o2e),
			.cosine			(cosd_lr),
			.phase_out		()
);
/**********************************************/
always@(posedge tx0_pclk)
begin
	if((cosd_ud[9]==0)&&(cosd_lr[9]==0))
		pd = 512 + (cosd_ud>>1) + (cosd_lr>>1);
	else if((cosd_ud[9]==1)&&(cosd_lr[9]==1))
		pd = (cosd_ud[8:0]>>1) + (cosd_lr[8:0]>>1);
	else
		pd = 256 + (cosd_ud[8:0]>>1) + (cosd_lr[8:0]>>1);
end

/***********************************************/

hdmi_top HDMI1_EXT_CLK(
					.clock_pixel			(tx0_pclk),
					.clock_TMDS				(tx0_pclkx10),
					.HDMI_START				(dds_start),
					
					.iRed						(pd[9:2]),
					.iGreen					(8'h00),
					.iBlue					(pd[9:2]),
					
					.oRequest				(goo),
					.SYNC_H					(po_hsync),
					.SYNC_V					(po_vsync),
					.DE						(po_de),
					
					.tmds_30b				(sl_extc),
					.LED						()
);

endmodule
