import EuclideanGeometry.Foundation.Axiom.Linear.Perpendicular

noncomputable section
namespace EuclidGeom

open Line

variable {P : Type _} [EuclideanPlane P]

theorem perp_foot_unique {A B : P} {l : DirLine P} (h : A LiesOn l) [_hne : PtNe A B] (hp : (DLIN B A) ⟂ l) : perp_foot B l = A := sorry

theorem eq_dist_eq_perp_foot {A B : P} {l : DirLine P} (h : A LiesOn l) (heq : dist B A = dist_pt_line B l) : A = perp_foot B l := sorry

end EuclidGeom
