%Graphene function
function pos = Graphene(n,m,len)
    a1=[sqrt(3), 0];                     %Defining a1 
    a2=[sqrt(3)/2, -(3/2)];              %Defining a2
    
    Ch=n*a1+m*a2;                       %Creating Ch vector based off of n and m
    ChUnit=Ch/(sqrt(Ch(1)^2+Ch(2)^2));  %Creating the unit vector of Ch
    T=[-ChUnit(2)*len,ChUnit(1)*len];   %Creating T vector using inverse of Ch vector components
    
    ChLeg=[0:((sqrt(3))/2):Ch(1)+T(1)];   %Coordinates in x-direction which span the horizontal length of defined by Ch and T vector 
    Tleg=[Ch(2):1.5:len];                 %Coordinates in y-direction which span the vertical length defined by len.
    z=0;                                  %z coordinates are all 0 because we're only in 2D for the sheet
    
    [x,y,z]=meshgrid(ChLeg,Tleg,z);     %Creating the meshgrid from which we will cut our sheet from
    
    y(1:2:end,2:2:end)=y(1:2:end,2:2:end)-0.5; %Shifting the coordinates to form hexagonal grid
                                               %on values where x is odd
                                               %and y is even
                                               
    y(2:2:end,1:2:end)=y(2:2:end,1:2:end)-0.5; %Shifting the coordinates to form hexagonal grid
                                               %where x is even and y odd
    
                                            
    [in,on]=inpolygon(x,y,[0,Ch(1),(Ch(1)+T(1)),T(1)],[0,Ch(2),(T(2)+Ch(2)),T(2)]); %Filling the in and on array with points 
                                                                                    %falling within boundary defined by Ch and T
                                                                                    %vectors
    
    x=x(in|on);                 %Assigning x with x coordinates which are within or on boundary
    y=y(in|on);                 %Assigning y with y coordinates which are within or on boundary
    
    x=reshape(x,size(x,1),1);    %Formatting x into a column array
    y=reshape(y,size(y,1),1);    %Formatting y into a column array
    
    pos=zeros(numel(x),3);      %Filling pos into an Nx3 matrix with the x, y, and z values
    pos(:,1)=x;
    pos(:,2)=y;
    pos(:,3)=0; 
end