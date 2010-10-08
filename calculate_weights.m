load_paths;

load_pcs;
load_train_samples;
calculate_errors;

fitness = @(individual)error_fitness_function(individual, ...
 											  pgp_ped_errors, pep_ped_errors, pgn_ped_errors, pen_ped_errors, ...
 											  pgp_non_errors, pep_non_errors, pgn_non_errors, pen_non_errors);

disp('Running GA...');
array_weights = ga(fitness, 4);
weights.pgp = array_weights(3);
weights.pep = array_weights(4);
weights.pgn = array_weights(1);
weights.pen = array_weights(2);
weights
clear array_weights;

disp('Saving weights...');
save(sprintf('data/%s/weights.mat', edge_method), 'weights');