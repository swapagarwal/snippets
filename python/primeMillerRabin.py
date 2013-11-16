from math import sqrt, ceil
import random

def miller_rabin_pass(a, s, d, n):
  a_to_power = pow(a, d, n)
  if a_to_power == 1:
    return True
  for i in range(s-1):
    if a_to_power == n - 1:
      return True
    a_to_power = (a_to_power * a_to_power) % n
  return a_to_power == n - 1

def miller_rabin(n):
  if n<2:
    return False
  if n!=2 and n%2==0:
    return False
  d = n - 1
  s = 0
  while d % 2 == 0:
    d >>= 1
    s += 1
  for repeat in range(20):
    a = 0
    while a == 0:
      a = random.randrange(n)
    if not miller_rabin_pass(a, s, d, n):
      return False
  return True
