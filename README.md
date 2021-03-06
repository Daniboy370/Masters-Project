# Description

My [**masters**](https://arxiv.org/abs/2008.07397) Aerospace Engineering under supervisory of Prof. Barry Greenberg, Technion.
High pressure fuel is injected and iginited into a control volume that can be modeled using Navier-Stokes equations. After long (& wearisome) mathematical developments,  the combustion plane is expressed as a set of analytical equations (time invariant), where the normalized output represents the flame's height and temperature. Despite being continuous, the function was found practically non-differetiable, such that any classic optimization approaches (Gradient Besed) could not been applied. Therefore two optimization approaches were examined as a workaround :

#### Data driven - Falied ☹️ :

× Neural Network - Utilizing the analytic function as a generative model P(X, Y) that maps pairs of physical quantites (X) into flame's characteristics (Y). The estimator (ANN) learns to approximate y-output that minimize a square loss error.

× Reinforcement Learning - an agent that learns to navigate on the loss surface, in response to rewards.

#### Rule based - Succeded 🥳 :

✓ Genetic Algorithm - somewhat resembles the RL but significantly practical and more powerfull as it simultaneously samples hundreds of combinations and extracts the fittest, and thus avoid local optima.


&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src='https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/Shock_diamond.jpg?raw=true' width=550/>

# Table of contents

<!--ts-->
+ [Description](#description)
+ [Table of contents](#table-of-contents)
+ [Usage](#usage)
  * [The combustion model](#the-combustion-model)
  * [The temperature field](#the-temperature-field)
  * [The temperature space](#the-temperature-space)
  * [The flame height space (Monosectional)](#the-flame-height-space-monosectional)
  * [The flame height space (Polysectional)](#the-flame-height-space-polysectional)
  * [The optimization model](#the-optimization-model)
+ [Installation](#installation)
+ [Citation](#citation)
<!--te-->

# Usage

## The combustion model
> Subfolder : "\Model"

Development of the governing equations describing the mathematical model of the polydisperse spray diffusion flame by presenting the underpinning assumptions acting on the following combustion form :

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/model_schema.png width=380 />


The temperature field
---------------------
> &nbsp; &nbsp; &nbsp; **run** : *'main_flame_Temp.m'*

The temperature field solution per chosen initial condition :

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/T_field.png width=775 />

Latitudes of the temperature field in a 3D view :

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/T_field_raw.png width=800 />

The temperature space 
-----------------------
> &nbsp; &nbsp; &nbsp; **run**: *'main_flame_Temp.m'*

Extracting the maximum tip flame temperature (T<sub>max</sub>) vs. 3 parameters (Time complexity :arrow_up:) :  

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/T_max_full_a.png width=800 />

The flame height space (Monosectional)
---------------------------------
> &nbsp; &nbsp; &nbsp; **run**: 'main_flame_Height.m'

Extracting the maximum flame height (eta<sub>max</sub>) vs. 3 parameters (Time complexity :arrow_down:) :  

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/p_dist_mono_0.png width=850/>

The flame height space (Polysectional)
---------------------------------------
> &nbsp; &nbsp; &nbsp; **run**: 'main_flame_Poly.m' 

Extracting the maximum flame height (eta<sub>max</sub>) vs. 3 parameters (Polysectional) :  

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/p_dist_poly.png width=850 />

## The optimization model
In this section the combustion model is adjusted to the optimization model according to the following pseudocode :

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/GA_alg.png width=850 />

> Subfolder : "\Genetic Algorithm" \
> **run**: 'main_GA.m' 

Utilizing *Matlab* ® Genetic Algorithm to find the optimal polydisperse spray : 

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/GA_opt.png width=850 />

# Installation
The project consists of two directories that implement two of the model's main scenarios. In order to avoid <br/> 
undesired mess, the user is advised to act as follows :

0.  Download directory from upper right  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :inbox_tray: <br/> 
1. Install *Matlab* ®, version > R2018a  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :scientist:  <br/> 
2. Install the [Global Optimization Toolbox](https://www.mathworks.com/products/global-optimization.html) library  &nbsp; &nbsp;  :mage_man: <br/> 
3. Set desirable initial setup and execute. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  :play_or_pause_button:

### Directory tree
<pre>
[root directory]
├── Model
|   ├── main_flame_field.m
|   ├── main_flame_Temp.m
|   ├── main_flame_Height.m
|   ├── main_flame_Poly.m
...
├── Genetic Algorithm
|   └── main_GA.m
...
├── Misc.
└── Readme.md
</pre>


# Citation
If you use this library for your publications, please cite it as:
```
author    = {Engelsman, Greenberg},
title     = {A Study of a Genetic Algorithm for Polydisperse Spray Flames},
address   = {Technion, Haifa, Israel},
year      = {2020},
month     = {July},
url       = {https://github.com/Daniboy370/Masters-Project}
}
```
[<img src=https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/ArXiv_web.svg/250px-ArXiv_web.svg.png width=70/>](https://arxiv.org/abs/2008.07397)
