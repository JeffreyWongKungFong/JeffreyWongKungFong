%CIV2300 OPEN CHANNEL HYDRAULICS 
%Backwater Calculation Coursework
clc; clear all;


%Channel Dimensions (Trapezoidal) - before Section
b = 20; %in m
%Bed Slope and Side Slope
i = 0.0001; m = 2.5;
%Bed Roughness
n = 0.0225;

Q = 160; %in m^3/s
g = 9.81;


%QUESTION - Find Distance to Section when Water Depth is 5.8m
depth1 = 6.0;
depth2 = 5.0;
interval = 0.001;

%CALCULATIONS
counter = 0;

for h1 = depth1:-interval:depth2
counter = counter + 1;
h2 = h1 - interval;
A1 = (b+m*h1)*h1;
V1 = Q/A1;
E1 = h1+(V1^2)/(2*g);

A2 = (b+m*h2)*h2;
V2 = Q/A2;
E2 = h2+(V2^2)/(2*g);

x1 = b+(2*h1)*(1+m^2)^0.5; x2 = b+(2*h2)*(1+m^2)^0.5;
R1 = A1/x1;
R2 = A2/x2;

C1 = (R1^(1/6))/n;
C2 = (R2^(1/6))/n;

MeanV = (V1+V2)/2; MeanR = (R1+R2)/2; MeanC = (C1+C2)/2;

MeanJ = (MeanV^2)/((MeanC^2)*MeanR);

s = (E1-E2)/(MeanJ-i);


%STORAGE OF CALCULATED VALUES IN A TABLE

if counter == 1
CalculationTable(1,1) = counter;
CalculationTable(1,2) = h1;
CalculationTable(1,3) = A1;
CalculationTable(1,4) = x1;
CalculationTable(1,5) = R1;
CalculationTable(1,6) = C1;
CalculationTable(1,7) = V1;
CalculationTable(1,8) = E1;
CalculationTable(1,9) = nan;
CalculationTable(1,10) = nan;
CalculationTable(1,11) = nan;
CalculationTable(1,12) = nan;
CalculationTable(1,13) = nan;
CalculationTable(1,14) = nan;
CalculationTable(1,15) = 0;
end
CalculationTable(counter+1,1) = counter+1;
CalculationTable(counter+1,2) = h2;
CalculationTable(counter+1,3) = A2;
CalculationTable(counter+1,4) = x2;
CalculationTable(counter+1,5) = R2;
CalculationTable(counter+1,6) = C2;
CalculationTable(counter+1,7) = V2;
CalculationTable(counter+1,8) = E2;
CalculationTable(counter+1,9) = E1-E2;
CalculationTable(counter+1,10) = MeanV;
CalculationTable(counter+1,11) = MeanR;
CalculationTable(counter+1,12) = MeanC;
CalculationTable(counter+1,13) = MeanJ;
CalculationTable(counter+1,14) = s;
CalculationTable(counter+1,15) = CalculationTable(counter,15)+s;

%IMPORTANT NOTE: Always dismiss last row! (Only valid for use in calculation)

end


%PLOTTING ON GRAPH

grid on
plot(-CalculationTable((1:counter),15),CalculationTable((1:counter),2));
xlabel('Distance (m)')
ylabel('Depth (m)')
sgtitle('Backwater Surface Profile')