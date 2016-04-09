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

Arithmetic with scalars and arrays of GF(2) elements should
work as expected. For square matrices, `det` and `inv` work
as expected.
