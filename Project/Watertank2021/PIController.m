function f = PIController(g, pm, wc)
    % g  - system transfer matrix
    % pm - desired phrase margin (rad)
    % wc - desired cross-over frequency (rad/s)
    %
    % PIController returns a controller for which
    % the open-loop system has the desired
    % phrase margin and cross-over frequency.

    s = tf('s');

    T = 1/wc*tan(-pi - arg(g,wc) + pi/2 + pm);
    K = 1/abs(evalfr(g*(1+1/(s*T)), 1i*wc));

    f = K*(1 + 1/(s*T));
end

function phase = arg(g, w)
    % g - system transfer matrix
    % w - frequency
    %
    % phrase returns the value of the transfer function
    % at the given frequency.

    phase = angle(evalfr(g,1i*w));
end
