module SimpleGF2

import Base: show, +, -, *, /, abs, convert, promote_rule, isless, real

export GF2

immutable GF2 <: Number
  val::UInt8
  function GF2{T<:Integer}(x::T)
    new(x&1)
  end
end

convert{T<:Integer}(::Type{GF2}, x::T) = GF2(x)
convert{T<:Integer}(::Type{T}, x::GF2) = T(x.val)

+(x::GF2,y::GF2) = GF2(x.val+y.val)
-(x::GF2,y::GF2) = GF2(x.val+y.val)
*(x::GF2,y::GF2) = GF2(x.val & y.val)
function /(x::GF2,y::GF2)
  if y.val == 0x00
    error("Division by zero in GF(2)")
  end
  return x
end
isless(x::GF2,y::GF2) = isless(x.val,y.val)
isless{T<:Real}(x::GF2,y::T) = isless(x.val,y)
isless{T<:Real}(x::T,y::GF2) = isless(x,y.val)

abs(x::GF2) = x
real(x::GF2) = x.val

promote_rule(::Type{GF2}, ::Type{Int} ) = GF2

function show(io::IO, x::GF2)
  if x.val == 0x00
    print(io,"GF2(0)")
  else
    print(io,"GF2(1)")
  end
end

end # end of module
