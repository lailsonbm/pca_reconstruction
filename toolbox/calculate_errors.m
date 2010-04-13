% Calculates reconstructions errors.

load_paths;
load_pcs;
load_test_samples;

if not(exist('pgp_ped_errors','var') && exist('pgp_non_errors','var'))
	disp('Calculating pedestrians errors...');
	[pgp_ped_errors,pep_ped_errors,pgn_ped_errors,pen_ped_errors] = ...
		batch_all_errors(pedgray,pededge,Pgpx,Pepx,Pgnx,Penx,mngp,mnep,mngn,mnen);

	disp('Calculating non-pedestrians errors...');
	[pgp_non_errors,pep_non_errors,pgn_non_errors,pen_non_errors] = ...
		batch_all_errors(nongray,nonedge,Pgpx,Pepx,Pgnx,Penx,mngp,mnep,mngn,mnen);
end

total_ped_errors = weights.pgn*pgn_ped_errors + weights.pen*pen_ped_errors - (weights.pgp*pgp_ped_errors + weights.pep*pep_ped_errors);
total_non_errors = weights.pgn*pgn_non_errors + weights.pen*pen_non_errors - (weights.pgp*pgp_non_errors + weights.pep*pep_non_errors);

gray_ped_errors = weights.pgn*pgn_ped_errors - weights.pgp*pgp_ped_errors;
edge_ped_errors = weights.pen*pen_ped_errors - weights.pep*pep_ped_errors;
gray_non_errors = weights.pgn*pgn_non_errors - weights.pgp*pgp_non_errors;
edge_non_errors = weights.pen*pen_non_errors - weights.pep*pep_non_errors;

pos_ped_errors = weights.pgp*pgp_ped_errors + weights.pep*pep_ped_errors;
neg_ped_errors = weights.pgn*pgn_ped_errors + weights.pen*pen_ped_errors;
pos_non_errors = weights.pgp*pgp_non_errors + weights.pep*pep_non_errors;
neg_non_errors = weights.pgn*pgn_non_errors + weights.pen*pen_non_errors;
