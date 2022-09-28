function [theta1, theta2] = bisector_bestangle(Cd,V0)
%2nd Attempt at Bisector Bestangle using a different approach
theta = bisector_maxdist(Cd,V0); %theta is the launch angle of max dist for a pair of Cd & V0. This has to be able to change with varying values of Cd & V0

%It is certain that their will be two angles that will provide
%exactly 90m, one greater than theta and one lower than theta (since the
%graph of sx increase till it reaches theta (therefore max possible
%dist)and will decrease after that.

start1 = 0; finish1 = theta; start2 = theta; finish2 = 90;

i = 1;
%First, Finding launch angle that reaches 90m between 0 degrees and theta
%(angle of max dist)
while i == 1
    mid1 = (start1 + finish1)/2;
    yl = ballistic(start1,V0,Cd,0.145,42,0.001,0);
    yr = ballistic(finish1,V0,Cd,0.145,42,0.001,0);
    ym = ballistic(mid1,V0,Cd,0.145,42,0.001,0);
    if abs(ym - 90) < 0.05
        break
    end
    if (90 - yl) > (yr - 90)
        start1 = start1 + 0.5*(mid1 - start1);
    elseif (90 - yl) < (yr - 90)
        finish1 = finish1 - 0.5*(finish1 - mid1);
    end
end
%Now Using Bisector to find the launch angle that reaches 90m between theta
%(angle max dist) and 90 degree
while i == 1
    mid2 = (start2 + finish2)/2;
    yl = ballistic(start2,V0,Cd,0.145,42,0.001,0);
    yr = ballistic(finish2,V0,Cd,0.145,42,0.001,0);
    ym = ballistic(mid2,V0,Cd,0.145,42,0.001,0);
    if abs(ym - 90) < 0.05
        break
    end
    if (90 - yr) > (yl - 90)
        finish2 = finish2 - 0.5*(finish2 - mid2);
    elseif (90 - yr) < (yl - 90)
        start2 = start2 + 0.5*(mid2 - start2);
    end
end
theta1 = mid1; theta2 = mid2;
disp(theta1);disp(theta2);