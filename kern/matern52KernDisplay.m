function matern52KernDisplay(kern, spacing)

% MATERN52KERNDISPLAY Display parameters of the MATERN52 kernel.
% FORMAT
% DESC displays the parameters of the matern kernel with nu=5/2
% kernel and the kernel type to the console.
% ARG kern : the kernel to display.
%
% FORMAT does the same as above, but indents the display according
% to the amount specified.
% ARG kern : the kernel to display.
% ARG spacing : how many spaces to indent the display of the kernel by.
%
% SEEALSO : matern52KernParamInit, modelDisplay, kernDisplay
%
% COPYRIGHT : Neil D. Lawrence, 2006

% KERN


if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('Matern, nu=5/2, length scale: %2.4f\n', ...
        kern.lengthScale);
fprintf(spacing);
fprintf('Matern, nu=5/2, variance: %2.4f\n', kern.variance)
