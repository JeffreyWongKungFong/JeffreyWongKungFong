%CIV2300 Pipes and Open Channel Hydraulics - Individual Coursework
%Reg.No: 180169531

%PART 4

rho = 998; mu = 1e-3; AbsRough = 0.01; g = 9.81; HL = 131; 

Coord = [0, 135; 6000, 105; 8000, 120; 19000, 27.5; 23000, 77.5; 60000, 55; 66000, 0; 70000, 30; 77000, 60; 79000, 5; 84000, 6];

for n = 1:10
PipeLength(n,1) = (((Coord(n+1,1)-Coord(n,1))^2)+ ((Coord(n+1,2)-Coord(n,2))^2))^0.5;
end

PipeSize = [0.500; 0.560; 0.600; 0.630];

%Pipe Design

counter = 0;

for a = 1:4
D1(1,1) = PipeSize(a,1);
for b = 1:4
D2(1,1) = PipeSize(b,1);
for c = 1:4
D3(1,1) = PipeSize(c,1);
for d = 1:4
D4(1,1) = PipeSize(d,1);
for e = 1:4
D5(1,1) = PipeSize(e,1);
for f = 1:4
D6(1,1) = PipeSize(f,1);
for g = 1:4
D7(1,1) = PipeSize(g,1);
for h = 1:4
D8(1,1) = PipeSize(h,1);
for i = 1:4
D9(1,1) = PipeSize(i,1);
for j = 1:4
D10(1,1) = PipeSize(j,1);

counter = counter + 1; disp(counter)

Diameter = [D1(1,1); D2(1,1); D3(1,1); D4(1,1); D5(1,1); D6(1,1); D7(1,1); D8(1,1); D9(1,1); D10(1,1)]; %guesses
for n = 1:10
Area(n,1) = pi*((Diameter(n,1)/2)^2);
EffRoughness(n,1) = AbsRough/(Diameter(n,1)*1000);
end

for n = 1:9
RatioArea(n,1) = Area(n+1,1)/Area(1,1); %A2/A1, A3/A1, A4/A1... A7/A1
end

for n = 1:9
RatioRe(n,1) = RatioArea(n,1)*Diameter(n+1)/Diameter(1); %Re2/Re1, Re3/Re1, Re4/Re1...    
end

%Iteration
Re1 = 8e8; FricFact1 = (1/(-2*log10((EffRoughness(1,1)/3.7)+(5.74/(Re1^0.9)))))^0.5;

for n = 1:10 %10 iteration is more than enough (Re stops changing at about 7)
Re2 = RatioRe(1,1)*Re1;
FricFact2 = (1/(-2*log10((EffRoughness(2,1)/3.7)+(5.74/(Re2^0.9)))))^0.5;
Re3 = RatioRe(2,1)*Re1;
FricFact3 = (1/(-2*log10((EffRoughness(3,1)/3.7)+(5.74/(Re3^0.9)))))^0.5;
Re4 = RatioRe(3,1)*Re1;
FricFact4 = (1/(-2*log10((EffRoughness(4,1)/3.7)+(5.74/(Re4^0.9)))))^0.5;
Re5 = RatioRe(4,1)*Re1;
FricFact5 = (1/(-2*log10((EffRoughness(5,1)/3.7)+(5.74/(Re5^0.9)))))^0.5;
Re6 = RatioRe(5,1)*Re1;
FricFact6 = (1/(-2*log10((EffRoughness(6,1)/3.7)+(5.74/(Re6^0.9)))))^0.5;
Re7 = RatioRe(6,1)*Re1;
FricFact7 = (1/(-2*log10((EffRoughness(7,1)/3.7)+(5.74/(Re7^0.9)))))^0.5;
Re8 = RatioRe(7,1)*Re1;
FricFact8 = (1/(-2*log10((EffRoughness(8,1)/3.7)+(5.74/(Re8^0.9)))))^0.5;
Re9 = RatioRe(8,1)*Re1;
FricFact9 = (1/(-2*log10((EffRoughness(9,1)/3.7)+(5.74/(Re9^0.9)))))^0.5;
Re10 = RatioRe(9,1)*Re1;
FricFact10 = (1/(-2*log10((EffRoughness(10,1)/3.7)+(5.74/(Re10^0.9)))))^0.5;

V1 = HL/(((FricFact1*PipeLength(1,1))/(Diameter(1,1)*2*g)) + ((FricFact2*PipeLength(2,1)*((Area(1,1)/Area(2,1))^2))/(Diameter(2,1)*2*g)) + ((FricFact3*PipeLength(3,1)*((Area(1,1)/Area(3,1))^2))/(Diameter(3,1)*2*g)) + ((FricFact4*PipeLength(4,1)*((Area(1,1)/Area(4,1))^2))/(Diameter(4,1)*2*g)) + ((FricFact5*PipeLength(5,1)*((Area(1,1)/Area(5,1))^2))/(Diameter(5,1)*2*g)) + ((FricFact6*PipeLength(6,1)*((Area(1,1)/Area(6,1))^2))/(Diameter(6,1)*2*g)) + ((FricFact7*PipeLength(7,1)*((Area(1,1)/Area(7,1))^2))/(Diameter(7,1)*2*g)) + ((FricFact8*PipeLength(8,1)*((Area(1,1)/Area(8,1))^2))/(Diameter(8,1)*2*g)) + ((FricFact9*PipeLength(9,1)*((Area(1,1)/Area(9,1))^2))/(Diameter(9,1)*2*g)) + ((FricFact10*PipeLength(10,1)*((Area(1,1)/Area(10,1))^2))/(Diameter(10,1)*2*g)));

Re1 = rho*V1*g/mu;
FricFact1 = (1/(-2*log10((EffRoughness(1,1)/3.7)+(5.74/(Re1^0.9)))))^0.5;
end

V2 = V1*Area(1,1)/Area(2,1); V3 = V1*Area(1,1)/Area(3,1); V4 = V1*Area(1,1)/Area(4,1); V5 = V1*Area(1,1)/Area(5,1); V6 = V1*Area(1,1)/Area(6,1); V7 = V1*Area(1,1)/Area(7,1);  V8 = V1*Area(1,1)/Area(8,1); V9 = V1*Area(1,1)/Area(9,1); V10 = V1*Area(1,1)/Area(10,1);
Q = V1*Area(1,1); %in m^3/second

%Finding Pipe Pressure - Energy Line and HGL (Minor Losses) (8 Pts, 7 Pipe)
HA = 139; HB = 8;
H1 = HA - (0.5*(V1^2)/(2*g));
H2 = H1 - (((1 - (Area(1,1)/Area(2,1)))^2)*(V1^2)/(2*g)) - (FricFact1*PipeLength(1,1)*(V1^2)/(Diameter(1,1)*2*g));
H3 = H2 - (((1 - (Area(2,1)/Area(3,1)))^2)*(V2^2)/(2*g)) - (FricFact2*PipeLength(2,1)*(V2^2)/(Diameter(2,1)*2*g));
H4 = H3 - (((1 - (Area(3,1)/Area(4,1)))^2)*(V3^2)/(2*g)) - (FricFact3*PipeLength(3,1)*(V3^2)/(Diameter(3,1)*2*g));
H5 = H4 - (((1 - (Area(4,1)/Area(5,1)))^2)*(V4^2)/(2*g)) - (FricFact4*PipeLength(4,1)*(V4^2)/(Diameter(4,1)*2*g));
H6 = H5 - (((1 - (Area(5,1)/Area(6,1)))^2)*(V5^2)/(2*g)) - (FricFact5*PipeLength(5,1)*(V5^2)/(Diameter(5,1)*2*g));
H7 = H6 - (((1 - (Area(6,1)/Area(7,1)))^2)*(V6^2)/(2*g)) - (FricFact6*PipeLength(6,1)*(V6^2)/(Diameter(6,1)*2*g));
H8 = H7 - (((1 - (Area(7,1)/Area(8,1)))^2)*(V7^2)/(2*g)) - (FricFact7*PipeLength(7,1)*(V7^2)/(Diameter(7,1)*2*g));
H9 = H8 - (((1 - (Area(8,1)/Area(9,1)))^2)*(V8^2)/(2*g)) - (FricFact8*PipeLength(8,1)*(V8^2)/(Diameter(8,1)*2*g));
H10 = H9 - (((1 - (Area(9,1)/Area(10,1)))^2)*(V9^2)/(2*g)) - (FricFact9*PipeLength(9,1)*(V9^2)/(Diameter(9,1)*2*g));
H11 = H10 - ((V10^2)/(2*g)) - (FricFact10*PipeLength(10,1)*(V10^2)/(Diameter(10,1)*2*g));

P1 = H1 - Coord(1,2);
P2 = (H2 - Coord(2,2) - ((V1^2)/(2*g)))*rho*g;
P3 = (H3 - Coord(3,2) - ((V2^2)/(2*g)))*rho*g;
P4 = (H4 - Coord(4,2) - ((V3^2)/(2*g)))*rho*g;
P5 = (H5 - Coord(5,2) - ((V4^2)/(2*g)))*rho*g;
P6 = (H6 - Coord(6,2) - ((V5^2)/(2*g)))*rho*g;
P7 = (H7 - Coord(7,2) - ((V6^2)/(2*g)))*rho*g;
P8 = (H8 - Coord(8,2) - ((V7^2)/(2*g)))*rho*g;
P9 = (H9 - Coord(9,2) - ((V8^2)/(2*g)))*rho*g;
P10 = (H10 - Coord(10,2) - ((V9^2)/(2*g)))*rho*g;
P11 = (H11 - Coord(11,2) - ((V10^2)/(2*g)))*rho*g;

if (P1 < 1e6) && (P2 < 1e6) && (P3 <1e6) && (P4 < 1e6) && (P5 < 1e6) && (P6 < 1e6) && (P7 < 1e6) && (P8 < 1e6) && (P9 < 1e6) && (P10 < 1e6) && (P11 < 1e6)

%Storing Pipe Diameter Combination
DesignTab(counter,1) = D1;
DesignTab(counter,2) = D2;
DesignTab(counter,3) = D3;
DesignTab(counter,4) = D4;
DesignTab(counter,5) = D5;
DesignTab(counter,6) = D6;
DesignTab(counter,7) = D7;
DesignTab(counter,8) = D8;
DesignTab(counter,9) = D9;
DesignTab(counter,10) = D10;

%Storing Pipe Pressure (Entrance and Exit Pressure Accounted)
DesignTab(counter,11) = P1;
DesignTab(counter,12) = P2;
DesignTab(counter,13) = P3;
DesignTab(counter,14) = P4;
DesignTab(counter,15) = P5;
DesignTab(counter,16) = P6;
DesignTab(counter,17) = P7;
DesignTab(counter,18) = P8;
DesignTab(counter,19) = P9;
DesignTab(counter,20) = P10;
DesignTab(counter,21) = P11;

DesignTab(counter,22) = Q;
end

end
end
end
end
end
end
end
end
end
end

Qmax = max(DesignTab(:,22));
x = find(DesignTab(:,22) == Qmax); %gives location of Qmax in matrix