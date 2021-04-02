% gaussian_elimination  Solves the linear system Ax=b for x using Gaussian
% elimination with partial pivoting.
%
%   x = gaussian_elimination(A,b) solves the linear system Ax=b for x (an
%   n-by-1 vector), where A is an n-by-n matrix and b is an n-by-1 vector.
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/89306-gaussian-elimination-gaussian_elimination
% GitHub: https://github.com/tamaskis/gaussian_elimination-MATLAB
%
% See "DOCUMENTATION.pdf" for additional documentation and examples. 
% Examples can also be found in EXAMPLES.m. Both of these files are 
% included with the download.
%
% Copyright (c) 2021 Tamas Kis
% Last Update: 2021-04-01



%% FUNCTION

% INPUT(S): A - n-by-n matrix
%           b - n-by-1 vector
% OUTPUT(S): x - solution of linear system (n-by-1 vector)
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
    
    % prints error if matrix is singular
    if singular
        warning("Matrix is singular to working precision.")
    end
    
end