function [p1,p2,pnum]=find_wall(p0, n, normal_vector,b,shp)
p1=[];p2=[];pnum=-1;
for i=1:size(normal_vector,1)
    N=normal_vector(i,:)';
    if(abs(n*N)<0.001)
        continue;
    end
    if(abs(n(1)>0.01))
        c1=N(1)+N(2)*n(2)/n(1)+N(3)*n(3)/n(1);
        c2=b(i)+N(2)*(n(2)/n(1)*p0(1)-p0(2))+N(3)*(n(3)/n(1)*p0(1)-p0(3));
        x=c2/c1;y=n(2)/n(1)*(x-p0(1))+p0(2);z=n(3)/n(1)*(x-p0(1))+p0(3);
        p1=[x,y,z]; p11=p1+n.*1;
        if(inShape(shp,p11))
             p2=p1-n.*50;
             if(~inShape(shp,p2))
                 pnum=i;
                 break;
             end
        end
    end
end
if(pnum==-1)
    p1=[];p2=[];
end
end