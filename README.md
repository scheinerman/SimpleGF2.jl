# SimpleGF2

This a basic implementation of arithmetic in GF(2). Values in
GF(2) can be created like this:
```julia
julia> using SimpleGF2

julia> GF2(5)
GF2(1)

julia> GF2(4)
GF2(0)

julia> one(GF2)
GF2(1)

julia> zero(GF2)
GF2(0)
```
Matrices can be created with `ones`, `zeros`, and `eye`.
The `rand` function has been extended to return random
elements of GF(2). For example:
```julia
julia> A =rand(GF2,3,5)
3x5 Array{SimpleGF2.GF2,2}:
 GF2(0)  GF2(1)  GF2(1)  GF2(0)  GF2(0)
 GF2(1)  GF2(1)  GF2(1)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(0)  GF2(0)  GF2(1)
```
To see this clearly, you can map the values integers:
```julia
julia> map(Int,A)
3x5 Array{Int64,2}:
 0  1  1  0  0
 1  1  1  1  1
 0  0  0  0  1
```

Arithmetic with scalars and arrays of GF(2) elements
work as expected. For square matrices, `det` and `inv`
are available too:
```julia
julia> A = triu(ones(GF2,5,5))
5x5 Array{SimpleGF2.GF2,2}:
 GF2(1)  GF2(1)  GF2(1)  GF2(1)  GF2(1)
 GF2(0)  GF2(1)  GF2(1)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(1)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(0)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(0)  GF2(0)  GF2(1)

julia> inv(A)
5x5 Array{SimpleGF2.GF2,2}:
 GF2(1)  GF2(1)  GF2(0)  GF2(0)  GF2(0)
 GF2(0)  GF2(1)  GF2(1)  GF2(0)  GF2(0)
 GF2(0)  GF2(0)  GF2(1)  GF2(1)  GF2(0)
 GF2(0)  GF2(0)  GF2(0)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(0)  GF2(0)  GF2(1)

julia> A = triu(ones(GF2,4,4))
4x4 Array{SimpleGF2.GF2,2}:
 GF2(1)  GF2(1)  GF2(1)  GF2(1)
 GF2(0)  GF2(1)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(0)  GF2(1)

julia> det(A)
GF2(1)

julia> B = inv(A)
4x4 Array{SimpleGF2.GF2,2}:
 GF2(1)  GF2(1)  GF2(0)  GF2(0)
 GF2(0)  GF2(1)  GF2(1)  GF2(0)
 GF2(0)  GF2(0)  GF2(1)  GF2(1)
 GF2(0)  GF2(0)  GF2(0)  GF2(1)

julia> A*B
4x4 Array{SimpleGF2.GF2,2}:
 GF2(1)  GF2(0)  GF2(0)  GF2(0)
 GF2(0)  GF2(1)  GF2(0)  GF2(0)
 GF2(0)  GF2(0)  GF2(1)  GF2(0)
 GF2(0)  GF2(0)  GF2(0)  GF2(1)
 ```


## Additional functionality

(This documentation to be written later.)

`rref`, `rref!`, `solve`, `solve_all`, `nullspace`

Thanks to Tara Abrishami.

Installation
------------

 Install with
 ```
 Pkg.clone("https://github.com/scheinerman/SimpleGraphRepresentations.jl.git")
 ```

 And then specify `using SimpleGF2` to use the `GF2` numbers.


`GF2` polynomials
-----------------

The `SimpleGF2` module is compatible with the `Polynomials` package.

```julia
julia> using Polynomials

julia> x = Poly( [ GF2(0); GF2(1) ] )
Poly(x)

julia> (x+1)^4
Poly(GF2(1) + x^4)
```

## Acknowledgement

Thanks to Tara Abrishami for her contributions to this module.M
