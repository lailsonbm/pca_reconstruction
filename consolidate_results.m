% Combines the errors of all negative images and applies threshold.

load_pcs;

if not(exist('threshold', 'var'))
 error('Please specify a threshold.');
end

tn = 0;
fp = 0;

scores_paths = dir_filenames(sprintf('data/%s/captures', edge_method), '\.mat', true);
for i = 1:numel(scores_paths)
	load(scores_paths{i});	
	disp(sprintf('Processing file %s...', scores_paths{i}));
	
	for i = 1:numel(errors_scales)
		errors = errors_scales{i};
		total_errors = weights.pgn*errors(:,3) + weights.pen*errors(:,4) - weights.pgp*errors(:,1) - weights.pep*errors(:,2);
		fp_scale = numel(find(total_errors >= threshold));
		tn_scale = numel(find(total_errors < threshold));
		
		fp = fp + fp_scale;
		tn = tn + tn_scale;
		
		disp(sprintf('FP/TN at scale %d: %d/%d', i, fp_scale, tn_scale));
		
		clear  errors;
	end
	
	clear errors_scales windows_scales;
	disp(' ');
end

disp('--')
disp(sprintf('TOTAL FP/TN: %d/%d (%.2f)', fp, tn, tn/fp));