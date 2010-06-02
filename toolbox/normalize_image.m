function [normalized] = normalize_image(image, range)
  min_val = min(min(image));
  max_val = max(max(image));
  
  normalized = ((image-min_val)/(max_val-min_val) + range(1)) * (range(2) - range(1));
end