import data.nat.basic

example (m n k : ℕ) (h_θ : n ≤ m) : n + k ≤ m + k :=
begin
  induction k,
  {
    exact h_θ
  },
  {
    rw nat.succ_le_succ_iff,
    exact k_ih
  }
end
