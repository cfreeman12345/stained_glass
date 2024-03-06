function colr = stainedGlass(imName,nr,nc)
% Draw a "stained glass version" of a color image.
% imName is the string name of the image file
% The stained glass picture has nr rows by nc columns of quadrilateral
% glass tiles.  Each tile corresponds to a block of pixels in the image and
% has a color that is calculated from those pixels.
% colr is a 3-d array of rgb values (type double and size nr-by-nc-by-3):
%   colr(r,c,1) is the red value of block (r,c),
%   colr(r,c,2) is the green value of block (r,c), and
%   colr(r,c,3) is the blue value of block (r,c).

close all

colr= zeros(nr,nc,3);
im= imread(imName);
[nrIm,ncIm,np]= size(im);


% Divide image into nr rows and nc columns of "blocks" and calculate
% the average rgb values of each block.  Scale the uint8 values to the
% range [0,1].
im=double(im);
imD=im./255;
a=round(linspace(0, nrIm, nr+1), 0);
b=round(linspace(0, ncIm, nc+1), 0);
for j=1:nr
    for k=1:nc
        rsum=0;
        gsum=0;
        bsum=0;
        for i=a(j)+1:a(j+1)
            for t=b(k)+1:b(k+1)
               rsum=rsum+imD(i, t, 1);
               gsum=gsum+imD(i, t, 2);
               bsum=bsum+imD(i, t, 3);
            end
        end
        rAvg=rsum/((a(j+1)-a(j))*(b(k+1)-b(k)));
        gAvg=gsum/((a(j+1)-a(j))*(b(k+1)-b(k)));
        bAvg=bsum/((a(j+1)-a(j))*(b(k+1)-b(k)));
        colr(j, k, 1)=rAvg;
        colr(j, k, 2)=gAvg;
        colr(j, k, 3)=bAvg;
    end
end


% Generate coordinates of all "glass tiles"
[x, y] = allCoordinates(ncIm,nrIm,nc+1,nr+1);

% Draw the glass tiles
drawAllTiles(x,y,colr)
