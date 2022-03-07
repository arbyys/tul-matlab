clear; clc; close all;

mytime = datetime('now');
[h, m, s] = hms(mytime);
minutes = (h * 60) + m + (s / 60);

b = float2bin(minutes, 10);

function b = float2bin(number, dec_length)
    integer = floor(number);
    decimal = number - integer;

    if(integer == 0)
        integerBinaryBits = [0];
    else
        integerBinaryBits = [];
    end

    if(decimal == 0)
        dot = "";
    else
        dot = ".";
    end
    decimalBinaryBits = [];

    remainder = integer;
    while remainder ~= 0
        modulo = mod(remainder, 2);
        integerBinaryBits = [modulo, integerBinaryBits];
        remainder = floor(remainder / 2);
    end

    remainder = decimal;
    for i = 1:dec_length
        remainder = remainder * 2;
        if(remainder < 1)
            decimalBinaryBits(end + 1) = 0;
        else
            decimalBinaryBits(end + 1) = 1;
            remainder = remainder - 1;
        end
    end

    b = char(strcat(sprintf("%i", integerBinaryBits), dot, strip(sprintf("%i", decimalBinaryBits), "right", "0")))
end