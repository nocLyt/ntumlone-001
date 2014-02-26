

from math import *

def ln(x):
    return log(x)/log(e)

def mH(x):
    return x;

def PVB (epsilon, theta=0.05, dvc=50, N=10000.0):
    return sqrt( 1.0/N*(2*epsilon + ln(6)-ln(theta)+dvc*ln(2*N) ) )

def Devroye (epsilon, theta=0.05, dvc=50, N=10000.0):
    return sqrt( 1.0/(2*N)*( 4*epsilon*(1+epsilon) + ln(4)-ln(theta)+2*dvc*ln(N) ) )

def VCBound (theta=0.05, dvc=50, N=10000.0):
    return sqrt( 8.0/N*(ln(4)-ln(theta)+dvc*ln(2*N)) )

def RPBound (theta=0.05, dvc=50, N=10000.0):
    return sqrt( 2*(ln(2*N)+dvc*ln(N))/N ) + sqrt(2.0/N*ln(1.0/theta)) +1.0/N;

def binSerch(f):
    l= 0.0
    r= 1000000.0
    while r-l>1e-8:
        epsilon = (l+r)/2.0;
        if (epsilon-f(epsilon)>0):
            r = epsilon
        else :
            l = epsilon
    return epsilon
        


print "RPBound", RPBound()
print "VCBound", VCBound()
print "PVBBound", binSerch(PVB)
print "Devroye", binSerch(Devroye)
