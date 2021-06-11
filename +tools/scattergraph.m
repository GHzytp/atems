
% SCATTERGRAPH      Draws a scatter plot comparing dp and dp_manual of all
%                   .mat files in a folder, with error bars.
% Author:           Darwin Zhu, 2021-06-09

%=========================================================================%

function [] = scattergraph()
% Run load_all to compile all case files into struct h.
h = tools.load_all();
len = size(h);

dp = [];
dp_manual = [];
dp_std = [];

% Iterate over struct h and compile values into dp, dp_manual, and dp_std.
for i = 1:max(len(1),len(2))
    h_val = h(i).value;
    h_val_size = size(h_val);
    for j = 1:h_val_size(2)
        dp(end+1) = h_val(j).dp;
        dp_manual(end+1) = h_val(j).dp_manual;
        dp_std(end+1) = h_val(j).dp_std;
    end
end

% Create an errorbar plot. 
errorbar(dp, dp_manual, dp_std,'vertical', 'ko');
xlabel('PCM median dp');
ylabel('Manual median dp');
hold on;

% Plot 1:1 expected line in red
maxaxis = max(max(dp), max(dp_manual));
plot([0,maxaxis],[0,maxaxis], 'r-');

% Plot best fit line in blue
p = polyfit(dp, dp_manual,1);
y1 = polyval(p, dp);
plot(dp, y1, 'b-');
hold off;

end