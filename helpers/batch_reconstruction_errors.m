function [errors] = batch_reconstruction_errors(images,PC,mn)

N = size(images,2);
errors = zeros(N,1);
for i = 1:N
	errors(i) = reconstruction_error(images(:,i), PC, mn);
end

end