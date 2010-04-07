function [r] = reconstruct_image(image, PC, mn)
% RECONSTRUCT_IMAGE Projects an image into PC space and project them back
% to full space.
r = PC * (PC' * (image - mn)) + mn;
end
