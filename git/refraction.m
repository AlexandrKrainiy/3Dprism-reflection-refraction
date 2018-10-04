function [Pp,Pn, wallnum,BF]=refraction(p,vp,m1,m2,num,AVn,B,shp)
nn=0;
Bflag=0;
Pp=p;Pn=vp;wallnum=num;BF=Bflag;
% decide wheteher point is in boundary between planes or not.
if(Boundary(p,num,AVn,B))
    newp=vp;nn=nn+1;
    Bflag=1;
else
    % find new direct for refrection
   newp=reflect(vp,AVn(num,:),m1,m2,1);
end

% the number of reflection
nmax=5;
% find reflection point and direct one by one
while(nn<nmax)
for i=1:size(AVn,1)
    if(i==num)
        continue;
    end
    if(abs(newp*AVn(i,:)')<0.01)
        continue;
    end
    A=[newp(2), -newp(1),0;newp(3), 0 , -newp(1);AVn(i,1),AVn(i,2),AVn(i,3)];
    b=[p(1)*newp(2)-p(2)*newp(1),p(1)*newp(3)-p(3)*newp(1),B(i)]';
    p0=A\b;
    q=p0'-p;
    if(newp*q'<=0)
        continue;
    end
    pq=p+q.*0.99;
    if(inShape(shp,pq))
        newpoint=p0';
        index=i;
        break;
    end
end
Pp=[Pp;newpoint];
Pn=[Pn;newp];
BF=[BF,Bflag];
wallnum=[wallnum,index];
v=[p;newpoint];
plot3(v(:,1),v(:,2),v(:,3),'r-');
hold on;
newp=reflect(newp,AVn(index,:),m2,m1,0);
num=index;p=newpoint;
nn=nn+1;
end
wallnum=wallnum(1:end-1);
end