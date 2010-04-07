load_paths;
load_pcs;

clear_errors;

reset_weights;
calculate_errors;

%%

disp('Generating positive partial correlation chart...')
plot_error_correlation(pgp_ped_errors, pep_ped_errors, pgp_non_errors, pep_non_errors, ...
	'Positive Partial Error Correlation', 'data/charts/error_correlation_positive.pdf');
close;
	
disp('Generating negative correlation chart...')
plot_error_correlation(pgn_ped_errors, pen_ped_errors, pgn_non_errors, pen_non_errors, ...
	'Negative Partial Error Correlation', 'data/charts/error_correlation_negative.pdf');
close;

disp('Generating total correlation chart...');
plot_error_correlation(gray_ped_errors, edge_ped_errors, gray_non_errors, edge_non_errors, ...
	'Total Error Correlation', 'data/charts/error_correlation_total.pdf');
close;

%%

load_weights;
calculate_errors;

disp('Generating weighted total correlation chart...');
plot_error_correlation(gray_ped_errors, edge_ped_errors, gray_non_errors, edge_non_errors, ...
	'Weighted Total Error Correlation', 'data/charts/error_correlation_total_weighted.pdf');
close;