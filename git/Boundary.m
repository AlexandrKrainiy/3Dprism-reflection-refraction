function z=Boundary(p,num,Vn,B)
z=0;
for i=1:size(Vn,1)
    if(i==num)
        continue;
    end
    B1=Vn(i,:)*p';
    if(abs(B(i)-B1)<0.01)
        z=1;
        break;
    end
end
end