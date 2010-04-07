function [images,edges] = load_images_and_edges(paths)
% LOAD_IMAGES_AND_EDGES Load images and sobel edges from paths and converts both to double.

images = [];
edges = [];
for i = 1:size(paths,2)
	image = double(imread(paths{i}));
	edge = sobel(image); % scale(sobel(image)) * 255;
	
	if isempty(images) || isempty(edges)
		images = zeros(numel(image),size(paths,2));
		edges = zeros(numel(image),size(paths,2));
	end
	
	images(:,i) = reshape(image,numel(image),1);
	edges(:,i) = reshape(edge,numel(edge),1);
end


end