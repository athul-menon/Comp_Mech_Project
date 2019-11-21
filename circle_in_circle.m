%inputting the values of the main circle
r1 = input(" enter the radius of FIRST(MAIN) circle:");
a = zeros(1,2);
c1=a;
c1(1,1)=input("Enter the x coordinate of the center with respect to origin:");
c1(1,2)=input("Enter the y coordinate of the center with respect to origin:");
x1=c1(1);
y1=c1(2);
centroid1 = c1;
area1=(pi*(r1^2));
%inputting the vales of the 2nd circle
r2 = input(" enter the radius of SECOND circle:");
b = zeros(1,2);

c2(1,1)=input("Enter the x coordinate of the center with respect to origin:");
c2(1,2)=input("Enter the y coordinate of the center with respect to origin:");
x2= c2(1);
y2= c2(2);
centroid2 = c2;
area2=(pi*(r2^2));
d = sqrt( (x2-x1)^2 + (y2-y1)^2 );
if r1 > ( d + r2 ) 
   disp("SECOND circle is inside FIRST(MAIN) circle");
   flag=1;
else
   disp("SECOND circle is  NOT  inside FIRST(MAIN) circle");
   
end

if(flag==1)
    disp("Centroid of the given figure:");
    centroid=((centroid1*area1-centroid2*area2)/(area1-area2))
    Cx=centroid(1);
    Cy=centroid(2);
    d1x = Cx-c1(1);
    d1y = Cy-c1(2);
    d2x = Cx-c2(1);
    d2y = Cy-c2(2);
    
    Ic1 = (4*pi*r1*r1*r1*r1)/16;
    Ic2 = (4*pi*r2*r2*r2*r2)/16;
    Icx = Ic1-Ic2+area1*d1x*d1x - area2*d2x*d2x;
    Icy = Ic1-Ic2+area1*d1y*d1y - area2*d2y*d2y;
    
    E= area1-area2;
    disp("The MI along the centroidal axis:");
    Ic = [Icx Icy]
    Ixx= Icx+ E*Cx*Cx;
    Iyy = Icy+E*Cy*Cy;
    disp("The MI along X-axis and Y-axis");
    I=[Ixx Iyy]

end
