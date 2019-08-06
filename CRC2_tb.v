`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/17 17:39:59
// Design Name: 
// Module Name: CRC32_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module CRC2_tb2;

    reg clk,rst_n;
    reg [7:0] din;
    reg din_vld;
	
	reg	clc;
	reg	crc_mode;
    
    wire [31:0] dout;


crc2 c0
    (	
		.crc_mode				(crc_mode	),
      .clc						(clc),
	  .clk                     	(clk),
      .rst                     	(~rst_n),
      .d_in                     (din),
      .crc_en                  	(din_vld),
      .crc_out                 	(dout)
    ) ;

    parameter CYC = 5,
              RST_TIME = 2;
              
    initial begin
        clk = 1;
        forever#(CYC /2.0) clk = ~clk;
    end
              
    initial begin
        rst_n = 1;
        #1;
        rst_n = 0;
        #(CYC*RST_TIME) rst_n = 1;
    end

    initial begin
        //Initialize Inputs
  //      #1;
		crc_mode	= 0;
        din = 0;
		clc	=	0;
        din_vld = 0;
        #(CYC*RST_TIME)
        #(CYC*2)
        din_vld = 1;
        din = 8'h61;
        #(CYC*1)
        din = 8'h61;
        #(CYC*1)
        din = 8'h61;
        #(CYC*1)
        din = 8'h61;
        #(CYC*1)
		din_vld = 0;
		
		#(CYC*10)
			
		clc	=	1;
        #(CYC*1)		
		clc	=	0;
		crc_mode	= 1;		
        #(CYC*10)
        din_vld = 1;
        din = 8'h61;
        #(CYC*1)
        din = 8'h61;
        #(CYC*1)
        din = 8'h61;
        #(CYC*1)
        din = 8'h61;	
        #(CYC*1)
		din_vld = 0;
		#(CYC*10)		
        $stop;
    end
    
      
endmodule