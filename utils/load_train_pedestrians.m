if not(exist('pedgray', 'var') && exist('pededge', 'var'))
	disp('Loading train pedestrians...');
	[pedgray,pededge] = load_images_and_edges(dir_filenames('data/samples/train/pedestrians', '\.jpg', true), edge_method);
end