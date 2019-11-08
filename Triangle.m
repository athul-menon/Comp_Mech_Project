a= zeros(1,2);
c1=a;
c2=a;
c3=a;

c1(1,1)=input("Enter the x coordinate of point1:");
c1(1,2)=input("Enter the y coordinate of point1:");
c2(1,1)=input("Enter the x coordinate of point2:");
c2(1,2)=input("Enter the y coordinate of point2:");
c3(1,1)=input("Enter the x coordinate of point3:");
c1(1,2)=input("Enter the x coordinate of point3:");

m12= (c1+c2)/2;
m23 = (c2+c3)/2;
m31= (c1+c3)/2;
 v1= m23-c1;
 v2= m31-c2;
 centroid = intersect(v1,v2)
 
