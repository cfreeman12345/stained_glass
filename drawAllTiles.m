function drawAllTiles(x,y,colr)
% x and y are (nr+1)-by-(nc+1) matrices where nr is the number of rows of
% tiles and nc is the number of columns of tiles:
% x(i,j) is the x-coordinate of point (i,j) and
% y(i,j) is the y-coordinate of point (i,j).
% Each point is a vertex of a quadrilateral tile. Specifically, a tile at
% row r and column c has the vertices at points
% (r,c), (r+1,c), (r+1,c+1), and (r,c+1)
% colr is a 3-d array of rgb values (size nr-by-nc-by-3):
% colr(r,c,1) is the red value of tile (r,c),
% colr(r,c,2) is the green value of tile (r,c), and
% colr(r,c,3) is the blue value of tile (r,c).
% Draw the nr*nc tiles specified by x, y, and colr.

%Calculate maxX and maxY, the maximum values in the x and y matrices,
%respectively.
[NR, NC]=size(x);
maxX=-inf;
maxY=-inf;
for i=1:NR
    for p=1:NC
        if x(i, p)>maxX
            maxX=x(i, p);
        end
        if y(i, p)>maxY
            maxY=y(i, p);
        end
    end
end
figure(2)
axis equal off
axis([0 maxX 0 maxY])
hold on

%Draw the irregular quadrilaterals
for j=1:NR-1
    for k=1:NC-1
        myFill([x(j, k), x(j, k+1), x(j+1, k+1), x(j+1, k)], [y(j, k), ...
            y(j, k+1), y(j+1, k+1), y(j+1, k)], colr(j, k, :), .3)
    end
end
hold off
            