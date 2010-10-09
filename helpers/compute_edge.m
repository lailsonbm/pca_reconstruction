function edge = compute_edge(image, edge_method)

if strcmpi(edge_method, 'sobel')
	edge = sobel(image); % scale(sobel(image)) * 255;
elseif strcmpi(edge_method, 'canny')
	edge = canny(image);
else
	error('Invalid edge method.');
end

end