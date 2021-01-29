% Create a sum variable for averaging -> drift velocity calculations
v_sum = v(1);
for i = 2:numSteps
    % Generate random number
    randomNum = rand;
    
    % Update time
    t(i) = t(i-1) + dt; 
    
    % Update velocity
    if(randomNum <= scattering_probability)
        v(i) = 0; % reset velocity
    else
        v(i) = v(i-1) + (F/mass_elec)*dt; % update velocity
    end
    v_sum = v_sum + v(i); % add new velocity to moving sum
    v_drift = v_sum / i; % recalculate average velocity
    
    % Update position
    x(i) = x(i-1) + v(i-1)*dt + (1/2)*(F/mass_elec)*(dt)^2;
    
    %Plot the velocities and display drift velocity
    subplot(2,1,1);
    title(['Part E - Drift Velocity = ', num2str(v_drift)]);
    plot(t(i), v(i), 'b.', t(i), v_drift, 'g.');
    ylabel('Velocity [m/s]');
    xlabel('time [s]');
    hold on;
    
    %Plot the positions
    subplot(2,1,2);
    title('Part E - Position with scattering');
    plot(t(i), x(i), 'b.');
    ylabel('Position [m]');
    xlabel('time [s]');
    hold on;
    
    % Pause execution to show the plot like a movie
    pause(0.001)
end
