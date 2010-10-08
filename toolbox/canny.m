function [edge] = canny(a)
% CANNY Detects edge using the Canny algorithm.
% usage: edge = canny(image)
%       image - image for edge detection
%        edge - resulting edge
%        

% Transform to a double precision intensity image if necessary
if ~isa(a,'double') && ~isa(a,'single') 
  a = im2single(a);
end

% Magic numbers
GaussianDieOff = .0001;
sigma = 1;

% Design the filters - a gaussian and its derivative

pw = 1:30; % possible widths
ssq = sigma^2;
width = find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff,1,'last');
if isempty(width)
width = 1;  % the user entered a really small sigma
end

t = (-width:width);
gau = exp(-(t.*t)/(2*ssq))/(2*pi*ssq);     % the gaussian 1D filter

% Find the directional derivative of 2D Gaussian (along X-axis)
% Since the result is symmetric along X, we can get the derivative along
% Y-axis simply by transposing the result for X direction.
[x,y]=meshgrid(-width:width,-width:width);
dgau2D=-x.*exp(-(x.*x+y.*y)/(2*ssq))/(pi*ssq);

% Convolve the filters with the image in each direction
% The canny edge detector first requires convolution with
% 2D gaussian, and then with the derivitave of a gaussian.
% Since gaussian filter is separable, for smoothing, we can use 
% two 1D convolutions in order to achieve the effect of convolving
% with 2D Gaussian.  We convolve along rows and then columns.

%smooth the image out
aSmooth=imfilter(a,gau,'conv','replicate');   % run the filter across rows
aSmooth=imfilter(aSmooth,gau','conv','replicate'); % and then across columns

%apply directional derivatives
ax = imfilter(aSmooth, dgau2D, 'conv','replicate');
ay = imfilter(aSmooth, dgau2D', 'conv','replicate');

edge = sqrt((ax.*ax) + (ay.*ay));
edgemax = max(edge(:));
if edgemax>0
  edge = edge / edgemax;   % normalize
end

end