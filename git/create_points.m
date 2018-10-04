function p=create_points(pnum,r,first_point,points_num,direct_vector)
if(pnum<7)
    r1=r/2;
    len=floor(sqrt(points_num)+0.5);
    d1=direct_vector(1,1:3);
    d2=direct_vector(1,4:6);
    p=[];
    sp=r1*2/(len+1);
    nn=0;i=1;j=1;
    while nn<points_num
        d1=d1./sqrt(d1*d1');
        d2=d2./sqrt(d2*d2');
        p=[p;first_point+d1.*i.*sp+d2.*j.*sp];
        j=j+1;
        if(j>len)
            i=i+1;j=1;
        end
        nn=nn+1;
    end
else
    k=floor((3+sqrt(12*points_num-3))/6)+1;
    d1=direct_vector(1,1:3);
    d2=direct_vector(1,4:6);
    first_point1=first_point+d2;
    d3=direct_vector(1,7:9);
    d1=d1./sqrt(d1*d1');
    d2=d2./sqrt(d2*d2');
    d3=d3./sqrt(d3*d3');
    x=r/k;
    p=[];
    nn=0;
    for i=1:k
       for j=1:k+(i-1)
          p=[p;first_point+d1.*j.*x+d2.*i.*x]; 
          nn=nn+1;
          if(nn>=points_num)
              break;
          end
       end
       if(nn>=points_num)
              break;
          end
    end
    for i=k-1:-1:1
       for j=1:k+(i-1)
          p=[p;first_point1+d1.*j.*x+d3.*(k-i).*x]; 
          nn=nn+1;
          if(nn>=points_num)
              break;
          end
       end
       if(nn>=points_num)
              break;
          end   
    end
end