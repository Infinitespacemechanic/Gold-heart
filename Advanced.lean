import Mathlib.Tactic

/- HHG42 Advanced - Fixed for Mathlib -/
-- Core
def carbonHex : Nat := 2 * 3
def container' (n : Nat) : Nat := n + 1
def seven : Nat := container' carbonHex

-- Centered hexagonal numbers: 3n(n-1)+1
def centeredHex (n : Nat) : Nat :=
  match n with
  | 0 => 0
  | n+1 => 3 * (n+1) * n + 1

theorem ch1 : centeredHex 1 = 1 := by rfl
theorem ch2 : centeredHex 2 = 7 := by rfl
theorem ch3 : centeredHex 3 = 19 := by rfl
theorem ch4 : centeredHex 4 = 37 := by rfl
theorem ch5 : centeredHex 5 = 61 := by rfl

def hexRing : Nat -> Nat
| 0 => 0
| 1 => 1
| n+1 => 6 * n

theorem ring2 : hexRing 2 = 6 := by rfl
theorem ring3 : hexRing 3 = 12 := by rfl
theorem ring4 : hexRing 4 = 18 := by rfl

def sumCenteredHex : Nat -> Nat
| 0 => 0
| n+1 => sumCenteredHex n + centeredHex (n+1)

theorem sum1_eq_cube1 : sumCenteredHex 1 = 1*1*1 := by rfl
theorem sum2_eq_cube2 : sumCenteredHex 2 = 2*2*2 := by rfl
theorem sum3_eq_cube3 : sumCenteredHex 3 = 3*3*3 := by rfl
theorem sum4_eq_cube4 : sumCenteredHex 4 = 4*4*4 := by rfl
theorem sum5_eq_cube5 : sumCenteredHex 5 = 5*5*5 := by rfl

-- General: sum = n^3 — now with ring/omega, no rfl hell
theorem sumCenteredHex_eq_cube (n : Nat) : sumCenteredHex n = n * n * n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    unfold sumCenteredHex centeredHex
    -- Goal: sum n + (3*(n+1)*n +1) = (n+1)^3
    rw [ih]
    ring

-- Dual containers 1,15,65,175
def dualContainer : Nat -> Nat
| 0 => 0
| 1 => 1
| 2 => 15
| 3 => 65
| 4 => 175
| n+5 => 3 * (n+5) * (n+4) * 2 + dualContainer (n+4)

theorem dual1 : dualContainer 1 = 1 := by rfl
theorem dual2 : dualContainer 2 = 15 := by rfl
theorem dual3 : dualContainer 3 = 65 := by rfl
theorem dual4 : dualContainer 4 = 175 := by rfl

def sum1to6 : Nat := 1+2+3+4+5+6
def fortyTwo : Nat := 2 * sum1to6

theorem fortyTwo_dual : fortyTwo = 42 := by rfl
theorem fortyTwo_is_six_sevens : fortyTwo = 6 * seven := by rfl
theorem fortyTwo_is_two_21 : fortyTwo = 2 * (3 * seven) := by rfl

def flatTriangle : Nat := 3
def tetraContainer : Nat := flatTriangle + 1

theorem tetra_is_4 : tetraContainer = 4 := by rfl
theorem impossible_3 : sum1to6 / seven = flatTriangle := by rfl

-- 60° geometry
def laakkonenRadian_num : Nat := 10472
def laakkonenRadian_den : Nat := 10000
def mechanicalHiggs_num : Nat := 472
def mechanicalHiggs_den : Nat := 10000

theorem laakkonen_eq_one_plus_higgs : laakkonenRadian_num = 10000 + mechanicalHiggs_num := by rfl

def sqrt3_num : Nat := 1732
def sqrt3_den : Nat := 1000

def capsuleToSquare_num : Nat := sqrt3_num * laakkonenRadian_num
def capsuleToSquare_den : Nat := sqrt3_den * laakkonenRadian_den

theorem capsule_less_than_two : capsuleToSquare_num < 2 * capsuleToSquare_den := by
  unfold capsuleToSquare_num capsuleToSquare_den sqrt3_num laakkonenRadian_num sqrt3_den laakkonenRadian_den
  decide -- 18,137,504 < 20,000,000

def synergyZone : Nat := seven + seven
theorem synergy_14 : synergyZone = 14 := by rfl
theorem synergy_third : synergyZone * 3 = fortyTwo := by rfl

def coreFreq : Nat := 1
def mantleFreq : Nat := 7
def shellFreq : Nat := 12
def haloFreq : Nat := 18

theorem clock_harmonics : shellFreq = 12 * coreFreq := by rfl
theorem mantle_is_seven : mantleFreq = seven := by rfl

def isLocation (n : Nat) : Bool :=
  match n with | 0 => false | _ => true

theorem one_is_location : isLocation 1 = true := by rfl
theorem zero_not : isLocation 0 = false := by rfl

def energy (m : Nat) : Nat := m
theorem E_eq_M (m : Nat) : energy m = m := by rfl

def scienceOfOne : Nat :=
  let hex := 2 * 3
  let sev := hex + 1
  let twentyOne := 3 * sev
  2 * twentyOne

theorem scienceOfOne_is_42 : scienceOfOne = 42 := by rfl
