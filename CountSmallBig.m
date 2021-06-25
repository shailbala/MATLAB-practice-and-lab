a = [25, 45, 6, 10, 0, 5, 20, 7, 41, 9];
high = zeros(size(a));
low = zeros(size(a));

for i=1:size(a,2)
    hCount = 0;
    lCount = 0;
    for element=a
        if element > a(i)
            hCount = hCount + 1;
        elseif element < a(i)
            lCount = lCount + 1;
        end
    end
    high(i) = hCount;
    low(i) = lCount;
end
%disp(high);
%disp(low);
c = [a;low;high];
