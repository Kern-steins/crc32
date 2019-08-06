
module crc2(
			input					crc_mode,
			input 					clc,
			input 		[7:0] 		d_in,
			input 					crc_en,
			output 		[31:0] 		crc_out,
			input 					rst,
			input 					clk
			);

	wire	[7:0]	d;

	assign			d	=	crc_mode ?	d_in	:	{d_in[0],d_in[1],d_in[2],d_in[3],d_in[4],d_in[5],d_in[6],d_in[7]};
	
//	assign			d	=	{d_in[0],d_in[1],d_in[2],d_in[3],
//								d_in[4],d_in[5],d_in[6],d_in[7]};

	wire	[31:0]	crc_test;	
		

	reg [31:0] c,newcrc;
	


  always @(*) begin
    newcrc[0] = d[0] ^ d[6]^c[24] ^ c[30]  ;
    newcrc[1] = d[0] ^ d[1] ^ d[6] ^ d[7]^c[24] ^ c[25] ^ c[30] ^ c[31]  ;
    newcrc[2] = d[0] ^ d[1] ^ d[2] ^ d[6] ^ d[7]^c[24] ^ c[25] ^ c[26] ^ c[30] ^ c[31]  ;
    newcrc[3] = d[1] ^ d[2] ^ d[3] ^ d[7]^c[25] ^ c[26] ^ c[27] ^ c[31]  ;
    newcrc[4] = d[0] ^ d[2] ^ d[3] ^ d[4] ^ d[6]^c[24] ^ c[26] ^ c[27] ^ c[28] ^ c[30]  ;
    newcrc[5] = d[0] ^ d[1] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7]^c[24] ^ c[25] ^ c[27] ^ c[28] ^ c[29] ^ c[30] ^ c[31]  ;
    newcrc[6] = d[1] ^ d[2] ^ d[4] ^ d[5] ^ d[6] ^ d[7]^c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30] ^ c[31]  ;
    newcrc[7] = d[0] ^ d[2] ^ d[3] ^ d[5] ^ d[7]^c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31]  ;
    newcrc[8] = d[0] ^ d[1] ^ d[3] ^ d[4]^c[0] ^ c[24] ^ c[25] ^ c[27] ^ c[28]  ;
    newcrc[9] = d[1] ^ d[2] ^ d[4] ^ d[5]^c[1] ^ c[25] ^ c[26] ^ c[28] ^ c[29]  ;
    newcrc[10] = d[0] ^ d[2] ^ d[3] ^ d[5]^c[2] ^ c[24] ^ c[26] ^ c[27] ^ c[29]  ;
    newcrc[11] = d[0] ^ d[1] ^ d[3] ^ d[4] ^c[3] ^ c[24] ^ c[25] ^ c[27] ^ c[28] ;
    newcrc[12] = d[0] ^ d[1] ^ d[2] ^ d[4] ^ d[5] ^ d[6]^c[4] ^ c[24] ^ c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30] ;
    newcrc[13] = d[1] ^ d[2] ^ d[3] ^ d[5] ^ d[6] ^ d[7]^c[5] ^ c[25] ^ c[26] ^ c[27] ^ c[29] ^ c[30] ^ c[31]  ;
    newcrc[14] =  d[2] ^ d[3] ^ d[4] ^ d[6] ^ d[7]^c[6] ^ c[26] ^ c[27] ^ c[28] ^ c[30] ^ c[31] ;
    newcrc[15] = d[3] ^ d[4] ^ d[5] ^ d[7]^c[7] ^ c[27] ^ c[28] ^ c[29] ^ c[31]  ;
    newcrc[16] = d[0] ^ d[4] ^ d[5]^c[8] ^ c[24] ^ c[28] ^ c[29]  ;
    newcrc[17] = d[1] ^ d[5] ^ d[6]^c[9] ^ c[25] ^ c[29] ^ c[30]  ;
    newcrc[18] = d[2] ^ d[6] ^ d[7]^c[10] ^ c[26] ^ c[30] ^ c[31]  ;
    newcrc[19] = d[3] ^ d[7]^c[11] ^ c[27] ^ c[31]  ;
    newcrc[20] = d[4]^c[12] ^ c[28]  ;
    newcrc[21] = d[5]^c[13] ^ c[29]  ;
    newcrc[22] = d[0]^c[14] ^ c[24]  ;
    newcrc[23] = d[0] ^ d[1] ^ d[6]^c[15] ^ c[24] ^ c[25] ^ c[30]  ;
    newcrc[24] = d[1] ^ d[2] ^ d[7]^c[16] ^ c[25] ^ c[26] ^ c[31]  ;
    newcrc[25] = d[2] ^ d[3]^c[17] ^ c[26] ^ c[27]  ;
    newcrc[26] = d[0] ^ d[3] ^ d[4] ^ d[6]^c[18] ^ c[24] ^ c[27] ^ c[28] ^ c[30]  ;
    newcrc[27] = d[1] ^ d[4] ^ d[5] ^ d[7]^c[19] ^ c[25] ^ c[28] ^ c[29] ^ c[31]  ;
    newcrc[28] = d[6] ^ d[5] ^ d[2]^c[20] ^ c[26] ^ c[29] ^ c[30]  ;
    newcrc[29] =  d[7] ^ d[6] ^ d[3]^c[21] ^ c[27] ^ c[30] ^ c[31] ;
    newcrc[30] = d[7] ^ d[4]^c[22] ^ c[28] ^ c[31]  ;
    newcrc[31] = d[5]^c[23] ^ c[29]  ;

  end

assign	crc_test =  c  ^  32'hffff_ffff;

wire	[31:0]crc_test2;
assign	crc_test2 =	{crc_test[0],crc_test[1],crc_test[2],crc_test[3],crc_test[4],crc_test[5],crc_test[6],crc_test[7],
						crc_test[8],crc_test[9],crc_test[10],crc_test[11],crc_test[12],crc_test[13],crc_test[14],crc_test[15],
							crc_test[16],crc_test[17],crc_test[18],crc_test[19],crc_test[20],crc_test[21],crc_test[22],crc_test[23],
								crc_test[24],crc_test[25],crc_test[26],crc_test[27],crc_test[28],crc_test[29],crc_test[30],crc_test[31]};

always @(posedge clk , posedge rst) 
begin
    if(rst|clc) 
			begin
			c <= {32{1'b1}};
			end
    else 	
			begin
			c <= crc_en ? newcrc : c;
			end
end

	assign crc_out = 	crc_mode ?	c	:	crc_test2;
endmodule
