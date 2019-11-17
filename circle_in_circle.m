$inputting the values of the main circle
r1 = input(" enter the radius of FIRST(MAIN) circle:");
a = zeros(1,2);
c1=a;
c1(1,1)=input("Enter the x coordinate of the center with respect to origin:");
x1=c1(1,1);
c1(1,2)=input("Enter the y coordinate of the center with respect to origin:");
y1=c1(1,2);
centroid1 = c1
area1=((3.14*(r1^2))/4);
#inputting the vales of the 2nd circle
r2 = input(" enter the radius of SECOND circle:");
b = zeros(1,2);
c2=b;
c2(1,1)=input("Enter the x coordinate of the center with respect to origin:");
x2=c2(1,1);
c2(1,2)=input("Enter the y coordinate of the center with respect to origin:");
y2=c2(1,2);
centroid2 = c2
area2=((3.14*(r2^2))/4);
d = sqrt( (x2-x1)^2 + (y2-y1)^2 );
if r1 > ( d + r2 ) 
   disp("SECOND circle is inside FIRST(MAIN) circle");
   flag=1;
else
   disp("SECOND circle is  NOT  inside FIRST(MAIN) circle");
   
end
if(flag==1)
    centroid=((centroid1*area1-centroid2*area2)/(area1-area2))
else
    disp(" CENTROID CANNOT BE CALCULATED ");

end
