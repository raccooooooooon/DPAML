function ran = random0 (m, n)

global ISEED
msg = nargchk(1,2,nargin);
error(msg);

if nargin <2
    n = m;
end

ran = zeros(m,n);

for ii = 1:m
    for jj = 1:n
        ISEED = mod(8121*ISEED+28411, 134456);
        ran(ii, jj) = ISEED / 134456;
    end
end

