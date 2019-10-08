`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  This project is created for the dual-projector multi-path paper(optics express),
//  the target hardware platform is the TI 2010 and the purple PCB
//  480 + 8 patterns
//  854*480@60hz
//  projector gamma look up table, old 2010 uses the LUT in EEPROM (K=1), new 2010
//  doesn't need a look up table (K=2)
//  If running the caliration module, it's 28 frames instead of 488
//////////////////////////////////////////////////////////////////////////////////
`define SCANNING
module top(
				input CLOCK_IN,
				input CLOCK_EXT,
				//////////// HDMI 1 //////////
				output [2:0] TMDS1_POSITIVE,
				output [2:0] TMDS1_NEGATIVE,
				output TMDS1_CLOCK_P,
				output TMDS1_CLOCK_N,	
				/////////// HDMI 2 //////////
				output [2:0] TMDS2_POSITIVE,
				output [2:0] TMDS2_NEGATIVE,
				output TMDS2_CLOCK_P,
				output TMDS2_CLOCK_N,
				
				input  sync_in_1,					//isolated PIN4
				input  sync_in_2,				//PIN12
				output sync_out_1,
				output sync_out_2,
				
				output SCL,
				inout  SDA,
				
				//UART with AVR
			   input  wire RST_N,
			   input  wire CCLK,
				
				//SPI with AVR
			   output wire SPI_MISO,
			   input  wire SPI_SS,
			   input  wire SPI_MOSI,
			   input  wire SPI_SCK,
				
				//For the purple board only
				output CT_HPD1,
				output LS_OE1,
				output CT_HPD2,
				output LS_OE2,
				
				output [7:0] LED
    );

wire clockx2, clockx10;
wire clock_pix, clock_tmds;
wire dds_start, hdmi_start;
wire [7:0] pdata1, pdata2;
wire SYNC_HS, SYNC_VS, goo;
wire CLK_40M, CLK_50M, clk_100m;

reg [7:0] lut [0:1023];
reg [7:0] lutn[0:1023];				//LUT for the new DLP2010
reg [10:0] m;

reg [31:0] phsr1, phsr2;
reg [7:0] co_n;
reg [7:0] co_K;
reg [15:0] frame;
reg [31:0] phase_inc;
reg [31:0] phase_off_8L, phase_off_8H;
reg sync_out_2r;
reg srst;

integer i;
integer outfile;
initial
begin
	m = 0;	
	phsr1 = 0; phsr2 = 0;
	co_n = 0;
	co_K = 0;
	frame = 0;
	phase_inc = 0;
	phase_off_8L = 0; phase_off_8H <= 0;
	sync_out_2r = 0;
	srst = 0;
   
	$readmemh("ti2010lc.txt", lutn);
	outfile = $fopen("cout.txt");
	for(i=0; i<1024; i=i+1)begin
	$fdisplay(outfile, "%d:%h" , i, lut[i]); end
end

assign CT_HPD1 = 1'b1;
assign CT_HPD2 = 1'b1;
assign LS_OE1 = 1'b1;
assign LS_OE2 = 1'b1;

assign LED = {sync_in_1, sync_in_2, sync_out_1, sync_out_2, 4'b0011};
i2c_master	PROGAMMABLE_OSC(
					.CLOCK_IN				(CLOCK_IN),
					.CLOCK_OUT1				(CLK_40M),
					.CLOCK_OUT2				(CLK_50M),
					.CLOCK_OUT3				(clk_100m),
		
					.SCL						(SCL),
					.SDA						(SDA),
		
					.DDS_START				(dds_start),
					.wLED						()
);


wire locked;
wire bufpll_lock;
wire gclk, clockx1;
wire clkfbout, serdes;
wire DE;
PLL_BASE # (
    .CLKIN_PERIOD(10),
    .CLKFBOUT_MULT(10), //set VCO to 10x of CLKIN
    .CLKOUT0_DIVIDE(1),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT2_DIVIDE(5),
    .COMPENSATION("INTERNAL")
  ) PLL_EXT (
    .CLKFBOUT(clkfbout),
    .CLKOUT0(clockx10),
    .CLKOUT1(clockx1),
    .CLKOUT2(clockx2),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(locked),
    .CLKFBIN(clkfbout),
    .CLKIN(CLOCK_EXT),
    .RST(~dds_start)
);

BUFG clkt2 (.I(clockx2), .O(gclk));
BUFG clkt1 (.I(clockx1), .O(clock_pix));
BUFPLL #(.DIVIDE(5))
ioclk_buf (
	.PLLIN				(clockx10),
	.GCLK					(gclk),
	.LOCKED				(locked),
	.IOCLK				(clock_tmds),
	.SERDESSTROBE		(serdes),
	.LOCK					(bufpll_lock)
);


BUFG startbufg(.I(dds_start), .O(hdmi_start));

hdmi_top HDMI_TIMING(
					.clock_pixel			(clock_pix),
					.clock_TMDS				(clock_tmds),
					.HDMI_START				(bufpll_lock),				//hdmi_start
					
					/*.iRed						(8'h00),
					.iGreen					(pdata1),
					.iBlue					(8'h00),*/
					
					.oRequest				(goo),
					.SYNC_H					(SYNC_HS),
					.SYNC_V					(SYNC_VS),
					.DE						(DE),
					.LED						()
);

/*** ADD THE OSERDES TO GET RID OF THE UNSTABLE CLOCK ISSUE (HOPEFULLY) ***/
dvi_encoder_top PORT_1 (
    .pclk        (clock_pix),
    .pclkx2      (gclk),
    .pclkx10     (clock_tmds),
    .serdesstrobe(serdes),
    .rstin       (~bufpll_lock),
    .blue_din    (pdata1),
    .green_din   (0),
    .red_din     (pdata1),
    .hsync       (SYNC_HS),
    .vsync       (SYNC_VS),
    .de          (DE),
    .TMDS        ({TMDS1_CLOCK_P, TMDS1_POSITIVE}),
    .TMDSB       ({TMDS1_CLOCK_N, TMDS1_NEGATIVE})
);

dvi_encoder_top PORT_2 (
    .pclk        (clock_pix),
    .pclkx2      (gclk),
    .pclkx10     (clock_tmds),
    .serdesstrobe(serdes),
    .rstin       (~bufpll_lock),
    .blue_din    (pdata2),
    .green_din   (0),
    .red_din     (pdata2),
    .hsync       (SYNC_HS),
    .vsync       (SYNC_VS),
    .de          (DE),
    .TMDS        ({TMDS2_CLOCK_P, TMDS2_POSITIVE}),
    .TMDSB       ({TMDS2_CLOCK_N, TMDS2_NEGATIVE})
);
/*** SPI receiver used to load the LUT of the projector ***/
wire new_spi;
wire [7:0] rx_spi;
wire spi_bss;

avr_interface#(.CLK_RATE(50000000), .SERIAL_BAUD_RATE(500000))
INSTANTIATION1(
				 .clk								(CLK_50M),
				 .rst								(~RST_N),			 
				 .cclk							(CCLK),
				 
				 // AVR SPI Signals
				 .spi_miso						(SPI_MISO),
				 .spi_mosi						(SPI_MOSI),
				 .spi_sck						(SPI_SCK),
				 .spi_ss							(SPI_SS),
				 .spi_channel					(),
				 
				 // AVR Serial Signals
				 .tx								(),
				 .rx								(),
				 
				 // ADC Interface Signals
				 .channel						(),
				 .new_sample					(new_spi),
				 .sample							(),
				 .sample_channel				(),
				 
				 .spi_rcv						(rx_spi),
				 
				 // Serial TX User Interface
				 .tx_data						(),
				 .new_tx_data					(),			//trig the transmission of a new byte
				 .tx_busy						(),				//1: being transmitting; 0: IDLE
				 .tx_block						(1'b1),
				 
				 // Serial Rx User Interface
				 .rx_data						(),
				 .new_rx_data					()							//indicate that just received a new byte

);

edgedtct SPI_ON_REC(
				.clk		(CLK_50M),
				.signl	(new_spi),
				.re		(spi_bss)
);

always@(posedge CLK_50M)
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
/**************** Sinusoidal wave generation *******************/
wire [31:0] phase_i1, phase_i2;
wire [31:0] phase_o1, phase_o2;
wire [31:0] pout1, pout2;
wire [7:0] magnt;
ddsc PROJECTOR_1(
			.clk				(SYNC_HS),
			.sclr				((!hdmi_start) || (!goo)),
			
			.pinc_in			(phase_i1),
			.poff_in			(phase_o1),
			.cosine			(),
			.phase_out		(pout1)
);

ddsc PROJECTOR_2(
			.clk				(SYNC_HS),
			.sclr				((!hdmi_start) || (!goo)),
			
			.pinc_in			(phase_i2),
			.poff_in			(phase_o2),
			.cosine			(magnt),
			.phase_out		(pout2)
);
/***************************************************/
assign pdata1 = lut[pout1[31:22]];
assign pdata2 = lutn[pout2[31:22]];
/*always@(posedge clock_pix)
begin
	if(!magnt[7])
		pdata2 = magnt + 128;
	else
		pdata2 = magnt[6:0];
end*/
wire wrst;


`ifdef SCANNING				//spatial frequency = 1, 2, 3, ... , 58, 59, 60.
always@(frame)
begin
		case(co_n)
			0: begin phsr1 <= 0;              phsr2 <= 0;              end
			1:	begin phsr1 <= 32'd536870912;  phsr2 <= 32'd1073741824; end
			2: begin phsr1 <= 32'd1073741824; phsr2 <= 32'd2147483648; end
			3: begin phsr1 <= 32'd1610612736; phsr2 <= 32'd3221225472; end
			4: begin phsr1 <= 32'd2147483648; phsr2 <= 0;              end
			5: begin phsr1 <= 32'd2684354560; phsr2 <= 32'd1073741824; end
			6: begin phsr1 <= 32'd3221225472; phsr2 <= 32'd2147483648; end
			7: begin phsr1 <= 32'd3758096384; phsr2 <= 32'd3221225472; end
			default: begin phsr1 <= 0; phsr2 <= 0; end
		endcase
end

always@(frame)
begin
		co_n <= frame % 8;
		co_K <= (frame / 8) + 1;
end


always@(frame)
begin
		case(co_K)
			1: phase_inc = 32'd536870912;
			2: phase_inc = 32'd527923063;
			3:	phase_inc = 32'd518975215;
			4: phase_inc = 32'd510027366;
			5: phase_inc = 32'd501079518;
			6: phase_inc = 32'd492131669;
			7: phase_inc = 32'd483183821;
			8: phase_inc = 32'd474235972;
			9: phase_inc = 32'd465288124;
		  10: phase_inc = 32'd456340275;
		  
		  11: phase_inc = 32'd447392427;
		  12: phase_inc = 32'd438444578;
		  13:	phase_inc = 32'd429496730;
		  14: phase_inc = 32'd420548881;
		  15: phase_inc = 32'd411601033;
		  16: phase_inc = 32'd402653184;
		  17: phase_inc = 32'd393705335;
		  18: phase_inc = 32'd384757487;
		  19: phase_inc = 32'd375809638;
		  20: phase_inc = 32'd366861790;
		  
		  21: phase_inc = 32'd357913941;
		  22: phase_inc = 32'd348966093;
		  23:	phase_inc = 32'd340018244;
		  24: phase_inc = 32'd331070396;
		  25: phase_inc = 32'd322122547;
		  26: phase_inc = 32'd313174699;
		  27: phase_inc = 32'd304226850;
		  28: phase_inc = 32'd295279002;
		  29: phase_inc = 32'd286331153;
		  30: phase_inc = 32'd277383305;
		  
		  31: phase_inc = 32'd268435456;
		  32: phase_inc = 32'd259487607;
		  33:	phase_inc = 32'd250539759;
		  34: phase_inc = 32'd241591910;
		  35: phase_inc = 32'd232644062;
		  36: phase_inc = 32'd223696213;
		  37: phase_inc = 32'd214748365;
		  38: phase_inc = 32'd205800516;
		  39: phase_inc = 32'd196852668;
		  40: phase_inc = 32'd187904819;
		  
		  41: phase_inc = 32'd178956971;
		  42: phase_inc = 32'd170009122;
		  43:	phase_inc = 32'd161061274;
		  44: phase_inc = 32'd152113425;
		  45: phase_inc = 32'd143165577;
		  46: phase_inc = 32'd134217728;
		  47: phase_inc = 32'd125269879;
		  48: phase_inc = 32'd116322031;
		  49: phase_inc = 32'd107374182;
		  50: phase_inc = 32'd98426334;
		  
		  51: phase_inc = 32'd89478485;
		  52: phase_inc = 32'd80530637;
		  53:	phase_inc = 32'd71582788;
		  54: phase_inc = 32'd62634940;
		  55: phase_inc = 32'd53687091;
		  56: phase_inc = 32'd44739243;
		  57: phase_inc = 32'd35791394;
		  58: phase_inc = 32'd26843546;
		  59: phase_inc = 32'd17895697;
		  60: phase_inc = 32'd8947849;
		  
		  default: phase_inc = 32'd0;
		endcase
end

always@(frame)
begin
		if(frame == 480)
		begin
				phase_off_8L <= 0;
				phase_off_8H <= 0;
		end
		else if(frame == 481)
		begin
				phase_off_8L <= 32'd536870912;
				phase_off_8H <= 32'd1073741824;
		end
		else if(frame == 482)
		begin
				phase_off_8L <= 32'd1073741824;
				phase_off_8H <= 32'd2147483648;
		end
		else if(frame == 483)
		begin
				phase_off_8L <= 32'd1610612736;
				phase_off_8H <= 32'd3221225472;
		end
		else if(frame == 484)
		begin
				phase_off_8L <= 32'd2147483648;
				phase_off_8H <= 0;
		end
		else if(frame == 485)
		begin
				phase_off_8L <= 32'd2684354560;
				phase_off_8H <= 32'd1073741824;
		end
		else if(frame == 486)
		begin
				phase_off_8L <= 32'd3221225472;
				phase_off_8H <= 32'd2147483648;
		end
		else if(frame == 487)
		begin
				phase_off_8L <= 32'd3758096384;
				phase_off_8H <= 32'd3221225472;
		end
		else
		begin
				phase_off_8L <= 32'd0;
				phase_off_8H <= 0;
		end
end


assign phase_i1 = (frame < 480) ? phase_inc : 0;
assign phase_i2 = (frame < 480) ? phase_inc : 0;
assign phase_o1 = (frame < 480) ? phsr1 : phase_off_8L;
assign phase_o2 = (frame < 480) ? phsr2 : phase_off_8H;

/*****************************************************************/
always@(clock_pix)
begin
	if(goo == 0)
		srst = 1;
	else
		srst = 0;
end
assign wrst = srst;

always@(frame)
begin
	if(frame % 8 == 1)
			sync_out_2r = 1'b1;
	else
			sync_out_2r = 1'b0;
end
assign sync_out_2 = sync_out_2r;

wire fe_si2, re_si2, fe_vs, re_vs;
reg [7:0] trig_count = 0;
reg [2:0] state = 0;
reg [2:0] sync_state = 0;
reg [2:0] Pre_state = 0;
always@(posedge clk_100m)
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
always@(posedge clk_100m)
begin
	if(fe_vs == 1)
	begin
		sync_state = state;
	end
	else
		sync_state = sync_state;
end

always@(posedge clk_100m)
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
	
assign sync_out_1 = SYNC_VS & (((trig_count <= 1) & (sync_state == 3'b010)) | ((trig_count == 2) & (sync_state == 3'b100)));

/* The clk_100m has to be set to 10Mhz in "dcm" to get the camera work */
edgedtct FRAME_TRIGGER_WAIT_R(
				.clk		(clk_100m),
				.signl	(sync_in_2),
				.re		(re_si2)
);
edgedtct_f FRAME_TRIGGER_WAIT_F(
				.clk		(clk_100m),
				.signl	(sync_in_2),
				.re		(fe_si2)
);
edgedtct VSYNC_R(
				.clk		(clk_100m),
				.signl	(SYNC_VS),
				.re		(re_vs)
);
edgedtct_f VSYNC_F(
				.clk		(clk_100m),
				.signl	(SYNC_VS),
				.re		(fe_vs)
);
wire re_trig;
always@(posedge clk_100m)				//increment the frame counter on every camara trigger
begin
	if(sync_in_1 == 0)
		frame = 0;
	else if(re_trig == 1)
	begin
		if(frame == 487)
			frame = 0;
		else
			frame = frame + 1;
	end
	else
		frame = frame;
end
edgedtct TRIGGER(
				.clk		(clk_100m),
				.signl	(sync_out_1),
				.re		(re_trig)
);

`else		//calibration spatial frequency = 1, 6, 36.
always@(frame)
begin
		case(co_n)
			0: begin phsr1 <= 0;              phsr2 <= 0;              end
			1:	begin phsr1 <= 32'd536870912;  phsr2 <= 32'd1073741824; end
			2: begin phsr1 <= 32'd1073741824; phsr2 <= 32'd2147483648; end
			3: begin phsr1 <= 32'd1610612736; phsr2 <= 32'd3221225472; end
			4: begin phsr1 <= 32'd2147483648; phsr2 <= 0;              end
			5: begin phsr1 <= 32'd2684354560; phsr2 <= 32'd1073741824; end
			6: begin phsr1 <= 32'd3221225472; phsr2 <= 32'd2147483648; end
			7: begin phsr1 <= 32'd3758096384; phsr2 <= 32'd3221225472; end
			default: begin phsr1 <= 0; phsr2 <= 0; end
		endcase
end

always@(frame)
begin
		co_n <= frame % 8;
		co_K <= (frame / 8) + 1;
end

always@(frame)
begin
		case(co_K)
			1: phase_inc = 32'd8947849;
			2: phase_inc = 32'd53687091;
			3:	phase_inc = 32'd322122547;
		   default: phase_inc = 32'd0;
		endcase
end

always@(frame)
begin
		if((frame == 24) || (frame == 26))
		begin
				phase_off_8L <= 0;
				phase_off_8H <= 0;
		end
		else if((frame == 25) || (frame == 27))
		begin
				phase_off_8L <= 32'd2147483648;
				phase_off_8H <= 32'd2147483648;
		end
		else
		begin
				phase_off_8L <= 0;
				phase_off_8H <= 0;
		end
end

assign phase_i1 = (frame < 24) ? phase_inc : 0;
assign phase_i2 = (frame < 24) ? phase_inc : 0;
assign phase_o1 = (frame < 24) ? phsr1 : phase_off_8L;
assign phase_o2 = (frame < 24) ? phsr2 : phase_off_8H;


/***********************************************************/
always@(clock_pix)
begin
	if(goo == 0)
		srst = 1;
	else
		srst = 0;
end
assign wrst = srst;

always@(frame)
begin
	if(frame % 8 == 1)
			sync_out_2r = 1'b1;
	else
			sync_out_2r = 1'b0;
end
assign sync_out_2 = sync_out_2r;

wire fe_si2, re_si2, fe_vs, re_vs;
reg [7:0] trig_count = 0;
reg [2:0] state = 0;
reg [2:0] sync_state = 0;
reg [2:0] Pre_state = 0;
always@(posedge clk_100m)
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
always@(posedge clk_100m)
begin
	if(fe_vs == 1)
	begin
		sync_state = state;
	end
	else
		sync_state = sync_state;
end

always@(posedge clk_100m)
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
	
assign sync_out_1 = SYNC_VS & (((trig_count <= 1) & (sync_state == 3'b010)) | ((trig_count == 2) & (sync_state == 3'b100)));

/* The clk_100m has to be set to 10Mhz in "dcm" to get the camera work */
edgedtct FRAME_TRIGGER_WAIT_R(
				.clk		(clk_100m),
				.signl	(sync_in_2),
				.re		(re_si2)
);
edgedtct_f FRAME_TRIGGER_WAIT_F(
				.clk		(clk_100m),
				.signl	(sync_in_2),
				.re		(fe_si2)
);
edgedtct VSYNC_R(
				.clk		(clk_100m),
				.signl	(SYNC_VS),
				.re		(re_vs)
);
edgedtct_f VSYNC_F(
				.clk		(clk_100m),
				.signl	(SYNC_VS),
				.re		(fe_vs)
);
wire re_trig;
always@(posedge clk_100m)				//increment the frame counter on every camara trigger
begin
	if(sync_in_1 == 0)
		frame = 0;
	else if(re_trig == 1)
	begin
		if(frame == 27)
			frame = 0;
		else
			frame = frame + 1;
	end
	else
		frame = frame;
end
edgedtct TRIGGER(
				.clk		(clk_100m),
				.signl	(sync_out_1),
				.re		(re_trig)
);

`endif

endmodule
