export rref, rref!, solve, solve_augmented

"""
`swap_rows!(A,i,j)` swaps rows `i` and `j` in the matrix `A`.
"""
function swap_rows!{T}(A::Array{T,2}, i::Int, j::Int)
  if i==j
    return nothing
  end
  A[ [i,j], :] = A[ [j,i], :]
  return nothing
end


"""
`add_row_to_row!(A,i,j)` adds row `i` to row `j` in the matrix `A`.
"""
function add_row_to_row!{T<:Number}(A::Array{T,2},i::Int,j::Int)
  A[j,:] += A[i,:]
  return nothing
end

# The following functions developed by Tara Abrishami

"""
`rref!(A)` overwrites `A` with its row reduced echelon form.
"""
function rref!(A::Array{GF2,2})
  r, c = size(A)
  for x in 1:c
    if x > r
      break
    end
    if A[x, x] == 0
      for y in x:r
        if A[y, x] == 1
          swap_rows!(A, y, x)
          break
        end
      end
    end
    for m in 1:r
      if m != x && A[m, x] == 1
        add_row_to_row!(A, x, m)
      end
    end
  end
end

"""
`rref(A)` returns the row reduced echelon form of `A`.
"""
function rref(A::Array{GF2,2})
  AA = copy(A)
  rref!(AA)
  return AA
end


"""
`solve(A,b)` returns a solution `x` to the linear system
`A*x == b` or throws an error if no solution can be found.
"""

function solve(A::Array{GF2, 2}, b::Array{GF2, 1})
  r, c = size(A)
  if r != size(b)[1]
    error("Dimensionally incorrect input")
  end
  C = [A b]
  rref!(C)
  x = 0
  for a in 1:r
   in = true
   for b in 1:c
     if C[a, b] != 0
       in = false
     end
   end
   if in && C[a, c+1] != 0
     error("Inconsistent system")
   end
 end
  ret = zeros(GF2, c)
  for p in 1:r
    if C[r, c+1] == 1
      for l in 1:c
        if C[r, l] == 1
          ret[l] = 1
          break
        end
      end
    end
  end
  return ret
end

# returns a single solution to the system with matrix C1
function solve_augmented(C1::Array{GF2, 2})
  r, c = size(C1)
  D = deepcopy(C1)
  rref!(D)
  x = 0
  for a in 1:r
   in = true
   for b in 1:c-1
     if D[a, b] != 0
       in = false
     end
   end
   if in && D[a, c] != 0
     error("Inconsistent system")
   end
 end
  ret = zeros(GF2, c-1)
  for p in 1:r
    if D[r, c] == 1
      for l in 1:c-1
        if D[r, l] == 1
          ret[l] = 1
          break
        end
      end
    end
  end
  return ret
end
