clf;
clc;
clear;

data = readtable('insurance.csv');
smokers = data(strcmp(data.smoker, 'yes'), :);
nonsmokers = data(strcmp(data.smoker, 'no'), :);

[k_age_smokers, q_age_smokers] = lin_regression(smokers.age, smokers.charges);
[k_age_nonsmokers, q_age_nonsmokers] = lin_regression(nonsmokers.age, nonsmokers.charges);

[k_bmi_smokers, q_bmi_smokers] = lin_regression(smokers.bmi, smokers.charges);
[k_bmi_nonsmokers, q_bmi_nonsmokers] = lin_regression(nonsmokers.bmi, nonsmokers.charges);


hold on;
legend();
scatter(smokers.age, smokers.charges, 34, "red", "DisplayName", "smokers");
fplot(@(x) k_age_smokers * x + q_age_smokers, [min(smokers.age) max(smokers.age)], "DisplayName", "Trend - smokers");
scatter(nonsmokers.age, nonsmokers.charges, 34, "blue", "DisplayName", "nonsmokers");
fplot(@(x) k_age_nonsmokers * x + q_age_nonsmokers, [min(nonsmokers.age) max(nonsmokers.age)], "DisplayName", "Trend - non smokers");
xlabel("age");
ylabel('charges');
saveas(gcf, "graph_age.png");

clf(gcf);

hold on;
legend();
scatter(smokers.bmi, smokers.charges, 34, "red", "DisplayName", "smokers");
fplot(@(x) k_bmi_smokers * x + q_bmi_smokers, [min(smokers.bmi) max(smokers.bmi)], "DisplayName", "Trend - smokers");
scatter(nonsmokers.bmi, nonsmokers.charges, 34, "blue", "DisplayName", "nonsmokers");
fplot(@(x) k_bmi_nonsmokers * x + q_bmi_nonsmokers, [min(nonsmokers.bmi) max(nonsmokers.bmi)], "DisplayName", "Trend - non smokers");
xlabel("bmi");
ylabel('charges');
saveas(gcf, "graph_bmi.png");

function [k,q] = lin_regression(x,y)
    if (isrow(y))
        y = y'; 
    end
    if (isrow(x)) 
        x = x';
    end
    
    k = (prod(size(x)) * sum(x .* y) - sum(x) * sum(y)) / (prod(size(x)) * sum(x.^2) - (sum(x)^2)); 
    q = (sum(x.^2) * sum(y) - sum(x) * sum(x .* y)) / (prod(size(x)) * sum(x.^2) - (sum(x)^2)); 
end