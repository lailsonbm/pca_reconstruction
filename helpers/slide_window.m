function [windows, results] = slide_window(image, edge, window_function)
% SLIDE_WINDOW Slides a window of 45x105 pixels along image and pass it to window_function.
% The window_function must accept (slice, edge, x, y, count).
% 

[width, height] = size(image);

window_width = 45;
window_height = 105;
step = 4;
count = 0;

nwindows = ceil((width-window_height)/step*(height-window_width)/step);
windows = zeros([nwindows 2]);
results = cell([nwindows 1]);

for x=1:step:(height - window_width)
	for y=1:step:(width - window_height)
		count = count + 1;
		windows(count,:) = [y x];

		slice_image = double(image(y:(y+window_height-1), x:(x+window_width-1)));
		slice_edge = double(edge(y:(y+window_height-1), x:(x+window_width-1)));
		results{count} = window_function(reshape(slice_image, numel(slice_image), 1), reshape(slice_edge, numel(slice_edge), 1), y, x, count);
	end
end
	
end