% ----------------------------------------------------------------------
%  MAIN PROGRAM - generated by the Rappture Builder
% ----------------------------------------------------------------------

% open the XML file containing the run parameters
% the file name comes in from the command-line via variable 'infile'
io = rpLib(infile);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get input values from Rappture
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get input value for input.integer(numax)
numax = int32(rpLibGetDouble(io,'input.integer(numax).current'));

% get input value for input.number(xmax)
xmax = rpLibGetDouble(io,'input.number(xmax).current');

% get input value for input.integer(npts)
npts = int32(rpLibGetDouble(io,'input.integer(npts).current'));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Add your code here for the main body of your program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nu = linspace(0,numax,npts);
x = linspace(0,xmax,npts);
[xx,yy] = meshgrid(x,nu);
z = besselj(xx,yy);

% spit out progress messages as you go along...
rpUtilsProgress(0, 'Starting...');
rpUtilsProgress(5, 'Loading data...');
rpUtilsProgress(50, 'Half-way there');
rpUtilsProgress(100, 'Done');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save output values back to Rappture
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vals = reshape(z', npts*npts,1);
str = sprintf('%12g\n', vals);

%display the field
rpLibPutString(io, 'output.field(z).component.values', str, 0);
%display the field on the mesh
rpLibPutString(io, 'output.field(z).component.mesh', 'output.mesh(mygrid)', 0);
rpLibPutString(io, 'output.field(z).about.view', 'heightmap', 0);

%must set min, max and numpoints for xaxis and yaxis
rpLibPutString(io, 'output.mesh(mygrid).grid.xaxis.min', '0', 0);
rpLibPutString(io, 'output.mesh(mygrid).grid.xaxis.max', num2str(xmax), 0);
rpLibPutString(io, 'output.mesh(mygrid).grid.xaxis.numpoints', num2str(npts), 0);
rpLibPutString(io, 'output.mesh(mygrid).grid.yaxis.min', '0', 0);
rpLibPutString(io, 'output.mesh(mygrid).grid.yaxis.max', num2str(numax), 0);
rpLibPutString(io, 'output.mesh(mygrid).grid.yaxis.numpoints', num2str(npts), 0);
%hide mesh
rpLibPutString(io, 'output.mesh(mygrid).hide', 'yes', 0);

rpLibResult(io);
quit;
