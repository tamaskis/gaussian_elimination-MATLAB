%% Copyright (c) 2021 Tamas Kis

% Examples for using the gaussian_elimination function.



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% EXAMPLE

% defines matrix A
A = [2,-1, 5;
     1, 1,-3;
     2, 4, 1];
     
% defines vector b
b = [10;
     -2;
      1];

 % solves linear system (i.e. solves Ax=b for x)
 x = gaussian_elimination(A,b)