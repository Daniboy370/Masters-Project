# Description

Seminar report towards M.Eng in Aeronautical Engineering in the Technion university. 
In a nutshell, it presents an heuristic implementation of the Genetic Algorithm with respect to a combustion model. Eventually, it manages
to answer the question what is the optimal initial droplet size distribution that guarantees an optimal flame performance.


# Table of contents


<!--ts-->
+ [Description](#description)
+ [Table of contents](#table-of-contents)
+ [Usage](#usage)
  * [The combustion model](the-combustion-model)
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

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/model_schema.png)


The temperature field
---------------------
> &nbsp; &nbsp; &nbsp; **run** : *'main_flame_Temp.m'*

The temperature field solution per chosen initial condition :

![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/T_field.png)

Latitudes of the temperature field in a 3D view :

![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/T_field_raw.png)

The temperature space 
-----------------------
> &nbsp; &nbsp; &nbsp; **run**: *'main_flame_Temp.m'*

Extracting the maximum tip flame temperature (T<sub>max</sub>) vs. 3 parameters (Time complexity :arrow_up:) :  

![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/T_max_full_a.png)

The flame height space (Monosectional)
---------------------------------
> &nbsp; &nbsp; &nbsp; **run**: 'main_flame_Height.m'

Extracting the maximum flame height (eta<sub>max</sub>) vs. 3 parameters (Time complexity :arrow_down:) :  

![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/p_dist_mono_0.png)

The flame height space (Polysectional)
---------------------------------------
> &nbsp; &nbsp; &nbsp; **run**: 'main_flame_Poly.m' 

Extracting the maximum flame height (eta<sub>max</sub>) vs. 3 parameters (Polysectional) :  

![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/p_dist_poly.png)

## The optimization model
In this section the combustion model is adjusted to the optimization model according to the following pseudocode :

![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/GA_alg.png)

> Subfolder : "\Genetic Algorithm" \
> **run**: 'main_GA.m' 

Utilizing *Matlab* ® Genetic Algorithm to find the optimal polydisperse spray : 

![alt text](https://github.com/Daniboy370/Masters-Project/blob/master/Misc/Images/GA_opt.png)

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
