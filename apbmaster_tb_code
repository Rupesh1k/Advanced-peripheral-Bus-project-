module tb_apbmaster;

reg pclk, presetn,pwrite_i,pready,psel_i,penable_i;

reg[31:0]paddr_i,pwdata_i,prdata;

wire [31:0]paddr,pwdata,prdata_i;

wire pwrite,psel,penable;

apbmaster dut(paddr,pwrite,pwdata,psel,penable, paddr_i,pwrite_i,pwdata_i,psel_i,penable_i,pready,prdata,pclk,presetn);

always #5 pclk=~pclk;

initial begin

pclk=0;
presetn=1;
#10;
presetn=0;
@(posedge pclk)psel_i=0; penable_i=0; paddr_i=0; pwdata_i=0;

@(posedge pclk)psel_i=1; penable_i=0; paddr_i=5;pwrite_i=1;

@(posedge pclk)psel_i=1; penable_i=1; paddr_i=5; pwdata_i=8;pwrite_i=1;pready=1;


@(posedge pclk)psel_i=1; penable_i=1; paddr_i=5;pwrite_i=0;pready=1;prdata=8;
end
endmodule
