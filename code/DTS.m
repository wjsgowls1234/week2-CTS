% MATLAB code to display all discrete-time signals across two plot windows.

% Set the range for n (for subplots)
n = -10:10;

% --- Signal Generation ---
% 1. Discrete-Time Unit Impulse
% Find the point where n=0 and set it to 1, others to 0
impulse = (n == 0); 

% 2. Discrete-Time Unit Step
% Find points where n>=0 and set to 1, others to 0
unit_step = (n >= 0);

% 3. Discrete-Time Unit Ramp
% Multiply n by the unit step function
unit_ramp = n .* (n >= 0);

% 4. Discrete-Time Exponential Signal (a=0.8)
% Calculate a^n
a = 0.8;
exponential_signal = a.^n;

% 5. Discrete-Time Signum Function
% Use the sign() function
signum_signal = sign(n);

% --- Plotting ---

% First plot window: Display multiple signals using subplots
figure;
set(gcf, 'Position', [100, 100, 900, 600]); % Set window position and size

% Create a 3x2 subplot grid
subplot(3, 2, 1);
stem(n, impulse, 'filled'); 
title('Discrete time Unit Impulse signal');
xlabel('Discrete time n');
ylabel('Amplitude');
grid on;

subplot(3, 2, 2);
stem(n, unit_step, 'filled');
title('Unit Step Sequence');
xlabel('Discrete time n');
ylabel('Amplitude');
grid on;

subplot(3, 2, 3);
stem(n, unit_ramp, 'filled');
title('Unit Ramp Sequence');
xlabel('Discrete time n');
ylabel('Amplitude');
grid on;

subplot(3, 2, 4);
stem(n, exponential_signal, 'filled');
title('Discrete time Exponential Signal');
xlabel('Discrete time n');
ylabel('Amplitude');
grid on;

% Make the Signum Function plot span the entire third row to make it wider
subplot(3, 1, 3); 
stem(n, signum_signal, 'filled');
title('Discrete time Signum Function');
xlabel('Discrete time n');
ylabel('Amplitude');
grid on;

% Second plot window: Display the Sinc Function separately
figure;
set(gcf, 'Position', [1000, 100, 600, 400]); % Set window position and size

% Reset the range for n for the Sinc function
n_sinc = -30:30;

% Discrete-Time Sinc Function (using the sin(n)/n formula)
sinc_signal = sin(n_sinc) ./ n_sinc;
sinc_signal(n_sinc==0) = 1;

stem(n_sinc, sinc_signal, 'filled');
xlabel('Discrete time n');
ylabel('Amplitude');
title('Discrete time Sinc Function');
grid on;