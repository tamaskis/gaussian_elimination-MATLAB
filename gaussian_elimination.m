%==========================================================================
%
% gaussian_elimination  Solves the linear system Ax=b for x using Gaussian
% elimination with partial pivoting.
%
%   x = gaussian_elimination(A,b)
%
% See also \, mldivide, /, mrdivide, inv, tridiagonal.
%
% Copyright © 2021 Tamas Kis
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-07-15.
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/89306-gaussian-elimination-gaussian_elimination
% GitHub: https://github.com/tamaskis/gaussian_elimination-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   A       - (n×n) matrix
%   b       - (n×1) vector
%
% -------
% OUTPUT:
% -------
%   x       - (n×1) solution of the linear system Ax=b
%
% -----
% NOTE:
% -----
%   --> This function is meant to illustrate Gaussian elimination with
%       partial pivoting. The "\" and "/" operators (or equivalently the
%       "mldivide" and "mrdivide" functions) should still be used in
%       practice when solving linear systems.
%
%==========================================================================
function x = gaussian_elimination(A,b)
    
    % determines n
    n = size(A,1);
    
    % creates augmented matrix
    A = [A,b];
    
    % keeps track if matrix is singular
    singular = false;
    
    % elimination process
    for i = 1:(n-1)
        
        % determines pivot row
        p = i:1:n;
        p(A(p,i)==0) = [];
        p = min(p);
        
        % if all possible pivots in the column are zero (to machine 
        % precision), the matrix is singular, and the loop is exited
        if max(abs(A(:,i))) <= eps
            singular = true;
            break
        end
        
        % if p does not equal i, switches the ith and pth rows
        if p ~= i
            Ai = A(i,:);
            Ap = A(p,:);
            A(i,:) = Ap;
            A(p,:) = Ai;
        end
        
        % elementary row operation
        for j = (i+1):n
            A(j,:) = A(j,:)-(A(j,i)/A(i,i))*A(i,:);
        end
        
    end
    
    % if bottom right element of A is 0 (to machine precision), then its 
    % entire row is 0, and A is singular
    if abs(A(n,n)) <= eps
        singular = true;
    end
    
    % preallocates solution vector
    x = zeros(n,1);
    
    % performs backward substitution to solve Ax = b if matrix nonsingular
    if ~singular
        x(n) = A(n,n+1)/A(n,n);
        for i = (n-1):(-1):1
            S = 0;
            for j = (i+1):n
                S = S+A(i,j)*x(j);
            end
            x(i) = (A(i,n+1)-S)/A(i,i);
        end
    end
    
    % prints warning if matrix is singular
    if singular
        warning("Matrix is singular to working precision.")
    end
    
end