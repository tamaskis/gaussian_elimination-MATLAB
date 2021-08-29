# `gaussian_elimination` [![View Gaussian Elimination (gaussian_elimination) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/89306-gaussian-elimination-gaussian_elimination)

Solves the linear system <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{A}\mathbf{x}=\mathbf{b}" title="\mathbf{A}\mathbf{x}=\mathbf{b}" /> for <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="\mathbf{x}" /> using Gaussian elimination with partial pivoting.


## Syntax

`x = gaussian_elimination(A,b)`


## Description
`x = gaussian_elimination(A,b)` solves the linear system <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{A}\mathbf{x}=\mathbf{b}" title="\mathbf{A}\mathbf{x}=\mathbf{b}" /> for <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}\in\mathbb{R}^{n}" title="\mathbf{x}\in\mathbb{R}^{n}" />, where <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{A}\in\mathbb{R}^{n\times&space;n}" title="\mathbf{A}\in\mathbb{R}^{n\times n}" /> and <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{b}\in\mathbb{R}^{n}" title="\mathbf{b}\in\mathbb{R}^{n}" />.

**NOTE:** This function is intended as a demonstration of gaussian elimination. The "`\`" and "`/`" operators (or equivalently the "`mldivide`" and "`mrdivide`" functions) should still be used in practice when solving linear systems.


## Examples and Additional Documentation

   - See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   - See [Gaussian_Elimination.pdf](https://tamaskis.github.io/documentation/Gaussian_Elimination.pdf) (also included with download) for additional documentation.
