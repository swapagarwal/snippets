def factorial(n): return reduce(lambda x,y:x*y,range(1,n+1),1)
 
def is_perm(a,b): return sorted(str(a)) == sorted(str(b))
 
def is_palindromic(n): return str(n)==str(n)[::-1]

def gcd(a, b):
  if a < 0:  a = -a
  if b < 0:  b = -b
  if a == 0: return b
  if b == 0: return a
  while b != 0: 
    (a, b) = (b, a%b)
  return a

def binomial(n, k):
  nt = 1
  for t in range(min(k, n-k)):
    nt = nt*(n-t)/(t+1)
  return nt
