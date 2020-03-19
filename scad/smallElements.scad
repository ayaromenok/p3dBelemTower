include <../p3dLib/lib.scad>

//lowerTower();
//prongBigCross(px=10);
//prongSmall(px=5);

module prongBigCross(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz])
    scale([0.9,0.9,0.9])
    {
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

module lowerTower(px=0, py=0, pz=0, rx=0, ry=0, rz=0, isPrinted=false){
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([1.2,1.2,1.2])
    {
        yCyl(rb=0.25, rt=0, szz=0.3, pz=6.05);
        ySphere(r=0.33, px=0, pz=5.7);
        //4 spheres on top
        ySphere(r=0.33, px=0.4, pz=4.9);
        ySphere(r=0.33, px=-0.4, pz=4.9);
        ySphere(r=0.33, py=0.4, pz=4.9);
        ySphere(r=0.33, py=-0.4, pz=4.9);
        
        //cupolla small
        yCyl(rb=0.2,rt=0.2, pz=4.9);        
        yCyl(rb=0.8,rt=0.2, pz=3.9);
        yCyl(rb=0.9,rt=0.9,pz=3);
        translate([0,0,3])
            rotate_extrude(convexity = 10, $fn = 36)
            translate([0.8, 0, 0])
            circle(r = 0.3, $fn = 12);

        //cupolla big
        translate([0,0,1])
        rotate([0,-90,0])
        for (i=[0:30:330]){
            rotate([i,0,0])
            for (j=[0:5:90]){
                rotate([0,0,j])
                    rotate_extrude(convexity = 10, angle=5)
                        translate([1.8, 0, 0])
                            circle(r = 0.5*sin(j), $fn = 16);
            }//for j:0:90
        }//for i:0:350
        
        translate([0,0,0.8])
            rotate_extrude(convexity = 10, $fn = 36)
            translate([2.2, 0, 0])
            circle(r = 0.3, $fn = 12);
        //main part
        difference(){
            yCyl(rb=2.3, rt=2.3, szz=5, pz=-1.6, ry=0, fn=20);
            yCyl(rb=1.8, rt=1.8, szz=6, pz=-1.5, ry=0);
            //big window
            yCube(szy=1.4, szz=1.7, px=1.4, py=-1.4, rz=-45, pz=-0.7);
            //holes at bottom
            for (k=[0:45:300]){
                rotate([0,0,k])
                    yPoly(p=[[0.0,0.6], [1.2,0.2], [1.2,-0.2], [0,-0.6]], szz=1, px=2.4, pz=-4.15, ry=-90);
            }//for k
        }//diff
        //support
        if (isPrinted){
            difference(){
                yCyl(rb=3.3, rt=3.3, szz=0.2, pz=-4.2, ry=0, fn=20);
                yCyl(rb=2.1, rt=2.1, szz=2, pz=-4.5, ry=0);
            }//diff -
        }//siPrinted
    }//transform
}//module lowerTower