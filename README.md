# diMAPF
SageMath scripts for the AIJ paper "The Computational Complexity of
Multi-Agent Pathfinding on Directed Graphs"

In order to run a script, you can either use the online evaluator at https://sagecell.sagemath.org/ or you have to install SageMath on your computer. If using the online evaluator, you can simply paste the entire text of a script into the (upper) evaluator field and then hit `Evaluate`. 

The repository contains the following scripts:

+ [lemma13-T0-pairs.sage](https://github.com/BernhardNebel/diMAPF/blob/master/lemma13-T0-pairs.sage): Verify that the two T0-pairs do indeed not admit a 3-cycle
+ [lemma13-case-analysis.sage](https://github.com/BernhardNebel/diMAPF/blob/master/lemma13-case-analysis.sage): Test for all cycle pair types (<11, <11, <11) that the specified permutations indeed lead to the announced 3-cycles
+ [lemma14-T0-extensions.sage](https://github.com/BernhardNebel/diMAPF/blob/master/lemma14-T0-extensions.sage): Iterate over all T0-pair extensions and identify those that contain only T0-pairs
+ [lemma14-3cycles.sage](https://github.com/BernhardNebel/diMAPF/blob/master/lemma14-3cycles.sage): Check that the specified permutations are indeed 3-cycles
