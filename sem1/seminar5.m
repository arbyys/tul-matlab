clear
close all
clc

A = [2,1,0,0;1,2,1,0;0,1,2,1;0,0,1,2]
Q = inv(A) % inverzní matice
b = [3;4;4;3]
x = Q * b