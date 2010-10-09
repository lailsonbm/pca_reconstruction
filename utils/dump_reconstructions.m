% Saves all reconstructions on dstpath.

load_paths;
load_pcs;

pedpaths = dir_filenames('data/samples/train/pedestrians', '\.jpg', true);
nonpaths = dir_filenames('data/samples/train/nonpedestrians', '\.jpg', true);

srcpaths = [pedpaths nonpaths];
dstpath = sprintf('data/%s/reconstructions', edge_method);
dstpathfmt = '%s/k=%d/%s/%s_%s.%s'; % dstpath, k, folder, filename, rectype, extension

for i = 1:size(srcpaths,2)
  disp(sprintf('Processing image %s...', srcpaths{i}));
  
  image = double(imread(srcpaths{i}));
  edge = compute_edge(image, edge_method);

  imsize = size(image);
  image = reshape(image,numel(image),1);
  edge = reshape(edge,numel(edge),1);
	
	[~, ~, ~, ~, t, ~, ~] = regexp(srcpaths{i}, '(\w+)/([\w-]+).(\w+)$');
	folder = t{1}{1};
	filename = t{1}{2};
	extension = t{1}{3};
	
  pgp_rec = reconstruct_image(image, Pgpx, mngp);
  pgp_rec = uint8(normalize_image(reshape(pgp_rec, imsize), [0 255]));
  imwrite(pgp_rec, sprintf(dstpathfmt, dstpath, k, folder, filename, 'pgp', extension));
  
  pgn_rec = reconstruct_image(image, Pgnx, mngn);
  pgn_rec = uint8(normalize_image(reshape(pgn_rec, imsize), [0 255]));
  imwrite(pgn_rec, sprintf(dstpathfmt, dstpath, k, folder, filename, 'pgn', extension));
  
  pep_rec = reconstruct_image(edge, Pepx, mnep);
  pep_rec = uint8(normalize_image(reshape(pep_rec, imsize), [0 255]));
  imwrite(pep_rec, sprintf(dstpathfmt, dstpath, k, folder, filename, 'pep', extension));
  
  pen_rec = reconstruct_image(edge, Penx, mnen);
  pen_rec = uint8(normalize_image(reshape(pen_rec, imsize), [0 255]));
  imwrite(pen_rec, sprintf(dstpathfmt, dstpath, k, folder, filename, 'pen', extension));
  
  edge = uint8(normalize_image(reshape(edge, imsize), [0 255]));
  imwrite(edge, sprintf(dstpathfmt, dstpath, k, folder, filename, 'edge', extension));

  clear t;
end