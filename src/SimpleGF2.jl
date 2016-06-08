module SimpleGF2

import Base: show, +, -, *, /, $, &, |, abs
import Base: convert, promote_rule, isless, real, rand


export GF2

immutable GF2 <: Number
  val::UInt8
  function GF2{T<:Integer}(x::T)
    new(x&1)
  end
end

convert{T<:Integer}(::Type{GF2}, x::T) = GF2(x)
convert{T<:Integer}(::Type{T}, x::GF2) = T(x.val)

+(x::GF2,y::GF2) = GF2(x.val+y.val)    # addition
-(x::GF2,y::GF2) = GF2(x.val+y.val)    # subtraction
-(x::GF2) = x                          # unary minus
*(x::GF2,y::GF2) = GF2(x.val & y.val)  # multiplication
function /(x::GF2,y::GF2)              # division
  if y.val == 0x00
    error("Division by zero in GF(2)")
  end
  return x
end

# Bitwise operators
($)(x::GF2,y::GF2) = GF2(x.val$y.val)   # XOR
(&)(x::GF2,y::GF2) = GF2(x.val&y.val)   # AND
(|)(x::GF2,y::GF2) = GF2(x.val|y.val)   # OR

# isless defined giving all relations
isless(x::GF2,y::GF2) = isless(x.val,y.val)
isless{T<:Real}(x::GF2,y::T) = isless(x.val,y)
isless{T<:Real}(x::T,y::GF2) = isless(x,y.val)

abs(x::GF2) = x
real(x::GF2) = x.val

# random values and matrices
rand(::Type{GF2}) = GF2(rand(Int))
rand(::Type{GF2},dims::Integer...) = map(GF2,rand(Int,dims...))

promote_rule(::Type{GF2}, ::Type{Int} ) = GF2

function show(io::IO, x::GF2)
  if x.val == 0x00
    print(io,"GF2(0)")
  else
    print(io,"GF2(1)")
  end
end

include("solving.jl")
include("GF2inv.jl")

end # end of module
