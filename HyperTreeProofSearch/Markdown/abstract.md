# paper
https://arxiv.org/pdf/2205.11491v1.pdf

# 4 HyperTree Proof Search
## Assumption
- g: main goal
- policy model : $P_\theta$
- critic model : $c_\theta$

## How to estimate the values of the trees?
- like $MCTS$. 
- store 
  - the visit counts $N(g,t)$
  - the total action value $W(g,t)$
- repeat three steps
  - selection
  - expansion
  - back-propagation

### Selection
- balance depth and breadth
  - best-first algorithm like $A^*$ and $MCTS$
- two types of approachs, detailed in Apendix.
  - PUCT
  - Regularized Policy(RP)
- estimate value of the tactic given by $Q = W/N$.
- A higher visit count will lead to a higher confidence in the standard value.
### Expansion
1. each valid tactic provides new subgoals or an empty set
2. add these hyperedges
   1. for new nodes, visit counts $N$ and total action values $W$ are initialized by zero.

there are three types of nodes in the hypergraph:
- Solved
- Invalid
- Unsolved

While expanding the process, we classify nodes.
### Back-propagation
#### assumption
- $T$: simulated proof tree if $g$
- $v_{T}(g)=1$ if it is solved
- $v_{T}(g)=0$ if it is invalid
- otherwise $v_{T}(g) = c_\theta(g)$
- $v_T(g) = \Pi_{c\in\mathrm{children}(g,t)}v_T(c)$

Once all values in $T$ are computed, for any tactic $t$ presented in $T$, we apply
- $W(g,t) += v_T(g)$
- $N(g,t) += 1$
- $Q(g,t) = W(g,t)/N(g,t)$.

# 5 Online training from proof searches