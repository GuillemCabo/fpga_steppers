`default_nettype none
module driver_to_led (CLK,mo,ext_clk,LPORT,SW1,en,idir,dir,step);
    output  idir,dir,step;
    output [7:0] LPORT; 
    input [1:0] en;
    output  [1:0] mo;
    input CLK,ext_clk,SW1;
        
//step modes
//mo [0] mo[1]
// 0      0    full
// 1      0    half
// x      0    1/4
// 0      1    1/8
// 1      1    1/16
// x      1    1/32
    assign mo = 2'b11;

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
