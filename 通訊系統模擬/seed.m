function seed(new_seed)

global ISEED
msg = nargchk(1,2,nargin);
error(msg);

new_seed = round(new_seed);
ISEED = abs(new_seed);

