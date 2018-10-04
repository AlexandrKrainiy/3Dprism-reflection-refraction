function z=F2(x,p,theta)
p=p./sqrt(p*p');
z(1)=x(1)^2+x(2)^2+x(3)^2-1;
z(2)=x*p'+cosd(theta);
end