function [PC,V] = pca(data)
% PCA Perform PCA using covariance using only REAL values (both for PC and V).
%      data - MxN matrix of input data
%             (M dimensions, N samples)
%        PC - MxN matrix with principal components
%             (each column is a component)
%         V - Mx1 matrix of eigenvalues sorted ascending
% Based on John Shlens code (http://www.snl.salk.edu/~shlens/pub/code/pca.zip)

[M,N] = size(data);

% subtract off the mean for each dimension
mn = mean(data,2);
data = data - repmat(mn,1,N);

covariance = 1 / (N-1) * data * data';
[PC,V] = eig(covariance);

V = real(diag(V));
[dc,rindices] = sort(-1*V);
V = V(rindices);
PC = real(PC(:,rindices));
end