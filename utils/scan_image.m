% Scans image and collect the error of each window.

load_pcs;

total_errors = @(im,ed,x,y,count)[ reconstruction_error(im,Pgpx,mngp) reconstruction_error(ed,Pepx,mnep) ...
								   reconstruction_error(im,Pgnx,mngn) reconstruction_error(ed,Penx,mnen) ];
scales = [0.26 0.3 0.35 0.4 0.47 0.55 0.64 0.74 0.86 1 1.17 1.35];

disp(sprintf('Reading image %s...', image_path));
image = rgb2gray(imread(image_path));

errors_scales = cell([numel(scales) 1]);
windows_scales = cell([numel(scales) 1]);
for s = 1:numel(scales)
	scale = scales(s);
	
	disp(sprintf('Scaling image to %.2f...', scale));
	scaled_image = imresize(image, scale);
	if strcmpi(edge_method, 'sobel')
		scaled_edge = sobel(scaled_image); % scale(sobel(image)) * 255;
	elseif strcmpi(edge_method, 'canny')
		scaled_edge = canny(scaled_image);
	else
		error('Invalid edge method.');
	end
	
	% Scanning image
	[windows,results] = slide_window(scaled_image, scaled_edge, total_errors);

	% Collecting errors
	errors = zeros(numel(results),4);
	for i = 1:numel(results)
		errors(i,:) = results{i};
	end
	errors_scales{s} = errors;
	clear results errors;
	
	windows_scales{s} = windows;
	clear windows;
	
	clear scale scaled_image scaled_edge;
end
clear i s;

[~,~,~,~,groups,~,~] = regexp(image_path, '([A-Za-z0-9-]+)\.\w{3}');
image_name = groups{1}{1};
save(sprintf('data/%s/captures/%s.mat', edge_method, image_name), 'errors_scales', 'windows_scales');

clear image image_name groups;