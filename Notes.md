<H1> MATLAB </H1>

* stands for MATrix LABoratory
* built-in editing and debugging tools
* supports object-oriented programming
* basic data element is an array that does not require dimensioning
* packages are called toolbox
* by default displays only 4 decimals in the result of the calculations
	- `>> format short`
  - `>> format long`
* whos will give more details which include size, space allocation, and class of the variable
	- `>> who`
* multiple statements per line
	* commas (,) or semicolons (;)
	* Commas (,) allow multiple statements per line without suppressing output
* clear the Command Window >> clc
* abort a MATLAB computation, type ctrl-c
* continue a line, type . . .

<H3> Help </H3>

* `>> help Command`
* `>> lookfor searchTerm`
* `>> doc plot	%online documentation`

<H3> Mathematical functions </H3>

* `cos(x)	%Cosine`
* `sin(x)	%Sine`
* `tan(x)	%Tangent`
* `acos(x)	%Arc cosine`
* `asin(x)	%Arc sine`
* `atan(x)	%Arc tangent`
* `exp(x)	%Exponential`
* `sqrt(x)	%Square root`
* `log(x)	%Natural logarithm`
* `log10(x)	%Common logarithm`
* `abs(x)	%Absolute`
* `sign(x)	%Signum function`
* `max(x)	%`
* `min(x)	%`
* `ceil(x)	%Round towards +∞`
* `floor(x)	%Round towards −∞`
* `round(x)	%Round to nearest integer`
* `rem(x)	%Remainder after division`
* `angle(x)	%Phase angle`
* `conj(x)	%Complex conjugate`

<H5> Constants </H5>

- `pi`
- `i,j`	%The imaginary unit i = sqrt(−1)
- `Inf`
- `NaN`	%Not a number

* `0:pi/100:2*pi` yields a vector that
  – starts at 0,
  – takes steps (or increments) of π/100,
  – stops when 2*pi is reached.

<H3> Vectors and Matrices </H3>

* A matrix is an array of numbers. To type a matrix,
  * begin with a square bracket, [
  * separate elements in a row with spaces or commas (,)
  * use a semicolon (;) to separate rows
  * end the matrix with another square bracket, ].
	  `>> A = [1 2 3; 4 5 6; 7 8 9]`
* null vector = []
	
<H5> Generation </H5>

* `linspace(a,b,n)` - generate linearly spaced vectors between and including a and b, n number of points
	  - `>> theta = linspace(0,2*pi,101)`
	  - divides the interval [0, 2π] into 100 equal subintervals, then creating a vector of 101 elements
* `eye(m,n)` - Returns an m-by-n matrix with 1 on the main diagonal
* `eye(n)` - Returns an n-by-n square identity matrix
* `zeros(m,n)` - Returns an m-by-n matrix of zeros
* `ones(m,n)` - Returns an m-by-n matrix of ones
* `diag(A)` - Extracts the diagonal of matrix A
* `rand(m,n)` - Returns an m-by-n matrix of random numbers

<H5> Special matrices </H5>

- `hilb` - Hilbert matrix
- `invhilb` - Inverse Hilbert matrix
- `magic` - Magic square
- `pascal` - Pascal matrix
- `toeplitz` - Toeplitz matrix
- `vander` - Vandermonde matrix
- `wilkinson` - Wilkinson’s eigenvalue test matrix

<H5> Indexing and Operations</H5>

* Single elements of a matrix are accessed as `A(i,j)`, where i ≥ 1 and j ≥ 1.
* Zero or negative subscripts are not supported
* <b> Colon operator</b>
	* `>> x = 0:0.1:5;`	%The row vector has 51 elements.
	* statement `A(m:n,k:l)` specifies rows m to n and column k to l
	* The colon operator can also be used to extract a sub-matrix from a matrix
		- `>> A(:,2:3)`	%all rows of A, columns 2 to 3
	* colon operator (:) stands for all columns or all rows. To create a vector version of matrix A
		- `>> A(:)`
	* `A(end,:)` picks out the last row of A
		* The keyword <b>end</b> denotes the last index in the specified dimension
* <b> Deleting row or column </b> - set it to null vector []
	- `>> A(3,:) = []`
* dimensions
	- `>> size(A)`
	- `>> [m,n]=size(A)`
* Transpose of a matrix, `A'`
* Concatenation, `A = [B; C; D E]`
* <b> Arithmetic Operations </b>
	* `A+B` or `B+A`
	* `A*B`
	* `A^2`
	* `α*A` or `A*α`
* Inverse, `inv(A)`
* Solving a system of linear equations by the process of Gaussian elimination, using the backslash (\)operator
	- `>> x = A\b	% x = inv(A)*b`
* Determinant, `det(A)`
* Norm, `norm(A)`
* Rank, Number of linearly independent rows or columns, `rank(A)`
* Diagonal matrices and diagonals of a matrix, `diag(A)`
* Eigenvalues and eigenvectors, `eig(A)`

<H3> Array Operations </H3>
	
  ```
  .*	%Element-by-element multiplication
	./	%Element-by-element division
	.^	%Element-by-element exponentiation
	.\	%Element-by-element left division
  ```

<H3> Plots </H3>
