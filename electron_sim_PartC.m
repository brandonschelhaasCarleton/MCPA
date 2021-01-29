% already have the first step from initial conditions, start at 2
for i = 2:numSteps
    % Update time array / Add in time steps
    % t = t_0 + dt;
    t(i) = t(i-1) + dt; 
    
    % Update velocity array
    % v = v_0 + a*t ---> a = F/m
    v(i) = v(i-1) + (F/mass_elec)*dt; 
    
    % Update position array
    % x = x_0 + v_0 * t + 0.5 * a * t^2
    x(i) = x(i-1) + v(i-1)*dt + (1/2)*(F/mass_elec)*(dt)^2;
    
    %Plot the velocities
    subplot(2,1,1);
    title('Part C: Velocity with no scattering');
    plot(t(i), v(i), 'b.');
    ylabel('Velocity [m/s]');
    xlabel('time [s]');
    hold on;
    
    %Plot the positions
    subplot(2,1,2);
    title('Part C: Position with no scattering');
    plot(t(i), x(i), 'r.');
    ylabel('Position [m]');
    xlabel('time [s]');
    hold on;
    
    % pause execution to see the plot like a movie
    pause(0.000001)
end