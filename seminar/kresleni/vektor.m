function Y=vektor(x)
    ro=sqrt(x(1)^2+x(2)^2);
    fi = atan(x(1)/x(2));
    if ro == 0
        fi = 0;
    else
        fi = atan(x(1)/x(2));
    end

    if x(1) < 0
        fi = fi + pi;
    end
    Y=vektorrofi(ro,fi);
end

%% zobraz(vektor[1;5])

%% číslo podmíněnosti=lambamax/lambdamin %% v abs hodnotě, spočítá jak daleko je od singulární matice

%% zobraz(vektor(F*[1;-1]))