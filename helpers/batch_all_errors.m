function [pgp_errors,pep_errors,pgn_errors,pen_errors] = batch_all_errors(images,edges,Pgp,Pep,Pgn,Pen,mngp,mnep,mngn,mnen)

pgp_errors = batch_reconstruction_errors(images, Pgp, mngp);
pep_errors = batch_reconstruction_errors(edges, Pep, mnep);
pgn_errors = batch_reconstruction_errors(images, Pgn, mngn);
pen_errors = batch_reconstruction_errors(edges, Pen, mnen);

end