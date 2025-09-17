% MATLAB code to display all continuous-time signals across two plot windows.

% Set the range for t (for subplots)
t_subplot = -10:0.01:10;

% --- Signal Generation ---
% 1. Unit Impulse
% Find the point where t=0 and set it to 1, others to 0
impulse = (t_subplot == 0); 

% 2. Unit Step
% Find points where t>=0 and set to 1, others to 0
unit_step = (t_subplot >= 0);

% 3. Unit Ramp
% Multiply t by the unit step function
unit_ramp = t_subplot .* (t_subplot >= 0);

% 4. Exponential Signal
% Decaying signal with a=-0.5
a = -0.5;
exponential_signal = exp(a * t_subplot);

% 5. Signum Signal
% Use the sign() function
signum_signal = sign(t_subplot);

% --- Plotting ---

% First plot window: Display multiple signals using subplots
figure;
set(gcf, 'Position', [100, 100, 900, 600]); % Set window position and size

% Create a 3x2 subplot grid
subplot(3, 2, 1);
stem(t_subplot, impulse, 'filled'); 
title('Continuous time Unit Impulse signal');
xlabel('Continuous time');
ylabel('Amplitude');
grid on;

subplot(3, 2, 2);
plot(t_subplot, unit_step, 'LineWidth', 2);
title('Unit Step Signal');
xlabel('Continuous time');
ylabel('Amplitude');
grid on;

subplot(3, 2, 3);
plot(t_subplot, unit_ramp, 'LineWidth', 2);
title('Unit Ramp');
xlabel('Continuous time');
ylabel('Amplitude');
grid on;

subplot(3, 2, 4);
plot(t_subplot, exponential_signal, 'LineWidth', 2);
title('Continous time Exponential Signal');
xlabel('Continuous time');
ylabel('Amplitude');
grid on;

% Make the Signum Signal plot span the entire third row to make it wider
subplot(3, 1, 3);
plot(t_subplot, signum_signal, 'LineWidth', 2);
title('Continuous time Signum Signal');
xlabel('Continuous time');
ylabel('Amplitude');
grid on;

% Second plot window: Display the Sinc Signal separately
figure;
set(gcf, 'Position', [1000, 100, 600, 400]); % Set window position and size

% Reset the range for t for the Sinc function
t_sinc = -30:0.01:30;

% Sinc Signal (using the sin(t)/t formula)
sinc_signal = sin(t_sinc) ./ t_sinc;
sinc_signal(t_sinc==0) = 1;

plot(t_sinc, sinc_signal, 'LineWidth', 2);
xlabel('Continuous time');
ylabel('Amplitude');
title('continuous time Sinc Signal');
grid on;