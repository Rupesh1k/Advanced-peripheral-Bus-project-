
module apbslave(prdata,pready,paddr,psel,penable,pwrite,pwdata,pclk,presetn);

 output reg [31:0]prdata;
 output reg pready;
 input [31:0]paddr;
 input [31:0]pwdata;
 input psel,penable,pwrite,pclk,presetn;

 integer i=0;
	
 reg [1:0]p_s,n_s;
 reg [31:0]mem[0:99];
	
 parameter IDLE = 2'b00;
 parameter SETUP = 2'b01;
 parameter ACCESS = 2'b10;
	
 always @(posedge pclk)
  begin
   if(presetn)
   begin
    for(i=0; i<100; i=i+1)
     mem[i] <=0;
     p_s <= IDLE;
   end
   else
    p_s <= n_s;
  end
  
 always @(*)
  begin
   case(p_s)
    IDLE:begin
      if(psel == 0)
       n_s = IDLE;
      else
       n_s = SETUP;
      end
    SETUP:begin
      if((psel == 1) && (penable == 0))
       n_s = SETUP;
      else
       n_s = ACCESS;
      end
    ACCESS:begin
         if(psel == 1 && penable == 1 && pwrite == 1)
         begin
         mem[paddr] = pwdata;
         pready = 0;
         n_s = ACCESS;
         end
        else if(psel == 1 && penable == 1 && pwrite == 0)
        begin
         prdata = mem[paddr];
         pready = 1;
         n_s = SETUP;
        end
        else
        begin
         pready = 1;
         n_s = IDLE;
         end
         end
   endcase
  end

endmodule
