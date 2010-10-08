if not(exist('nongray', 'var') && exist('nonedge', 'var'))
	disp('Loading train non-pedestrians...');
	[nongray,nonedge] = load_images_and_edges(dir_filenames('data/samples/train/nonpedestrians', '\.jpg', true), edge_method);
end