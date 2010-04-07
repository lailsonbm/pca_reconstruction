% Prepare MIT CBCL Pedestrians images to article's format:
%   1. converts image to grayscale
%   2. crops images to 45 x 105 pixels
%   3. saves images to JPEG format
% The PPM files are REPLACED by JPEG files.

load_path;

paths = dir_filenames('data/mit_cbcl', '\.ppm$', true);
for i = 1:numel(paths)
	disp(sprintf('Converting image %s...', paths{i}));
	image = rgb2gray(imread(paths{i}));
	image = image(13:117,11:55);
	imwrite(image, regexprep(paths{i}, 'ppm$', 'jpg'));
	delete(paths{i});
end
clear paths i image;