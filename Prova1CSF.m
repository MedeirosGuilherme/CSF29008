m = 3;
n = 2^m-1;
k = 3;

msg = gf([2 7 3; 4 0 6; 5 1 1],m);
code = rsenc(msg,n,k);

erros = gf([2 0 0 0 0 0 0; 3 4 0 0 0 0 0; 5 6 7 0 0 0 0],m);
noisycode = code+errors;

[rxcode,cnumerr] = rsdec(noisycode, n, k);