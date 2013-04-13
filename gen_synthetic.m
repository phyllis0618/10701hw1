function [Y,X,w] = gen_synthetic(n,p,rho,sigma)
%GEN_SYNTHETIC generate synthetic data
% [Y,X,w] = GEN_SYNTHETIC(n,p,rho,sigma), generates data as
%
%      Y = f ( X * w + epsilon ), 
%
% where f(u) = 1 if u >= 0; -1 otherwise, epsilon is  
% the Gaussian noise with 0 mean and sigma variance 
%
% the covariance matrix of X is defined as C_{ij} = rho^|i-j|,
% rho controls the correlations between features
%
% n      - number of samples
% p      - number of features
% rho    - value between [0 1]
% sigma  - non-negative value

% for any questions, please email muli@cs.cmu.edu

% check something

assert(nargin==4, 'error in number of argin, see: help gen_synthetic')
if rho < 0, rho = 0; end
if rho > 1-1e-8, rho = 1-1e-8; end 

% generate data

e = abs(bsxfun(@minus, (1:p)', 1:p));
C = rho.^e;  % covariance matrix 

X0 = randn(n,p);
A = chol(X0'*X0);
B = chol(C);
X = X0*(A\B);

%isequal(X'*X, C);

% w = randn(p,1);
% w = ones(p,1);
w = rand(p,1) -0.5;

Y0 = X * w + normrnd(0,sigma,n,1);
Y = ones(n,1);
Y(Y0<0) = -1;

end