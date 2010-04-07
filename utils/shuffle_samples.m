% Mix train and test sample images.

disp('Reading pedestrian list...');
train_paths = dir_filenames('data/train/pedestrians', '\.jpg$', true);
test_paths = dir_filenames('data/test/pedestrians', '\.jpg$', true);

disp('Shuffling pedestrian list...');
paths = {train_paths{:} test_paths{:}};
paths = paths(randperm(size(paths,2)));

disp('Loading pedestrian images...');
train_images = load_images(train_paths);
test_images = load_images(test_paths);

disp('Writing pedestrian images...');
train_target = paths(1:numel(train_paths));
test_target = paths((numel(train_paths)+1):(numel(train_paths) + numel(test_paths)));
save_images(train_target, train_images);
save_images(test_target, test_images);

disp('Clearing workspace...');
clear train_paths test_paths paths;
clear train_images test_images;
clear train_target test_target;

%%

disp('Reading non-pedestrian list...');
train_paths = dir_filenames('data/train/nonpedestrians', '\.jpg$', true);
test_paths = dir_filenames('data/test/nonpedestrians', '\.jpg$', true);

disp('Shuffling non-pedestrian list...');
paths = {train_paths{:} test_paths{:}};
paths = paths(randperm(size(paths,2)));

disp('Loading non-pedestrian images...');
train_images = load_images(train_paths);
test_images = load_images(test_paths);

disp('Writing non-pedestrian images...');
train_target = paths(1:numel(train_paths));
test_target = paths((numel(train_paths)+1):(numel(train_paths) + numel(test_paths)));
save_images(train_target, train_images);
save_images(test_target, test_images);

disp('Clearing workspace...');
clear train_paths test_paths paths;
clear train_images test_images;
clear train_target test_target;