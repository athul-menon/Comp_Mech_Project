%for the rectangle
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



%For the slot(Rectangular)
l2=input("Enter l: ");
b2=input("Enter b: ");

a=zeros(1,2);
cr1=a;
cr2=a;
cr3=a;
cr4=a;

cr1(1,1)=input("Enter x coordinate: ");
cr1(1,2)=input("Enter y coordinate: ");

cr2(1,1)=input("Enter x coordinate: ");
cr2(1,2)=input("Enter y coordinate: ");

cr3(1,1)=input("Enter x coordinate: ");
cr3(1,2)=input("Enter y coordinate: ");

cr4(1,1)=input("Enter x coordinate: ");
cr4(1,2)=input("Enter y coordinate: ");

cr1
cr2
cr3
cr4

disp("Checking if input is valid")
%to check distance(rectangular slot)

dr12=sqrt((cr1(1)-cr2(1))^2 + (cr1(2)-cr2(2))^2);
dr23=sqrt((cr3(1)-cr2(1))^2 + (cr2(2)-cr3(2))^2);
dr34=sqrt((cr3(1)-cr4(1))^2 + (cr3(2)-cr4(2))^2);
dr41=sqrt((cr1(1)-cr4(1))^2 + (cr1(2)-cr4(2))^2);

%To check length of the slot
if(dr12~=l2 || dr34~=l2)
    disp("Invalid input")
    exit()
else
    disp("Valid input")
end

%To check breadth og the slot
if(dr41~=b2 || dr23~=b2)
    disp("Invalid input")
    exit()
else
    disp("Valid input")
end

%Calculation of centroid of the rectangular slot

mr12= (cr1(:) + cr2(:)).'/2;

mr34= (cr3(:) + cr4(:)).'/2;

Centroid= (mr34(:) + mr12(:)).'/2
