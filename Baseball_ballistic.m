%This code "ballistic.m" was provided by the course lecturer as initial
%setup. Project was completed by created subsequent codes built on this
%one.

function distance = ballistic(theta,V0,Cd,mass,area,tstep,plotting)
% distance = ballistic(theta,V0,Cd,mass,area,tstep,plotting)
% This function returns the horizontal distance travelled by a projectile,
% given the launch angle (theta, in degrees), launch velocity (V0), drag coefficient
% (Cd), mass (in kg) and surface area (in cm^2) of the projectile. 'tstep'
% controls the time interval of the analysis, and 'plotting' controls
% whether the trajectory of the ballistic is plotted

    theta = theta*pi/180;
    area = area/(100^2);
        % convert theta into radians and area into m2.
    rho = 1.225;
    g = 9.81;

    vt = ((2*mass*g)/(rho*Cd*area))^0.5;
    k = (mass*g)/vt;

    U0 = V0*cos(theta);
    W0 = V0*sin(theta);

    sz(1) = 0;
    sx(1) = 0;
    t = 0;
        % initialize variables

    count = 1;
    while sz(count)>=0
        t = t + tstep;
        count = count+1;
        sz(count) = (-mass*g*t/k) + (mass/k)*(W0+(mass*g/k))*(1-exp((-k/mass)*t));
        sx(count) = (mass/k)*U0*(1 - exp(-k*t/mass));
    end
    distance = sx(count);

    if plotting == 1
        plot(sx,sz,'k-')
        xlabel('Horizontal distance, s_x (m)','fontsize',14)
        ylabel('Vertical distance, s_z (m)','fontsize',14)
        set(get(gcf,'CurrentAxes'),'FontSize',12)
        grid on
    end
end