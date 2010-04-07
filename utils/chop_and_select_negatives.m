% Chops and selects negative images.

load_path;

quantity = 5000;

srcdir = 'data/original_negatives';
tgtdir = 'data/chopped_negatives/';
tgtfile = strcat(tgtdir,'nonpedestrian-%.4d.jpg');

if not(exist(tgtdir,'dir'))
	mkdir(tgtdir);
end

% Chopping and saving images
k = 1; % initial index
paths = dir_filenames(srcdir, '\.jpg', true);
for i = 1:numel(paths)
	disp(sprintf('Processing image %s...', paths{i}));
	original = rgb2gray(imread(paths{i}));
	images = chop_image(original, 105, 45);
	for j = 1:size(images,3)
		imwrite(images(:,:,j), sprintf(tgtfile, k));
		k = k + 1;
	end
end

disp(sprintf('Selecting %d samples...', quantity));
paths = dir_filenames(tgtdir, '\.jpg', true);
paths = paths(randperm(numel(paths)));

disp('Loading selected samples...');
images = load_images(paths(1:quantity));

disp('Removing non-selected samples...');
rmdir(tgtdir,'s');
mkdir(tgtdir);

disp('Writing selected samples...');
paths = {};
for i = 1:quantity
	paths{i} = sprintf(tgtfile, i);
end
save_images(paths, images);

clear quantity srcdir tgtdir tgtfile i j k paths original images;