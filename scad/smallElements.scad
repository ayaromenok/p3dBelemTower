include <../p3dLib/lib.scad>

prongBigCross();
prongSmall(px=5);

module prongBigCross(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]){
        difference(){
            union(){
                yCyl(rb=1.8, rt=1.8, szz=2, fn=30);
                yCube(szx=3.6, szy=3.6, py=1.8, szz=2);
            }//union
            yCyl(rb=10, rt=10, szz=5, px=-2.5, py=1, pz=12.5, ry=90, fn=50);
        }//difference
        
        translate([0.0,1.1,-0.5]){
            difference(){
                union(){
        //long
        yPoly(p=[[0.2,0.2], [2,0.2], [2,0], [2.5,0], [2.5,1], [2,0.5], [0.5,0.5]], szz=1, rz=90);
        yPoly(p=[[0.2,0.2], [2,0.2], [2,0], [2.5,0], [2.5,1], [2,0.5], [0.5,0.5]], szz=1, rz=270);
        yPoly(p=[[0.2,0.2], [2,0.2], [2,0], [2.5,0], [2.5,1], [2,0.5], [0.5,0.5]], szz=1, mx=1, rz=90);
        yPoly(p=[[0.2,0.2], [2,0.2], [2,0], [2.5,0], [2.5,1], [2,0.5], [0.5,0.5]], szz=1, mx=1, rz=270);
        
        //short
        yPoly(p=[[0.2,0.2], [1.3,0.2], [1.3,0], [1.8,0], [1.8,1], [1.3,0.5], [0.5,0.5]], szz=1);                
        yPoly(p=[[0.2,0.2], [1.3,0.2], [1.3,0], [1.8,0], [1.8,1], [1.3,0.5], [0.5,0.5]], szz=1, rz=180);        
        yPoly(p=[[0.2,0.2], [1.3,0.2], [1.3,0], [1.8,0], [1.8,1], [1.3,0.5], [0.5,0.5]], szz=1, mx=1);
        yPoly(p=[[0.2,0.2], [1.3,0.2], [1.3,0], [1.8,0], [1.8,1], [1.3,0.5], [0.5,0.5]], szz=1, mx=1, rz=180);        
            }//union
            yCyl(rb=10, rt=10, szz=5, px=-2.5, py=-0.1, pz=13.2, ry=90, fn=50);
            }//difference
        }//translate
        
    }//transform
}//module prongBigCross

module prongSmall(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        yCube(szz=2,pz=1);
        translate([0,0,2])
        rotate([0,0,45])
            cylinder(1,1,0,$fn=4);
    }//transform
}//module prongSmall     
