# -*- mode: python -*-
# This script verfies that the stated permutations in Lemma 14 are actually 3-cycles

print("Check that the extended T0-pairs containing only T0s can generate a 3-cycle")
print("===========================================================================")
G = SymmetricGroup(8)
id = G([])

# (a) case b2 to c2 with one intermediate node for (1,3,2)
# mapping is 1 = b_3, 2 = b_2, 3 = b_1, 4 = a_1, 5 = c_1, 6 = c_2, 7 = e_1
alpha = G((1,2,3,4))
beta = G((1,2,3,5,6))
gamma = G((1,2,7,6))
p = beta*alpha*beta^-1*gamma^-1
print("Case a:",p) 
assert len(p.cycle_type(False)) == 1 and p.cycle_type(False)[0] == 3

# (b) case a_2 to a_1 with two intermediate nodes for (2,2,2)
# mapping is 1 = b_2, 2 = b_1, 3 = a_1, 4 = a_2, 5 = c_1, 6 = c_2, 7 = e_1, 8 = e_2
alpha = G((1,2,3,4))
beta = G((1,2,5,6))
delta = G((3,4,8,7))
p = beta^-1*delta^-1*alpha^-1*beta^2*delta^-1*alpha^-1*delta^-1
print("Case b:",p) 
assert len(p.cycle_type(False)) == 1 and p.cycle_type(False)[0] == 3

# (c) case b1 to b2 with two intermediate nodes for (2,2,2)
# mapping is 1 = b_2, 2 = b_1, 3 = a_1, 4 = a_2, 5 = c_1, 6 = c_2, 7 = e_1, 8 = e_2
alpha = G((1,2,3,4))
beta = G((1,2,5,6))
eta = G((1,2,7,8))
p = alpha*beta*eta*alpha^-1*beta^-1*eta^-1
print("Case c:",p) 
assert len(p.cycle_type(False)) == 1 and p.cycle_type(False)[0] == 3

print("No deviation found\n")
