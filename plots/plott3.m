
figure
%fimplicit(@(x,y) (x.^2 + y.^2).^2
fimplicit(@(x,y) x.^2 - y.^2 - 1, '.b');

title({'Function', 'x.^2 - y.^2 - 1'});