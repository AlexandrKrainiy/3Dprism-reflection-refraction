function z=F1(x,p,q)
p=p./sqrt(p*p');q=q./sqrt(q*q');
z(1)=x(1)^2+x(2)^2+x(3)^2-1;
c=-p*q';
z(2)=x*q'-abs(c);
z(3)=x(1)*(p(2)*q(3)-p(3)*q(2))-x(2)*(p(1)*q(3)-p(3)*q(1))+x(3)*(p(1)*q(2)-p(2)*q(1));
z(4)=-x*p'-(2*c^2-1);
end