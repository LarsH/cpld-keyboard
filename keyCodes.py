b = open('codes.txt').read()[:-1]
l = b.split('\n\n')
l2 = [e.split('\n') for e in l]
#print map(len, l2)
l3 = []
for e in l2:
   if len(e) == 3:
      l3 += [e]
   elif len(e) == 6:
      l3 += [e[:3], e[3:]]
   else:
      assert False, repr(e)
#print map(len, l3)

l4 = []
for e in l3:
   a = e[1].replace(' ','')
   if len(a) < 3:
      l4 += [(a, e[0])]
   """print '--', e[0],
   print 'x"' + e[1] + '"',
   print e[2]"""

l4.sort()

for e in l4:
   print '    addr_ & addr_ when x"' + e[0] + '", -- ' + e[1]
