clc; clear all;

%MAS252 - Baseball Coursework - Step 4
counter = 0;
for Cd = 0.4:0.01:0.5
    for V0 = 45:60
    counter = counter + 1;
    disp(counter); %disp(counter) is to know where MatLab has reached
    
    %Calling out bisector_bestangle to get my 2 angles that reaches 90m
    [theta1,theta2] = bisector_bestangle(Cd,V0);
    
    %Storing my values in a matrix
    bestangle(counter,1) = Cd;
    bestangle(counter,2) = V0;
    bestangle(counter,3) = theta1;
    bestangle(counter,4) = theta2;
    end
end

%MAS252 - Baseball Coursework - Step 5
counter2 = 0;
for Cd = 0.4:0.01:0.5
    for V0 = 45:60
        %Putting a counter again
        counter2 = counter2 + 1;
        disp(counter2);
        
        %Calculating Cost to train Players
        CostSpeed(counter2,1) = 25000 + (17*(45 - V0))^2; %Cost to train a player to hit the ball at V0
        CostSpin(counter2,1) = 5000*((20*(0.5 - Cd))^4); %Cost to train a player to apply spin to change Cd
        
        %Weighting Function due to increase chances of scoring a homerun due to range of angle
        for RangeOfTheta = bestangle(counter2,4) - bestangle(counter2,3)
            if RangeOfTheta > 40
                CostAngle = 0.1;
            elseif (10 < RangeOfTheta) && (RangeOfTheta < 40)
                CostAngle = 1 - (0.9*(RangeOfTheta - 10)/30);
            elseif RangeOfTheta < 10
                CostAngle = 1;
            end
        end
        %Calculating Total Cost
        CostTotal(counter2,3) = (CostSpeed(counter2) + CostSpin(counter2))*CostAngle;
        CostTotal(counter2,1) = Cd;
        CostTotal(counter2,2) = V0;
    end
    
end

M = min(CostTotal(:,3));

%Plotting a 3D Graph to find best combination
tri=delaunay(CostTotal(:,2), CostTotal(:,1));
h=trisurf(tri,CostTotal(:,2),CostTotal(:,1),CostTotal(:,3));
shading interp
colormap jet


