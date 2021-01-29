% Sum all electron velocities from initial conditions
v_sum = sum(v(:,1));
for i = 2:numSteps
    % Generate a random number for each electron
    randomNums = rand(numElectrons, 1);
    
    % Update time
    t(i) = t(i-1) + dt; 
    
    % Update velocity for each electron
    for j = 1:numElectrons
        if(randomNums(j) <= P) % check each random number vs. prob of scattering
            v(j,i) = reflect * v(j,i-1); % change the velocity when scattered
        else
            v(j,i) = v(j,i-1) + (F/mass_elec)*dt; % keep and calculate a new velocity
        end
    end
    v_sum = v_sum + sum(v(:,i)); % Update sum
    v_drift = (v_sum/numElectrons)/i; % Update average/drift velocity
      
    % Update position
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + (1/2)*(F/mass_elec)*(dt)^2;
    
    %Plot the velocities of all electrons in blue, drift velocity in green
    subplot(2,1,1);
    title(['Part H - Drift Velocity = ', num2str(v_drift)]);
    plot(t(i), v(:,i), 'b.', t(i), v_drift, 'g.');
    ylabel('Velocity [m/s]');
    xlabel('time [s]');
    hold on;
    
    %Plot the positions
    subplot(2,1,2);
    title('Part H - Position with scattering');
    plot(t(i), x(:,i), 'b.');
    ylabel('Position [m]');
    xlabel('time [s]');
    hold on;
    
    % Pause execution to plot like a movie
    pause(0.001)
end
