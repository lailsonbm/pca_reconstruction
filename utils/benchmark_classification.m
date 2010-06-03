% Measures the classification times.

load_paths;
load_pcs;

pedpaths = dir_filenames('data/samples/train/pedestrians', '\.jpg', true);
nonpaths = dir_filenames('data/samples/train/nonpedestrians', '\.jpg', true);

paths = [pedpaths nonpaths];
expected = [ones(size(pedpaths,2),1) ; zeros(size(nonpaths,2),1)];
times = [];

iterations = 5;

for j = 1:iterations
  disp(sprintf('Running iteration #%d...', j));
  ittimes = zeros(size(expected,1), 1);

  for i = 1:size(paths,2)
    image = double(imread(paths{i}));
  
    tic;
    edge = sobel(image);
  
    image = reshape(image,numel(image),1);
    edge = reshape(edge,numel(edge),1);
  
    dgp = reconstruction_error(image,Pgpx,mngp);
    dep = reconstruction_error(edge,Pepx,mnep);
    dgn = reconstruction_error(image,Pgnx,mngn);
    den = reconstruction_error(edge,Penx,mnen);
  
    dt = dgn + den - dgp - dep;
    % dg = dgn - dgp;
    % de = den - dep;
  
    if de > 0
      % pedestrian
    else
      % non-pedestrian
    end
  
    ittimes(i) = toc;
  end
  
  times = [times ; ittimes];
end

clear iterations;

disp('-------------------');
disp('Benchmark');
disp('-------------------');
disp(sprintf('  k = %d', k));
disp(sprintf('  max = %.6fs', max(times)));
disp(sprintf('  min = %.6fs', min(times)));
disp(sprintf('  mn  = %.6fs', mean(times)));
disp(sprintf('  std = %.6fs', std(times)));
plot(times);