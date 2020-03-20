include <../p3dLib/lib.scad>
include <smallElements.scad>
mdl();
            
module mdl(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        yCube(szx=37, szy=37, szz=39, pz=19.5);
        yCube(szx=35, szy=37, szz=26, pz=39+13);
        yCube(szx=32, szy=30, szz=18, py=1, pz=39+26+9);
        difference(){
            yPoly(p=[[0,35], [68,35], [85,14], [85,-14], [68,-35], [0,-35]], szz=26, px=10);
            yCube(szx=36,szy=20, szz=24, px=45, pz=20);
        }//diff
        yCube(szx=19, szy=14, szz=7, px=-37/2+19/2, py=37/2+7, pz=3.5);
        
        //on X axis from left to right, ground side
        //mLowerTower(px=-47/2, py=37/2, pz=20);
        lowerTower(px=-37/2, py=37/2, pz=28, rz=180);
        lowerTower(px=-37/2, py=-37/2, pz=28, rz=-90);
        
        lowerTower(px=10, py=35, pz=28, rz=180);
        lowerTower(px=10, py=-35, pz=28, rz=-90);
        
        lowerTower(px=78, py=35, pz=28,rz=120);
        lowerTower(px=78, py=-35, pz=28, rz=-15);
        //ocean side
        lowerTower(px=95, py=14, pz=28, rz=45);
        lowerTower(px=95, py=-14, pz=28, rz=45);
        
        //prongs
        //Y+
        for (i=[2:6:56]){
            prongBigCross(px=73-i, py=35, pz=26, rx=90, rz=180);
        }//for i
        for (i=[0:6:10]){
            prongBigCross(px=10, py=29-i, pz=26, rx=90, rz=270);
        }//for i
        //Y-
        for (i=[2:6:56]){
            prongBigCross(px=73-i, py=-35, pz=26, rx=90, rz=0);
        }//for i
        for (i=[0:6:10]){
            prongBigCross(px=10, py=-29+i, pz=26, rx=90, rz=270);
        }//for i
        //front
        for (i=[0:6:15]){
            prongBigCross(px=95, py=-6+i, pz=26, rx=90, rz=90);
        }//for i
        //front 39 degrees
        for (i=[0:5:12]){
            prongBigCross(px=82+i*0.82, py=-30+i, pz=26, rx=90, rz=51);
        }//for i
        for (i=[0:5:12]){
            prongBigCross(px=82+i*0.82, py=30-i, pz=26, rx=90, rz=129);
        }//for i
        
        //upper towers
        mUpperTower(px=(32/2), py=(30/2)+1, pz=(39+26+18-7));
        mUpperTower(px=(32/2), py=-(30/2+1), pz=(39+26+18-7));
        mUpperTower(px=-(32/2), py=(30/2)+1, pz=(39+26+18-7));
        mUpperTower(px=-(32/2), py=-(30/2)+1, pz=(39+26+18-7));
    }//transform
}//module mdl

module mLowerTower(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
            ySphere(r=3,pz=10);
            yCyl(rb=3,rt=3, szz=10, pz=10/2);
            ySphere(r=3,pz=0);
        }//transform
}//module mLowerTower

module mUpperTower(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
            ySphere(r=2, pz=10);
            yCyl(rb=2, rt=2, szz=10, pz=10/2);            
        }//transform
}//module mUpperTower