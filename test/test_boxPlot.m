
% Examples

% Example 1: Basic grouped box plot with legend

y = randn(50,3,3);
x = [1 2 3.5];
y(1:25) = NaN;

figure;
h = iosr.statistics.boxPlot(x,y,...
    'symbolColor','k',...
    'medianColor','k',...
    'symbolMarker',{'+','o','d'},...
    'boxcolor',{[1 0 0]; [0 1 0]; [0 0 1]},...
    'groupLabels',{'y1','y2','y3'},...
    'showLegend',true);
box on

% Example 2: Grouped box plot with overlayed data

figure;
iosr.statistics.boxPlot(x,y,...
    'symbolColor','k',...
    'medianColor','k',...
    'symbolMarker',{'+','o','d'},...
    'boxcolor','auto',...
    'showScatter',true);
box on

% Example 3: Grouped box plot with displayed sample sizes
% and variable widths

figure;
iosr.statistics.boxPlot(x,y,...
    'medianColor','k',...
    'symbolMarker',{'+','o','d'},...
    'boxcolor','auto',...
    'sampleSize',true,...
    'scaleWidth',true);
box on

% Example 4: Grouped notched box plot with x separators and
% hierarchical labels

figure;
iosr.statistics.boxPlot({'A','B','C'},y,...
    'notch',true,...
    'medianColor','k',...
    'symbolMarker',{'+','o','d'},...
    'boxcolor','auto',...
    'style','hierarchy',...
    'xSeparator',true,...
    'groupLabels',{{'Group 1','Group 2','Group 3'}});
box on
