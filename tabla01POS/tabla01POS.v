module tabla01POS();

// POS del tabla01POS

  reg A, B, C;
  wire w1, w2, w3, out, wa, wb, wc;

  // not (salida, entrada);
  // and (salida, entrada1, entrada2, entrada3, etc);
  
  not U1(wa, A);
  not U2(wb, B);
  not U3(wc, C);
  or U1(w1, A, B, wc);
  or U2(w2, A, wb, wc);
  or U3(w3, wb, C, wa);
  and U4(out, w1, w2, w3);


  initial begin
    $display("A B C | Y");
    $display("-------");
    $monitor("%b %b %b | %b", A, B, C, out);
    A = 0; B = 0; C=0;
    #1 C = 1;
    #1 B = 1;
    C = 0;
    #1 B = 1;
    C = 1;
    #1 A = 1;
    B = 0;
    C = 0;
     #1 C = 1;
    #1 B = 1;
    C = 0;
    #1 B = 1;
    C = 1;
    #1 $finish;
  end

  initial begin
      $dumpfile("tabla01POS.vcd"); 
      $dumpvars(0, tabla01POS);
    end 

endmodule	