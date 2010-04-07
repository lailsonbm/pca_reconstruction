function [dt] = total_reconstruction_error(image,edge,Pgp,Pep,Pgn,Pen,mngp,mnep,mngn,mnen,weights)
% TOTAL_RECONSTRUCTION_ERROR Calculates the overall reconstruction error for image and edge.

dgp = reconstruction_error(image,Pgp,mngp);
dep = reconstruction_error(edge,Pep,mnep);
dgn = reconstruction_error(image,Pgn,mngn);
den = reconstruction_error(edge,Pen,mnen);

dt = weights.pgn*dgn + weights.pen*den - weights.pgp*dgp - weights.pep*dep;

end