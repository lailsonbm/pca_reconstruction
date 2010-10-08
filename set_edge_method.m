if not(exist('edge_method','var'))
  edge_method = 'sobel';
end

data_dir = sprintf('data/%s', edge_method);
if not(exist(data_dir))
  mkdir(data_dir)
end
disp(sprintf('Using %s edge method...', edge_method));