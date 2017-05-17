`default_nettype none
module driver_to_led (CLK,ext_clk,LPORT,SW1,en,idir,dir,step);
    output  idir,dir,step;
    output [7:0] LPORT; 
    input [1:0] en;
    input CLK,ext_clk,SW1;
        
  //  assign idir = en[0]&(~en[1]);

    always @ (posedge SW1)
       dir=~dir;

    always @ (posedge ext_clk)
       step=~step;

    always @ (posedge en[1])
         begin
            if (en[0]==1)
                begin
                idir<=1;
                LPORT<=LPORT+1;
                end
            else 
                begin
                LPORT<=LPORT-1;
                idir<=0;
                end
         end
            
 endmodule
