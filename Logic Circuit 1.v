module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
   wire e,e1,e2,y1,y2,y3,y4;
    not g1(e,x1);
    not g2(e1,x2);
    not g3(e2,x3);
    
    and g4(y1,e,x2,e2);
    and g5(y2,x1,x2,e2);
    and g6(y3,x1,e1,x3);
    and g7(y4,x1,x2,x3);
    or g8(f,y1,y2,y3,y4);

endmodu
