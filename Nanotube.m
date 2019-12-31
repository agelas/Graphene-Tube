%Nanotube function
function pos = Nanotube(n,m,len)

    pos = Graphene(n,m,len);    %Feeding data to graphene 
    
    a1=[sqrt(3),0];             %Defining a1
    a2=[sqrt(3)/2,-(3/2)];      %Defining a2
    
    Ch=n*a1+m*a2;                       %Creating Ch vector based off of n and m
    ChNorm=Ch/sqrt(Ch(1)^2+Ch(2)^2);    %Creating the unit vector of Ch
    T=[-ChNorm(2)*len,ChNorm(1)*len];   %Creating T vector using inverse of Ch vector components
    
    mouthUnit=norm(Ch,2);               %Magnitude of mouth vector
   
    radius=mouthUnit/(2*pi);            %Finding the radius
        
    tMag=norm(T,2);                     %Calculating the magnitude of t vector

    vec=[pos(:,1), pos(:,2)];       %Pulls x and y coordinates from pos
    
    d=(vec*Ch')/mouthUnit;          %Linalg form of dot product, makes matrix construction easier later. 
                                    %d finds the orthogonal projection of atom onto
                                    %mouth vector. 
                           
    newT=(vec*T')/tMag;             %Linalg form of dot product. NewT finds orthogonal projection of atom 
                                    %onto T vector. 
    
    logic_index=d<mouthUnit;        %Logical index for d<mouthUnit, which prevents overlapping from happening                
    d=d(logic_index);               %Restricts d to values less than mouthUnit
    newT=newT(logic_index);         %Restricts newT to those which correspond to valid d points
               
    pos=[radius*cos(d/radius), radius*sin(d/radius), newT]; %Filling in pos with all the data
   
end