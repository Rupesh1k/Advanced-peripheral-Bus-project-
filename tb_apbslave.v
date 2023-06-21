module tb_apbslave;

reg pclk,presetn,psel,penable,pwrite;

reg [31:0]paddr,pwdata;


wire pready;

wire [31:0]prdata;

apbslave dut(prdata,pready,paddr,psel,penable,pwrite,pwdata,pclk,presetn);

always #5 pclk=~pclk;

initial begin
pclk=0;
presetn=1;
#10;
presetn=0;

@(posedge pclk) psel=0; penable=0; paddr=0; pwdata=0;

@(posedge pclk) psel=1; penable=0; paddr=5; pwdata=6;pwrite=1;


@(posedge pclk) psel=1; penable=1; paddr=5; pwdata=6;pwrite=1;

 @(posedge pclk)psel=1; penable=1; paddr=5; pwrite=0;
end
endmodule
	
				

