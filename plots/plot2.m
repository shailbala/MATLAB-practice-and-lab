if verLessThan('matlab', '9.1')
    error('heatmap is available in R2016 or newer')
end
% Load bike ride summary in variable byDate
load RideSummary byDate
% plot the mean bike ride duration versus date
plot(byDate.Date, byDate.MeanDuration)
% Change limits and date format
limits = [datetime(2012, 7, 1) datetime(2012,8,31)];
xlim(limits)

% handle to fetch properties about the axes
%>> help axis
ax = gca;
% tick label properties
% specifying date format
ax.XAxis.TickLabelFormat = 'MMMM dd';
% different angles, try 45
ax.XAxis.TickLabelRotation = 45;

% Add labels and title
xlabel('Date');
ylabel('Mean Ride Duration');
title('Mean Ride Duration between July and August 2012');
