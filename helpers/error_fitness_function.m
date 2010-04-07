function [ fitness ] = error_fitness_function( individual, pgp_ped_errors, pep_ped_errors, pgn_ped_errors, pen_ped_errors, pgp_non_errors, pep_non_errors, pgn_non_errors, pen_non_errors )
%GENETIC_ALGORITHM_FITNESS_FUNCTION Evaluates the fitness of a determined
%individual, based on its correctness rate.

reconstruction_error = pgn_ped_errors*individual(1) + pen_ped_errors*individual(2) ...
    - (pgp_ped_errors*individual(3) + pep_ped_errors*individual(4));
pedestrian_errors = numel(find(reconstruction_error < 0));


reconstruction_error = pgn_non_errors*individual(1) + pen_non_errors*individual(2) ...
    - (pgp_non_errors*individual(3) + pep_non_errors*individual(4));
nonpedestrian_errors = numel(find(reconstruction_error >= 0));


fitness = nonpedestrian_errors + pedestrian_errors;

end
