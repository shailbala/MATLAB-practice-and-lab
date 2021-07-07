% fibonacci
n=input("Number of Fibonacci Numbers to print: ");
a = 0;
b = 1;

% n should be >= 0
if n <= 0
    disp('Incorrect input');
else if n == 1
        disp(a);
    else
        disp(a);
        disp(b);
        for i=3:n
            c = a + b;
            a = b;
            b = c;
            disp(c);
        end
    end
end
