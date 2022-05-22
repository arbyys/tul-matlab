clear;
clc;
close all;

KMH_TO_MS = 5/18;
input = load("data/velocity.mat", '-ascii');
time = input(1, :);
speed = input(2, :);
a = [];
z = [];
zy = [];

for i=1:size(time,2)
    if(i == 1) % dopředná diference - začátek
        h = abs(time(i) - time(i+1));
        a(end + 1) = (KMH_TO_MS * speed(i+1) - KMH_TO_MS * speed(i))/(h);
    elseif(i == size(time,2)) % zpětná diference - konec
        h = abs(time(i-1) - time(i));
        a(end + 1) = (KMH_TO_MS * speed(i) - KMH_TO_MS * speed(i-1))/(h);
    else % centrální diference - všude jinde
        hprev = time(i) - time(i-1);
        hnext = time(i+1) - time(i);
        h = hprev + hnext;
        a(end + 1) = (KMH_TO_MS * speed(i+1) - KMH_TO_MS * speed(i-1))/(h);
    end
end

for i=1:size(a,2)
    if(i == 1 || i == size(a,2))
        continue
    end
    if((a(i) < 0 && a(i+1) > 0) || (a(i) > 0 && a(i+1) < 0))
        between = (time(i) + time(i+1)) / 2;
        z(end+1) = between;
        zy(end+1) = speed(i);
    end
end


yyaxis left
plot(time, speed)

hold on;
plot(z,zy,'o','MarkerSize',8);

yyaxis right
plot(time, a)

saveas(gcf,'graph_acceleration.png');