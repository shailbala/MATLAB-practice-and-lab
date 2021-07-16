
load spectraData masscharge time spectra
% create 3D plot
figure
plot3(masscharge, time, spectra)
box on

% view specifies the angle at which we are going to view
% view(azimuth, elevation)
view(26,42)
axis([500 900 0 22 0 4e8])

% Add title and axis labels
xlabel('Mass/Charge M/Z')
ylabel('Time')
zlabel('Ion Spectra')
title('Extracted Spectra Subset')

