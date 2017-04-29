`timescale 1ns/100ps
 
 module priority_encoder_tb;
 reg [7:0] in_tb; 
 wire [2:0] out_tb; 
 wire valid_tb;
 integer i;
 priority_encoder  DUT(.A(in_tb), .Y(out_tb), .Valid(valid_tb)); //Instantiate Priority Encoder
 
 initial   
    begin  //Start Test Bench
        for(i = 0; i < 256; i = i + 1) begin 
                in_tb = i;                      //Set in_tb to all possible 8-bit values: 0-255
                #10
                if(!valid_tb && in_tb != 0) //check if output is valid
                    $display("Error"); //Output "Error" to Console if not valid
             end
        $display("Done"); //Output "Done" to Console once simulation complete
  end  
 endmodule   
