function myFill(x,y,c,w)
% Fill the polygon with vertices specified by x and y with color c and 
% draw a black border with LineWidth w.
% x and y are vectors of the same length where (x(k),y(k)) are the
% coordinates of vertex k of a polygon.
% c is an rgb vector or a predefined color name such as 'b', 'r', etc.
% w is the LineWidth in points. (E.g., Matlab default line width is .5 point)

fill(x,y,c)
x= [x x(1)];
y= [y y(1)];
plot(x,y,'k','LineWidth',w)