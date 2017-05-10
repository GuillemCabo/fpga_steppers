`default_nettype none
module driver_to_led (LPORT,SW1,count,step,dir,en,clk,idir,butt);
    input SW1, clk , butt;
    output step,dir,idir;
    input [1:0] en;
    output [7:0] LPORT,count;

    assign LPORT=count;
    assign idir = en[0]&(~en[1]);

    always @ (posedge SW1)
        dir=~dir;

    always @ (posedge clk)
        begin
            step=~step;
            if (dir==1)
                count<=count+1;
            else 
                count<=count-1;
        end
 endmodule
