function z=F(x,p,q,m1,m2)
p=p./sqrt(p*p');q=q./sqrt(q*q');
z(1)=x(1)^2+x(2)^2+x(3)^2-1;
c=-p*q';d=sqrt(1-c^2);e=m1*d/m2;f=sqrt(1-e^2);
z(2)=x*q'+f+abs((x*p'>abs(c))-1);
z(3)=x(1)*(p(2)*q(3)-p(3)*q(2))-x(2)*(p(1)*q(3)-p(3)*q(1))+x(3)*(p(1)*q(2)-p(2)*q(1));
end