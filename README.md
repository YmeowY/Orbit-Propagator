# Satellite orbit propagator

> **NOTICE**
>* Welcome to join the development.
>* **This project is for study/research only, NOT for commercial/illegal activity**.

## 1. Illustration

* **mainflow.m**: an example of How-to.
* **RK4.m**: 4th order Runge-Kutta method.
* **Prop_rva**: perform orbit propagation with [r, v, a]. (Instantaneous perturbation)(瞬时摄动)
* **Prop_Kpl**: perform orbit propagation with [a, e, i, W, w, M]. (Average perturbation)(平均摄动)
* **CalForce_Grav.m**: cal acceleration of gravity.
* **CalForce_J2.m**: cal acceleration of J2.
* **Trans_kpl2rv.m**: [a, e, i, W, w, M] -> [r, v].
* **Trans_rv2kpl.m**: [r, v] -> [a, e, i, W, w, M].
* **test.m**: DIY test.

> the propagation is coded according to the book ***Spacecraft Dynamics and Control***.

### 1.1 Mainflow

1. Run *test.m* to simulate the orbit propagation.
2. Run *dataVisualization.m* to visualize the data.

## 2. Existing problems(HELP WANTED)

## 3. Change Log

### 2018年7月11日

1. clear the project.
2. modified README.

### 2018年7月11日**v0.2**

1. refactored the project & code.
2. J2 tested. *use HPOP(High Precision) model in STK to predict the orbits*

### 2018年6月29日

1. added *Keplerian orbits propagator* (Prop_KplOrbits). Testing.

### 2018年6月29日

1. added **RK4.m** to project.

### 2018年6月25日**v0.1.4**

1. amended the new [r, v] to kpl. the *right ascension of ascending node* (W) should be in the range between [0, 2pi].

> Actually compare *this result* with *STK simulation*: the error of [r, v] will grow as time goes. And so are the Keplerian orbits.
> (Worse, I have no idea where the error comes from. Looks like it is due to the time error according to the error curves.)

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