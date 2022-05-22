clear;
clc;
close all;

%[y,M] = find_int_roots([1,-3,3,-1])
[y,M] = find_int_roots([-2,-1,18,9])
%[y,M] = find_int_roots([1 -4 -7 22 24])

function [x, M] = find_int_roots(p)
    possible_roots = [];

    absolute_divisors = divisors(p(end));
    highest_coef = p(1);
    for i=1:size(absolute_divisors,2)
        possible_roots(end+1) = absolute_divisors(i) / highest_coef;
        possible_roots(end+1) = -absolute_divisors(i) / -highest_coef;
        possible_roots(end+1) = absolute_divisors(i) / -highest_coef;
        possible_roots(end+1) = -absolute_divisors(i) / highest_coef;
    end
    possible_roots = unique(possible_roots);

    if(size(p,2) == 1)
        x = [];
        M = [];
        return;
    end;

    x = [];
    M = [p];
    i = 1;
    while i <= size(possible_roots,2);

        if(size(p,2) == 1)
            return
        end
        current_root = possible_roots(i);
        current_array = [p(1)];

        for j=1:size(p,2)
            num = current_root * current_array(j) + p(j+1);
            current_array(end+1) = num;
            if(j == size(p,2)-1)
                break;
            end
        end

        i=i+1;
        if(current_array(end) == 0)
            if(fix(current_root) == current_root)
                x = [x; current_root];
            end
            current_array(end) = [];
            M = [M; [zeros(1,size(M,2)-size(current_array,2)), current_array]];
            p = current_array;
            absolute_divisors = divisors(p(end));
            possible_roots = [];
            highest_coef = p(1);
            for i=1:size(absolute_divisors,2)
                possible_roots(end+1) = absolute_divisors(i) / highest_coef;
                possible_roots(end+1) = -absolute_divisors(i) / -highest_coef;
                possible_roots(end+1) = absolute_divisors(i) / -highest_coef;
                possible_roots(end+1) = -absolute_divisors(i) / highest_coef;
            end
            possible_roots = unique(possible_roots)
            i = 1;
        end
    end
end