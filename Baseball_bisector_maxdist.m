function theta = bisector_maxdist(Cd,V0)
%theta is the launch angle that provides a max horizontal distance for a
%pair of values of Cd and V0
i=1;
start = 0; finish = 90;    
    while i == 1
        mid = (start+finish)/2;
        yl = ballistic(start,V0,Cd,0.145,42,0.001,0);
        yr = ballistic(finish,V0,Cd,0.145,42,0.001,0);
        ym = ballistic(mid,V0,Cd,0.145,42,0.001,0);
        if abs(ym - (yl + yr)/2) < 0.05
            break
        end
        if yl<yr
            start = mid - 0.8*(mid - start);
        elseif yl>yr
            finish = mid + 0.8*(finish - mid);
        end
    end
    theta = mid;
    disp(ym); %This is the maximum distance travelled for the least favourable condition
end