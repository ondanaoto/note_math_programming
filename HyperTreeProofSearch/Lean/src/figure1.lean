import data.nat.basic

example (m n k : ℕ) (h_θ : n ≤ m) : n + k ≤ m + k :=
begin
  induction k,
  {
    exact h_θ,
  },
  {
    -- The following code is different from the original in the paper since the original does not work in almost versions of Lean.
    apply nat.succ_le_succ_iff.mpr,
    exact k_ih,
  }
end