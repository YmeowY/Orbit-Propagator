# Satellite orbit propagator

> copyright &copy; 2018. Kasoll. All right reserved.

**The project is for study only, NOT for commercial activity**

## Illustration

* orbitProp_J2.m: calculate [dr, dv] with [r, v].
* test.m: including **4th order Runge-Kutta**(4th R-K) and **1st order R-K**(1st R-K).
* vr2kpl: calculate **Keplerian orbits**(kpl) with [r, v].

## Existing problems

* 2 body mode is ok. But it's not right when adding J2 perturbation.(need some help)

## Change Log

### 2018年6月24日**v0.0**

1. correct the propagator. *Sapcecraft Dynamics and Control* P37
2. add function to calculate *Keplerian orbits*(kpl) with *position and velocity*(r_v).