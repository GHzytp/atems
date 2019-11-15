
# UBC tools for TEM image analysis (ubc-tem-analysis)

This program contains several methods of characterizing aggregates from
TEM images for image analysis at the Univesity of British Columbia (UBC). 
This includes methods for evaluating the aggregate projected area, perimeter,
and primary particle diameter.

The software contains MATLAB code designed to compare multiple
methods of analyzing TEM images of aggregates. These include the
pair correlation method (PCM), Kook, and manual methods. Each method 
is contained in a package, with a corresponding `perform_*` function that
can be used to call the method.

## 1. Data structure

Images are handled primarily by two variables: `Imgs_ref`
and `Imgs`. The former contains a reference to the images,
including file name and containing directory. The latter
contains both the imported raw image, as well as processed
versions of the image, such as those with the footer removed.

The output data itself, `Aggs`, is a structure array with one
entry per aggregate. This data can then be exported to a JSON
format to be analyzed in other software and languages.

## 2. Packages

#### 2.1 Aggregate detection and segmentation (+agg_segment)

This package contains an expanding library of functions aimed at 
performing semantic segmentation of the TEM images of aggregates. 
Some of the functions are modeled after the code of 
[Dastanpour et al. (2016)][dastanpour2016], though the code was
significantly streamlined in the present implementation. 

Current methods for aggregate-level semantic segmentation include:

1. Otsu thresholding with a rolling ball transformation, 

2. a GUI method with a slider for manual thresholding of the image, and

3. a wrapper function (agg_det.m) that runs a series of these other methods 
in series. 

Other methods are currently under development. 

#### 2.2 Primary particle sizing (+pp)

The +pp package contains multiple methods for determining the primary 
particle size of the aggregates of interest. Often this requires a binary 
mask of the image that can be generated using the +agg package methods. 

###### 2.2.1 pcm

The University of British Columbia's pair correlation method (PCM) 
MATLAB code for processing TEM images of soot to determine morphological 
properties. This package contains a significant update to the previous 
code provided with [Dastanpour et al. (2016)][dastanpour2016].

###### 2.2.2 kook

This method contains a copy of the code provided by [Kook et al. (2015)][kook],
with minor modifications to match in the input/output of some of the
other packages.

###### 2.2.3 kook_mod

This method contains a heavily modified version of the method proposed
by [Kook et al. (2015)][kook].

###### 2.2.4 manual

*This is currently contained in a seperate package (+pp_manual).*

Code to be used in the manual sizing of soot primary particles developed
at the University of British Columbia. The current method uses crosshairs
to select the length and width of the particle. This is converted to
various quantities, such as the mean primary particle diameter. The manual
code is a heavily modified version of the code associated 
with [Dastanpour and Rogak (2014)][dastanpour2014].

--------------------------------------------------------------------------

#### License

This software is licensed under an MIT license (see the corresponding file
for details).


#### Contact information and acknowledgements

This code was primarily compiled by Timothy A. Sipkens while at the
University of British Columbia (UBC), who can be emailed at
[tsipkens@mail.ubc.ca](mailto:tsipkens@mail.ubc.ca). The code
itself was compiled from various sources and features code written by
several individuals at UBC, including Yeshun (Samuel) Ma, Ramin Dastanpour,
Yiling Kang, Una Trivanovich, and Steven Rogak, among others.

Also featured is the original MATLAB code of [Kook et al. (2015)][kook]
modified slightly to accommodate the expected inputs and outputs common
to the other functions, and a modification thereof by Ramin Dastanpour
and Yiling Kang.

The PCM code is adapted from the work of [Dastanpour et al. (2016)][dastanpour2016].


#### References

1. [Kook et al., SAE Int. J. Engines (2015).][kook]
2. [Dastanpour et al., J. Powder Tech. (2016).][dastanpour2016]
3. [Dastanpour and Rogak, Aerosol Sci. Technol. (2014).][dastanpour2014]

[kook]: https://doi.org/10.4271/2015-01-1991
[dastanpour2016]: https://doi.org/10.1016/j.powtec.2016.03.027
[dastanpour2014]: https://doi.org/10.1080/02786826.2014.955565
