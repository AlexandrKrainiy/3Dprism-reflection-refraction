function [angle,flag]=reflect(n1,n2,m1,m2,flag)
if(flag==1)
    % find refrection direction
    x0=[0 0 0];
    angle=fsolve(@(x) F(x,n1,n2,m1,m2),x0);
else
    %find reflection direction.
    n2=-n2;
    x0=[0 0 0];
    angle=fsolve(@(x) F1(x,n1,n2),x0);
        
end
end