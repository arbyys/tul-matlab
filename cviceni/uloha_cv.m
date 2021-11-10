clc; 
clear all;
close all; 
echo off;

key = 'matlab';
text = 'AHOJJAJSEMTVUJSUPERPOMOCNIK';

keyNums = double(key);
keySorted = zeros(1, length(key));
[c, cisla] = sort(keyNums);

text = pad(text, length(text) + mod(length(text), length(key)));
cipher = reshape(text, length(key),[]);
cipher = cipher(cisla,:).';
convertCharsToStrings(cipher)