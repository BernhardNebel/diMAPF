# -*- mode: python -*-
# This script tries out all possible extensions of T0-pairs
# containing one and two nodes. It then checks whether this
# results in cycle pairs of a type that is not a T0-pair. If
# all pairs ar T0 pairs, the type of the original pair and
# the extension is printed.
def shared(c1, c2):
  return len(set(c1) & set(c2))

def ptype(c1, c2):
  if len(c1) > len(c2): c1,c2 = c2,c1
  if c1 != c2 and shared(c1,c2) > 0: 
    return (len(c1)-shared(c1,c2)-1, 
              shared(c1,c2),
              len(c2)-shared(c1,c2)-1)

def t0pairs(dig):
  for c1 in dig.all_simple_cycles():
    for c2 in dig.all_simple_cycles():
      if ptype(c1,c2) not in \
        [(2,2,2),(1,3,2),None]: return
  return True

t0a={"a1":["b3"],"b3":["b2"],"b2":["b1"], 
   "b1":["a1","c1"],"c1":["c2"],"c2":["b3"]}
t0b={"a1":["a2"],"a2":["b2" ],"b2":[ "b1"], 
   "b1":["a1","c1"],"c1":["c2"],"c2":["b2"]}
ears = [["e1"],["e1","e2"]]
tested = []

print("GENERATE all T0-pair extensions containing only T0-pairs")
print("========================================================")	
for g, p in ((t0a, (1,3,2)), (t0b,(2,2,2))):
  for h in g.keys():
    for t in g.keys():
      for e in ears:
        t0 = DiGraph(g)
        t0.add_path([h]+e+[t])
        if all([not t0.is_isomorphic(d) \
                 for d in tested]):
          tested += [t0]
          if t0pairs(t0): print(p,[h]+e+[t])