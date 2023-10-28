# -*- python -*-
# This script checks that the presented permutations in Lemma 13 are indeed 3-cycles

nmax = 10

print("CHECK the case analysis of Lemma 13 about 3-cycles up to", nmax, "nodes for each part")
print("================================================================================")
for r in range(0,nmax+1):
    for s in range(0,nmax+1):
        for t in range(0,nmax+1):
            if (s == 0) or (t < r): # impossible values
                continue
            if (r == 0) and (s < 2 or t == 0): # again impossible values
                continue
            A1    = (s+1 if r>0 else 0)
            A2    = (A1+1 if r>1 else 0)
            AR    = (s+r if r>0 else 0)
            B1    = s
            B2    = (B1-1 if s>1 else 0)
            BS    = 1
            BSm1  = (2 if s > 1 else 0)
            C1    = r+s+1
            C2    = (C1+1 if t>1 else 0)
            CT    = r+s+t
            CTm2  = (CT-2 if t > 2 else 0)
            G = SymmetricGroup(r+s+t)
            id = G([])
            alpha = G(tuple(range(1,s+1)) + tuple(range(s+1,s+r+1)))
            beta = G(tuple(range(1,s+1)) + tuple(range(s+r+1,s+r+t+1)))
            if r == 0 and s >= 2 and t >= 1:
                assert (s >= 2 and t >= 1 and beta*alpha^-1*beta^-1*alpha == G((BS, CT, B1))),\
                  "Case (0,_,_) failed"
            elif r >= 1 and s == 1 and t >= 1:
                assert (beta*alpha^-1*beta^-1*alpha == G((B1, A1, CT))), "Case (>= 1, 1, _) failed"
            elif r == 1 and s == 2 and t >= 1:
                assert (len(alpha.cycle_type(False)) == 1 and alpha.cycle_type(False)[0] == 3),\
                  "Case (1,2,_) failed"
            elif r == 1 and s >= 3 and t == 1:
                assert (alpha^-1 * beta == G((BS, A1, C1))),\
                  "Case (1,>=3,1) failed"
            elif r == 1 and s == 3 and t == 2:
                pass # nothing to do here
            elif r == 1 and s == 3 and t >= 3:
                chi = beta^2*(alpha^-1*beta)^2*beta^-2
                sbeta = beta*alpha^-1*beta^-1*alpha
                assert (sbeta == G([(BS, CT), (B1, A1)]) and
                            chi*sbeta*chi^-1 == G([(BS, CT), (A1, CTm2)]) and
                            sbeta*chi*sbeta*chi^-1 == G((B1, CTm2, A1))),\
                    "Case (1,3,>=3) failed"
            elif r == 1 and s >= 4 and t == 1:
                assert False, "Case (1, >=4, 1) already covered!"
            elif r == 1 and s >= 4 and t >= 2:
                salpha = alpha*beta^-1*alpha^-1*beta
                assert (salpha == G([(BS, AR), (B1, C1)]) and
                            beta^-1*salpha*beta == G([(BSm1, AR), (C1, C2)]) and
                            alpha^2*(beta^-1*salpha*beta)*alpha^-2 == G([(B2, AR), (C1, C2)]) and
                            (beta^-1*salpha*beta)*(alpha^2*(beta^-1*salpha*beta)*alpha^-2) \
                            == G((BSm1, B2, AR))),\
                    "Case (1,>=4,>=2) failed"
            elif r == 2 and s == 1 and t >= 2:
                assert False, "Case (2, 1, >=2) already covered!"               
            elif r == 2 and s == 2 and t == 2:
                pass # nothig to do
            elif r >= 2 and s >= 2 and t >= 3:
                sbeta = beta*alpha^-1*beta^-1*alpha
                assert (sbeta == G([(BS, CT), (A1, B1)]) and
                            alpha^-1*sbeta*alpha == G([(BSm1, CT), (A1, A2)]) and
                            beta^2*(alpha^-1*sbeta*alpha)*beta^-2 ==  G([(CTm2, CT), (A1, A2)]) and
                            (alpha^-1*sbeta*alpha)*(beta^2*(alpha^-1*sbeta*alpha)*beta^-2) == \
                            G((BSm1, CTm2, CT))),\
                    "Case (>=2,>=3,>=3) failed"                    
            elif r == 2 and s >= 3 and t == 2:
                sbeta = beta*alpha^-1*beta^-1*alpha
                assert (sbeta == G([(BS, CT), (A1, B1)]) and
                            alpha^-1*sbeta*alpha == G([(BSm1, CT), (A1, A2)]) and
                            beta^2*(alpha^-1*sbeta*alpha)*beta^-2 ==  G([(B1, CT), (A1, A2)]) and
                            (alpha^-1*sbeta*alpha)*(beta^2*(alpha^-1*sbeta*alpha)*beta^-2) == G((BSm1, B1, CT))),\
                    "Case (2,>=3,2) failed"
            elif r >= 2 and s >= 3 and t >= 3:
                assert False, "Case (>=2, >=3, >=3) already covered!"                
            else:
                assert False, "Forgotten case:" + str((r,s,t))
print("No deviation found\n")
