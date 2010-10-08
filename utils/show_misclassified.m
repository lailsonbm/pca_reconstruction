% Show the images that were misclassified.

load_paths;
load_pcs;

pedpaths = dir_filenames('data/samples/test/pedestrians', '\.jpg', true);
nonpaths = dir_filenames('data/samples/test/nonpedestrians', '\.jpg', true);

paths = [pedpaths nonpaths];
expected = [ones(size(pedpaths,2),1) ; -1*ones(size(nonpaths,2),1)];

t = -100;

for i = 1:size(paths,2)
  image = double(imread(paths{i}));
  if strcmpi(edge_method, 'sobel')
		edge = sobel(image); % scale(sobel(image)) * 255;
	elseif strcmpi(edge_method, 'canny')
		edge = canny(image);
	else
		error('Invalid edge method.');
	end

  image = reshape(image,numel(image),1);
  edge = reshape(edge,numel(edge),1);

  dgp = reconstruction_error(image,Pgpx,mngp);
  dep = reconstruction_error(edge,Pepx,mnep);
  dgn = reconstruction_error(image,Pgnx,mngn);
  den = reconstruction_error(edge,Penx,mnen);

  dt = dgn + den - dgp - dep;

  if (dt >= t && expected(i) < 0) || (dt < t && expected(i) > 0)
    disp(paths{i});
  end
end