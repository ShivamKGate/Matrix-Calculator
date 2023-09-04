% HOMEWORK 4: TASK 1
% File: HW7p2_Task1_sinayksp.m
% Date: 27 February 2023
% By: SHIVAM KHARANGATE (sinayksp)
%
% Section: 019
% Team: 279
%
% ELECTRONIC SIGNATURE
% Shivam Kharangate
%
% The electronic signature above indicates the script
% submitted for evaluation is my individual work, and I
% have a general understanding of all aspects of its
% development and execution.
%
% A BRIEF DESCRIPTION OF WHAT THE SCRIPT OR FUNCTION DOES
%

clear; clc;
A_o = input('Enter the order of the matrix: ');
if A_o > 2 && (mod(A_o, 1) == 0)
    A_n = input('Enter the number of arrays to be generated: ');
    N = A_o * (A_o^2 + 1) / 2;  
    semimagic_count = 0;  
    non_semimagic_count = 0;  
    magic_r_count = 0;  
    magic_c_count = 0;  
    magic_a_count = 0; 
    
    for n = 1:A_n  
        P = randperm(A_o^2); 
        X = reshape(P, [A_o, A_o]); 
        r_sums = sum(X, 2);  
        c_sums = sum(X, 1);  
        d1_sum = sum(diag(X));
        d2_sum = sum(diag(flipud(X)));
        if all(r_sums == N) && all(c_sums == N) 
            semimagic_count = semimagic_count + 1;
        end
        if any(r_sums == N)
            magic_r_count = magic_r_count + 1;
        end
        if any(c_sums == N) 
            magic_c_count = magic_c_count + 1;
        end
        if d1_sum == N && d2_sum == N && all(r_sums == N) && all(c_sums == N)
            magic_a_count = magic_a_count + 1;
        end
        X = []; 
    end
    disp(['The number of magic arrays is: ', num2str(magic_a_count)]);
    disp(['The number of semimagic arrays is: ', num2str(semimagic_count)])
    disp(['The number of magic columns is: ', num2str(magic_c_count)]);
    disp(['The number of magic rows is: ', num2str(magic_r_count)]);
else
    fprintf('Error: The number needs to be an integer greater than 2');
end