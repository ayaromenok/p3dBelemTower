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
        
        //on X axis from left to right
        //mLowerTower(px=-47/2, py=37/2, pz=20);
        lowerTower(px=-37/2, py=37/2, pz=28, rz=180);
        lowerTower(px=-37/2, py=-37/2, pz=28, rz=-90);
        
        lowerTower(px=10, py=35, pz=28, rz=180);
        lowerTower(px=10, py=-35, pz=28, rz=-90);
        
        lowerTower(px=78, py=35, pz=28,rz=120);
        lowerTower(px=78, py=-35, pz=28, rz=-15);
        
        lowerTower(px=95, py=14, pz=28, rz=45);
        lowerTower(px=95, py=-14, pz=28, rz=45);
        
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