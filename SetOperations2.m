%% Date 14-May-2021
% Menu Driven Program
% Write a Menu Driven Program to take 2 sets (vectors)
% and solve for these operations:
% Union, Intersection, Complement
% 
% Commutativity, Associativity
% Distributivity
% DeMorgan's Law

disp('Enter numbers between 1-50 only:');
U = 1:50;   %universal set
a = input('Enter 1st set of numbers: ');
b = input('Enter 2nd set of numbers: ');
%a = [1 2 3 4 5 6];
%b = [7 8 1 2 5 9];
c = [20 15 19 21 5];

%% union, intersection
aUb = union(a,b);
aIb = intersection(a,b);

%% Menu driven
ctr = 'Y';
while ctr == 'Y' | ctr == 'y'
    disp('MENU: Operations-List');
    disp('1.Union');
    disp('2.Intersection');
    disp('3.Complement');
    disp('4.Commutativity')
    disp('5.Associativity')
    disp('6.Distributivity')
    disp('7.DeMorgan-s Law');
    op = input('Enter operation: ');
    switch op
        case 1  %union
            disp('Union of given two sets is:');
            disp(aUb);
        case 2  %intersection
            disp('Intersection of given two sets is:');
            disp(aIb);
        case 3 %complement
            c1 = complement(a,U);
            c2 = complement(b,U);
            disp('The complement of a in U is');
            disp(c1);
            disp('The complement of b in U is');
            disp(c2);
        case 4 %commutativity aUb equals bUa, aIntb equals bIntA
            % find bUa and bIntA
            bUa = union(b,a);
            bIa = intersection(b,a);
            
            if sort(aUb) == sort(bUa)
                disp('Union of A and B equals Union of B and A');
                disp('Thus, Union is commutative');
            end
            if sort(aIb) == sort(bIa)
                disp('Intersection of A and B equals Intersection of B and A');
                disp('Thus, Intersection is commutative');
            end
        case 5 %associativity
            % a Union b already found in aUb
            % Find (a Union b) Union c
            % Find b Union c
            abUc = union(aUb, c);
            % a Intersection b, already found in aIb
            %% Find (a Intersection b) Intersection c, abIc
            abIc = intersection(intersection(a,b),c);
            %% Find Union and Intersection of bc with a
            aUbc = union(a,union(b,c));    %for union, init with b Union c
            aIbc = intersection(a,intersection(b,c));     %for intersection, init empty
            if sort(aUbc) == sort(abUc)
                disp(' ');
                disp('Union is Associative:');
                disp('(A Union B) Union C equals A Union (B Union C)');
            end
            if sort(aIbc) == sort(abIc)
                disp(' ');
                disp('Intersection is Associative:');
                disp('(A Intersection B) Intersection C equals A Intersection (B Intersection C)');
            end
        case 6 %distribitivity
            %% a Union (b Intersection c) = (a Union b) Intersection (a Union c)
            aUbIc = union(a,intersection(b,c));
            aUbIaUc = intersection(aUb, union(a,c));
            size(aUbIaUc);
            size(aUbIc);
            %% Compare and display the result
            if sort(aUbIc) == sort(aUbIaUc)
                disp(' ');
                disp('Set Operations follow Distributive Law!');
                disp('a Union (b Intersection c) equals (a Union b) Intersection (b Union c)');
            end
        case 7 %de morgan
            %% (a Union b)Complement = aComplement Intersection bComplement
            % aUb = a Union b
            aUb = union(a,b);
            %% aUb Complement
            % correct
            aUbC=complement(aUb, U);
            %% a Complement, b Complement
            aC = complement(a, U);
            bC = complement(b, U);
            %% aC Intersection bC
            aCIbC = intersection(aC, bC);
            %% compare and print
            if sort(aUbC) == sort(aCIbC)
                disp(' ');
                disp('Set operations follow De-Morgans Law!'); 
                disp('Complement of a Union b equals the Intersection of a Complement and b Complement');
            end
        otherwise
            disp('Error: Operation not found');
    end
    disp(' ');
    ctr = input('Continue? (Y)', 's');
end

function u = union(a,b)
aUb = a;
aIb = [];
for i=b
     % remove all common occurrences, (for union)
     aUb = aUb(aUb~=i);
end
% add aUb and b in aUb to get final union
u = [aUb b]; 
end

function k = intersection(a,b)
%disp('Inside complement function');;
%a;
%b;
k = [];
for i=b
     % check if the element is present in both
     if sum(i==a) > 0
         % add it to intersection k
         k = [k i];
     end
end
end

function c = complement(a, U)
c = U;
for i=a
    % remove all common occurrences of a from U
    c = c(c~=i);
end
end