function [] = save_images(paths, images)
% SAVE_IMAGES Save a list of images to a list of paths.
% usage: save_images(paths, images)
%         paths - list of image paths
%        images - 3D matrix of images (images(:,:,1) yields the first image and so on)
%        

for i = 1:numel(paths)
	imwrite(images(:,:,i), paths{i});
end

end