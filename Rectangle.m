%MATLAB CODE

l=input("Enter l: ");
b=input("Enter b: ");

a=zeros(1,2);
c1=a;
c2=a;
c3=a;
c4=a;

c1(1,1)=input("Enter x coordinate: ");
c1(1,2)=input("Enter y coordinate: ");

c2(1,1)=input("Enter x coordinate: ");
c2(1,2)=input("Enter y coordinate: ");

c3(1,1)=input("Enter x coordinate: ");
c3(1,2)=input("Enter y coordinate: ");

c4(1,1)=input("Enter x coordinate: ");
c4(1,2)=input("Enter y coordinate: ");

c1
c2
c3
c4

disp("Checking if inout is valid")
%to check distance

d12=sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
d23=sqrt((c3(1)-c2(1))^2 + (c2(2)-c3(2))^2);
d34=sqrt((c3(1)-c4(1))^2 + (c3(2)-c4(2))^2);
d41=sqrt((c1(1)-c4(1))^2 + (c1(2)-c4(2))^2);

%To check length
if(d12~=l || d34~=l)
    disp("Invalid input")
    exit()
else
    disp("Valid input")
end

%To check breadth
if(d41~=b || d23~=b)
    disp("Invalid input")
    exit()
else
    disp("Valid input")
end

%Calculation

m12= (c1(:) + c2(:)).'/2;

m34= (c3(:) + c4(:)).'/2;

Centroid= (m34(:) + m12(:)).'/2




