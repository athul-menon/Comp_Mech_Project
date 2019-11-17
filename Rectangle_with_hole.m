l=input("Enter l: ");
b=input("Enter b: ");
r=input("Enter the radius of the hole:");
x=l+b;
areaRect=l*b;
areaCir= (pi*((r)^2))
a=zeros(1,2);
c1=a;
c2=a;
c3=a;
c4=a;
c=a;

 c1(1,1)=input("Enter x coordinate for point1:");
 c1(1,2)=input("Enter y coordinate for point1:");
 c2(1,1)=input("Enter x coordinate for point2:");
 c2(1,2)=input("Enter y coordinate for point2:");
 c3(1,1)=input("Enter x coordinate for point3:");
 c3(1,2)=input("Enter y coordinate for point3:");
 c4(1,1)=input("Enter x coordinate for point4:");
 c4(1,2)=input("Enter y coordinate for point4:");
 c(1,1)=input("Enter the x coordinate of the center of hole:");
 c(1,2)=input("Enter the y coordinate of the center of hole:");
 
 d12=sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
 d23=sqrt((c3(1)-c2(1))^2 + (c3(2)-c2(2))^2);
 d34=sqrt((c3(1)-c4(1))^2 + (c3(2)-c4(2))^2);
 d14=sqrt((c1(1)-c4(1))^2 + (c1(2)-c4(2))^2);
 a = d12+d23;
 b = d34+d14 ;
 flag =0;
 
 disp("Checking if input is valid")
 
 d1 = sqrt((c1(1)-c(1))^2 + (c1(2)-c(2))^2);
 d2 = sqrt((c2(1)-c(1))^2 + (c2(2)-c(2))^2);
 d3 = sqrt((c3(1)-c(1))^2 + (c3(2)-c(2))^2);
 d4 = sqrt((c4(1)-c(1))^2 + (c4(2)-c(2))^2);
 
 if(a==x && b==x)
     disp(" valid");
     flg=1;
     if(
 else
     disp("invalid");
     flg=2;
 end
 if(flg==1)
     m1=(c1+c2)/2 ;
     m2= (c3+c4)/2 ;
     centroidRect = (m1+m2)/2 
     
 else
     disp("Calculation not possible")
 end
 
 centroidCir = c
 
if(flg=1)
     if(d1>r && d2>r)
      if(d3>r && d4>r)
         disp("Valid");
         flag = 1;
      else
         disp("invalid");
      end
     else
     disp("invalid");
     end
end
 
 
        
        
 if(flag==1)
     centroid = ((centroidRect*areaRect)-(centroidCir*areaCir))/ (areaRect -areaCir)
 else
     disp("Calculation not possible");
