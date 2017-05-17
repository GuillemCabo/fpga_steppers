`default_nettype none
module driver_to_led #(parameter n_enc = 400 , n_steps = 800, mode = 2'b01) 
(CLK,LPORT,mo,ext_clk,SW1,en,idir,dir,step);
    output  idir,dir,step;
    reg [10:0] r_enc;
    input [1:0] en;
    output  [1:0] mo;
    output  [7:0] LPORT;
    input CLK,ext_clk,SW1;
        
//step modes
//mo [1] mo[0] mode steps
// 0      0    full 400
// 0      1    half 800
// 0      x    1/4
// 1      0    1/8
// 1      1    1/16
// 1      x    1/32
    assign mo = mode;

    always @ (posedge SW1)
       dir=~dir;

    always @ (posedge ext_clk)
       step=~step;

    always @ (posedge en[1])
         begin
            if (en[0]==1)
                begin
                idir<=1;
                    if (r_enc<n_enc)
                        r_enc<=r_enc+1;
                    else
                        begin
                           LPORT <= LPORT+1;
                           r_enc <= 0;
                        end
                end
            else 
                begin
                idir<=0;
                    if (r_enc>0)
                        r_enc<=r_enc-1;
                    else
                        begin
                            LPORT <= LPORT-1;
                            r_enc <= n_enc;
                        end
                end
         end
 endmodule
