if not(exist('pedgray', 'var') && exist('pededge', 'var'))
	disp('Loading test pedestrians...');
	[pedgray,pededge] = load_images_and_edges(dir_filenames('data/samples/test/pedestrians', '\.jpg', true));
end