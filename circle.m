function [vector, center, radius] = circle (x1,y1,x2,y2,x3,y3)
% This function computes for the vector [Dx, Ey, F], coordinates of the center
% (h,k), and radius of a circle.
% Input: 3 points in the circle

f1 = 1;
rhs1 = (x1^2) + (y1^2);

f2 = 1;
rhs2 = (x2^2) + (y2^2);

f3 = 1;
rhs3 = (x3^2) + (y3^2);

%solve Dx, Ey, F
a = [x1, y1, f1; x2, y2, f2; x3, y3, f3];
d = [rhs1, y1, f1; rhs2, y2, f2; rhs3, y3, f3];
e = [rhs1, x1, f1; rhs2, x2, f2; rhs3, x3, f3];
f = [rhs1, x1, y1; rhs2, x2, y2; rhs3, x3, y3];

a2 = det(a);
d2 = det(d);
e2 = det(e);
f2 = det(f);

d3 = round((-d2 / a2),2);
e3 = round((e2 / a2),2);
f3 = round((-f2 / a2),2);

%vector Dx, Ey, F
vector = [d3, e3, f3];

%center of circle 
h = round((d2 / (a2*2)),2);
k = round(-e2 / (a2*2),2);
center = [h,k]; 

%radius of circle 
r = ((h - x1)^2) + ((k - y1)^2);
radius = round(sqrt(r), 2);


% ?test data: circle(-1,2, -3,4, 5,-6)
end