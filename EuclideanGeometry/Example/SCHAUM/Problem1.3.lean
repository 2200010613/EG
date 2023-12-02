import EuclideanGeometry.Foundation.Index

noncomputable section

namespace EuclidGeom

variable {P : Type _} [EuclideanPlane P]

namespace Problem1_3_
/-Let $\triangle ABC$ be an isosceles triangle in which $AB = AC$.
Let $D$ and $E$ be two points on $BC$,such that $BD=CE$

Prove that $∠DAB = ∠CAE$.
-/
--Let $\triangle ABC$ be an isosceles triangle in which $AB = AC$.
variable {A B C : P} {hnd: ¬ colinear A B C} {hisoc: (▵ A B C).IsIsoceles}
--Let $D$ and $E$ be two points on $BC$
variable {D : P} {D_Int_BC: D LiesInt (SEG B C)}
variable {E : P} {E_Int_BC: E LiesInt (SEG B C)}
--such that $BD = CE$.
variable {D_E_seg_position : (SEG B D).length = (SEG C E).length}
--lemma for existance of angle
--Because ▵ A B C is nondegrnerate, $A B C$ is pairwise distinct
lemma b_ne_a : B ≠ A := (ne_of_not_colinear hnd).2.2
lemma c_ne_a : C ≠ A := (ne_of_not_colinear hnd).2.1.symm
lemma a_ne_b : A ≠ B := (ne_of_not_colinear hnd).2.2.symm
lemma a_ne_c : A ≠ C := (ne_of_not_colinear hnd).2.1
lemma b_ne_c : B ≠ C := (ne_of_not_colinear hnd).1.symm
lemma c_ne_b : C ≠ B := (ne_of_not_colinear hnd).1
--Points not equal for angle
lemma d_ne_a : D ≠ A := sorry
lemma e_ne_a : E ≠ A := sorry
lemma d_ne_b : D ≠ B := D_Int_BC.2.1
lemma e_ne_c : E ≠ C := E_Int_BC.2.2
--Prove that $DM = EM$.
theorem Problem1_3_ : ∠ D A B (d_ne_a) (b_ne_a (hnd := hnd))= ∠ C A E (c_ne_a (hnd := hnd)) (e_ne_a) := by
  --the first edge of congruence
  have h₀ : (SEG B A).length = (SEG C A).length := by
    calc
      _= (SEG A B).length := length_of_rev_eq_length'
      _= (SEG C A).length := hisoc.symm
  have hnd₁ : ¬ colinear B A D := by sorry
  have hnd₂ : ¬ colinear C A E := by sorry
  have h₁ : (SEG D B).length = (SEG E C).length := by
    calc
      _= (SEG B D).length := length_of_rev_eq_length'
      _= (SEG C E).length := D_E_seg_position
      _= (SEG E C).length := length_of_rev_eq_length'
  have h₂ : ∠ A B D (a_ne_b (hnd := hnd)) (d_ne_b (D_Int_BC := D_Int_BC)) = -∠ A C E (a_ne_c (hnd := hnd)) (e_ne_c (E_Int_BC := E_Int_BC)) := by
    have h₂₁ : ∠ A B D (a_ne_b (hnd := hnd)) (d_ne_b (D_Int_BC := D_Int_BC)) = -∠ C B A (c_ne_b (hnd := hnd)) (a_ne_b (hnd := hnd)) := by sorry
    have h₂₂ : ∠ A C E (a_ne_c (hnd := hnd)) (e_ne_c (E_Int_BC := E_Int_BC)) = ∠ A C B (a_ne_c (hnd := hnd)) (b_ne_c (hnd := hnd)) := by sorry
    simp only [h₂₁]
    simp only [h₂₂]
    have h₂₀ : ∠ C B A (c_ne_b (hnd := hnd)) (a_ne_b (hnd := hnd)) = ∠ A C B (a_ne_c (hnd := hnd)) (b_ne_c (hnd := hnd)) := by
      apply (is_isoceles_tri_iff_ang_eq_ang_of_nd_tri (tri_nd := ⟨▵ A B C, hnd⟩)).mp
      exact hisoc
    rw[← h₂₀]
  have h₃ : TRI_nd B A D hnd₁ ≅ₐ TRI_nd C A E hnd₂ := by
    apply Triangle_nd.acongr_of_SAS
    · exact h₁
    · exact h₂
    · exact h₀
  have h₄ : ∠ D A B (d_ne_a) (b_ne_a (hnd := hnd))= -∠ E A C (e_ne_a) (c_ne_a (hnd := hnd)) := by
    exact h₃.angle₂
  rw[h₄]
  have h₅ : ∠ C A E (c_ne_a (hnd := hnd)) (e_ne_a) = -∠ E A C (e_ne_a) (c_ne_a (hnd := hnd)) := by
    exact neg_value_of_rev_ang (c_ne_a (hnd := hnd)) (e_ne_a)
  rw[h₅]
end Problem1_3_
