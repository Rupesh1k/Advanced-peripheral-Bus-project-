# Advanced-peripheral-Bus-project-
I developed this advanced peripheral Bus using verilog

module apbmaster(paddr,pwrite,pwdata,psel,penable, paddr_i,pwrite_i,pwdata_i,psel_i,penable_i,pready,prdata,pclk,presetn);

 output reg [31:0]paddr,pwdata;

  output reg pwrite,psel,penable;

 input [31:0]paddr_i,pwdata_i;
 input pwrite_i,psel_i,penable_i;
 input pclk,presetn,pready;
 input [31:0]prdata;
	
 reg[1:0]p_s,n_s;
	
 parameter IDLE = 2'b00;
 parameter SETUP = 2'b01;
 parameter ACCESS = 2'b10;
	
 always @(posedge pclk)
  begin
   if(presetn)
    p_s <= IDLE;
   else
    p_s <= n_s;
  end

 always @(*)
  begin
   case(p_s)
    IDLE:begin
      if(psel_i == 0)
      begin
       //ptransfer = 1; 
       n_s = IDLE;
      end
      else
       n_s = SETUP;
       end
    
    SETUP:begin
       //paddr = paddr_i;
       //pwdata = pwdata_i;
       pwrite = pwrite_i;
       psel = 1;
       penable = 1;
      if(psel_i == 1 && penable == 0)
       n_s = SETUP;
      else
       n_s = ACCESS;
      end
    ACCESS:begin
       if( psel_i == 1 && penable_i == 1 && pwrite_i == 1)  //Write operation
        begin
         paddr = paddr_i;
         pwdata = pwdata_i;
