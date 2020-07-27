clear;clf; hold off;

%%% calculates starting quarter circle
y_circ = @(x) sqrt(1 - x .^ 2);
inc = [0:0.01:1];
circlePoints = y_circ(inc);

%%% plots quarter circle highlighting which areas are in
area (inc, circlePoints, "FaceColor", "blue", "FaceAlpha", 0.3)
hold on;

%%% initialising starting variables
throws = 0; % tracks amount of throws
inCircle = 0; % tracks how many darts are inside
outCircle = 0;% tracks how many darts are outside

%%% runs 500 trials to guess pi (best mix of accuracy and time)
for i = 1:500
    % gets random x and y coords
    x = rand(1);
    y = rand(1);
    throws++;
    % puts marker on board, is sorted based on if inside or outside
    if (y < y_circ(x))
        inCircle++;
        plot(x, y, "marker", '.', "color", "b", "markersize", 2);
    else
        outCircle++;
        plot(x, y, "marker", '.', "color", "r", "markersize", 2);
    endif
endfor

%%% gets variables ready for display
a = inCircle/throws * 4 % calculates guessed value of pi
dif = abs(a - pi); % gets difference thru absolute value
msg = ""; % inits msg var

%%% changes message based on circumstances
if (a > pi)
    msg = "greater";
elseif (a < pi)
    msg = "lesser";
else
    msg = "the same"
endif

%%% prints needed values
fprintf("The estimation was %s than pi by %d", msg, dif)
