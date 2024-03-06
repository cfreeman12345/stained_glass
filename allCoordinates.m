function [x, y] = allCoordinates(w,h,nx,ny)
% Generate the coordinates of grid points covering a rectangle of width w,
% height h, and lowerleft corner at (0,0). nx points cover the width and
% ny points cover the height.
% Start with a regularly-spaced grid. Then add random noise to the
% coordinates of interior grid points to represent "tiles" that are
% irregularly shaped quadrilaterals. For each interior grid point, the
% change (in the x and y directions) should be no bigger than 40% of the
% spacing in the regular grid.
% x and y are ny-by-nx matrices such that
% the x-coordinate of grid point (i,j) is stored in x(i,j) and
% the y-coordinate of grid point (i,j) is stored in y(i,j).
% Recall that increasing x-values correspond to increasing COLUMN numbers
% while increasing y-values correspond to DECREASING ROW numbers.

%Compute coordinates of regularly spaced grid
x=zeros(ny, nx);
y=zeros(ny, nx);
horizontalspacing=w/(nx-1);
verticalspacing=h/(ny-1);
d=0;
h=0;
for j=ny:-1:1%opposite order because increasing y-values correspond to 
    %decreasing row numbers.
    y(j, :)=h;
    h=h+verticalspacing;
end
for k=1:nx
    x(:, k)=d;
    d=d+horizontalspacing;
end

%Add in noise in the x and y directions of no more than 40% of the original
%spacing to make irregularly shaped quadrilaterals.
yMaxNoise=.4*verticalspacing;
xMaxNoise=.4*horizontalspacing;
for i=2:ny-1
    for t=2:nx-1 
    y(i, t)=y(i, t)+rand*2*yMaxNoise-yMaxNoise;
    end
end
for c=2:ny-1
    for d=2:nx-1
        x(c, d)=x(c, d)+rand*2*xMaxNoise-xMaxNoise;
    end
end
        