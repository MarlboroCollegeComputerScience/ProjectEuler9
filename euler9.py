"""
 euler9.py

 projecteuler.net problem 9 :

 There exists exactly one Pythagorean triplet 
 for which a + b + c = 1000, a<b<c, and a**2 + b**2 == c**2.
 Find the product abc.

 In class for the programming workshop.

 $ python euler9.py
 The answer for 1000 is a,b,c = (200, 375, 425) and a*b*c = 31875000

 The brute-force short approach without the anal comments and tests is :
  $ python
  >> for a in range(1,1000):
  ...   for b in range(1,1000):
  ...     c = 1000 - a - b
  ...     if c > 0 and a<b and b<c and a*a+b*b==c*c:
  ...       print "a,b,c = {} and a*b*c={}".format((a,b,c), a*b*c)
  ... 
  a,b,c = (200, 375, 425) and a*b*c=31875000

 Jim Mahoney | April 1 2014 | cs.marlboro.edu | MIT License
"""

def is_pythagorean(a, b, c):
    """ Return True if a**2 + b**2 == c**2 
        >>> is_pythagorean(3, 4, 5)
        True
        >>> is_pythagorean(4,4,4)
        False
    """
    return a*a + b*b == c*c

def search_triple_sum(triple_sum):
    """ Search for a,b,c such that a<b<c, a+b+c=triple_sum,
        and they're pythagorean. Return (a,b,c)
        >>> search_triple_sum(12)
        (3, 4, 5)
    """
    # print "search_limit = {}".format(search_limit)
    for a in xrange(1, triple_sum/3 + 1):
        # print " a = {}".format(a)
        for b in xrange(a+1, (triple_sum - a)/2 + 1):
            # print " b = {}".format(b)
            c = triple_sum - a - b
            # print " c = {}".format(c)
            if is_pythagorean(a, b, c):
                return (a, b, c)

limit = 1000
(a, b, c) = search_triple_sum(1000)
print "The answer for {} is a,b,c = {} and a*b*c = {}".format(
    limit, (a,b,c), a*b*c)

if __name__ == "__main__":
    import doctest
    doctest.testmod()
