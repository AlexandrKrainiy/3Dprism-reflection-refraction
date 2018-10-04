function p=create_point(pnum,r)
if(pnum<7)
    z=rand(1)*2*r-r;
end
if(pnum==7)
    z=-r;
end
if(pnum==8)
    z=r;
end
if(pnum==3 || pnum==6)
    y=rand(1)*r-r/2;
    if(pnum==3)
        x=r*sqrt(3)/2;
    else
        x=-r*sqrt(3)/2;
    end
end
if(pnum==1 || pnum==2)
    y=-rand(1)*r/2-r/2;
    if(pnum==1)
        x=-(r+y)*tand(60);
    else
        x=(r+y)*tand(60);
    end
end
if(pnum==4 || pnum==5)
    y=rand(1)*r/2+r/2;
    if(pnum==4)
        x=(r-y)*tand(60);
    else
        x=-(r-y)*tand(60);
    end
end
if(pnum==7 || pnum==8)
    y=rand(1)*r*sqrt(3)-r*sqrt(3)/2;
    x=rand(1)*2*(r^2*3/4-y^2)^0.5-(r^2*3/4-y^2)^0.5;
end
p=[x y z];
end