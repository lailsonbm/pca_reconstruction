function [images] = load_images(paths)
% LOAD_IMAGES Loads a list of given images.
% usage: images = load_images(paths)
%         paths - list of image paths
%        images - 3D matrix of images (images(:,:,1) yields the first image and so on)
%        

images = [];
for i = 1:numel(paths)
	image = imread(paths{i});
	
	if isempty(images)
		images = uint8(zeros([size(image) numel(paths)]));
	end
	
	images(:,:,i) = image;
end

end