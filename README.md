# Graphene-Tube
As if the element carbon doesn't already do enough of the heavy lifting on this planet, it turns out that one can create interesting 
goemetric structures from carbon, which in turn, can form the backbone of new materials and structures. One of these structures is 
the carbon nanotube, a structure that can be used for purposes ranging from water filtration to drug delivery, to name but a few options. This collection of MATLAB functions produces the necessary arrangement of points to simulate the construction of a carbon nanotube.

To run:
The Graphene function takes 3 inputs: n,m, and len. n and m describe the vectors used to create hexagonal lattice of the graphene sheet.
len is how long of a tube you want.
The Nanotube function calls graphene to make the sheet, and then wraps it up all nice.
The plotAtom function displays the actual carbon nanotube. To see the final product you'd enter something like plotAtom(Nanotube(6,0,5))
in the MATLAB command line. Or if you just want to see the 2D graphene sheet, you'd enter plotAtom(Graphene(6,0,5)).  
