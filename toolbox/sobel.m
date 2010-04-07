function [edge] = sobel(image)
% SOBEL Detects edge using first derivative (Sobel).
% usage: edge = sobel(image)
%       image - image for edge detection
%        edge - resulting edge
%        

gh = imfilter(image,fspecial('sobel') /8,'replicate');
gv = imfilter(image,fspecial('sobel')'/8,'replicate');
edge = abs(gh) + abs(gv);

end