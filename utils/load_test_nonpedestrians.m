if not(exist('nongray', 'var') && exist('nonedge', 'var'))
	disp('Loading test non-pedestrians...');
	[nongray,nonedge] = load_images_and_edges(dir_filenames('data/samples/test/nonpedestrians', '\.jpg', true), edge_method);
end