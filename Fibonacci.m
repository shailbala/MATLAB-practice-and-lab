a = [25, 45, 6, 10, 0, 5, 20, 7, 41, 9];
big = zeros(size(a));
small = zeros(size(a));

for i=1:size(a,2)
    b = 0;
    s = 0;
    for j=1:size(a,2)
        if a(j) > a(i)
            b = b + 1;
        elseif a(j) < a(i)
            s = s + 1;
        end
    end
    big(i) = b;
    small(i) = s;
end
c = [a;small;big]
