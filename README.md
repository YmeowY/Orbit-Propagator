# Satellite orbit propagator

> **NOTICE**
>* Welcome to join the development.
>* **The project is for study only, NOT for commercial activity**.

## 1. Illustration

* **orbitProp_J2.m**: use CALdr_v.m to perform orbit propagation.
* **CALdr_v.m**: calculate [dr, dv] with [r, v].
* **test.m**: including *4th order Runge-Kutta*(4th R-K) and *1st order R-K*(1st R-K).
* **vr2kpl.m**: calculate *Keplerian orbits*(kpl) with [r, v].
* **rv2kpl.m**: new method to calculate *Keplerian orbits*(kpl) with [r, v].

> the propagation is coded according to the book ***Spacecraft Dynamics and Control***.

### 1.1 Mainflow

1. Run *test.m* to simulate the orbit propagation.
2. Run *dataVisualization.m* to visualize the data.

## 2. Existing problems(HELP WANTED)

* 2 body mode is ok. But it's not right when adding J2 perturbation.

## 3. Change Log

### 2018年6月25日**v0.1.3**

1. amended the new [r, v] to kpl. the *argument of perigee* (w) should be in the range between [-pi, pi].
2. amended the markdown file: remove the copyright declaration.

### 2018年6月25日**v0.1.2**

1. amended the new [r, v] to kpl. *Spacecraft Dynamics and Control* P27.

> But the J2 propagator is still not right. Don't know why. I coded it like what is said in the book, but the result is not like the one in the book(HELP).

### 2018年6月24日**v0.1.1**

1. refactor the code.
2. seperate the data visualization part from test.m

### 2018年6月24日**v0.1**

1. refactor the code.
2. seperate the 4 R-K from test.m

### 2018年6月24日**v0.0**

1. correct the propagator. *Sapcecraft Dynamics and Control* P37
2. add function to calculate *Keplerian orbits*(kpl) with *position and velocity*(r_v).