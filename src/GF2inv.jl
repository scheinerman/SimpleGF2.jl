import Base.inv



# for debugging purposes only
function miniprint(A::Array{GF2,2})
  B = map(Int,A)
  println(B)
end

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
`add_row_to_row!(A,i,j)` adds row `i` to row `j` in the
matrix `A`.
"""
function add_row_to_row!{T<:Number}(A::Array{T,2},i::Int,j::Int)
  A[j,:] += A[i,:]
  return nothing
end

function inv(A::Array{GF2,2})
  const DEBUG::Bool=false
  n,m = size(A)
  if n!= m
    error("Cannot inverse a matrix that isn't square.")
  end
  if det(A)==0
    error("Cannot invert a singular matrix.")
  end

  B = [A  eye(GF2,n)]

  if DEBUG
    miniprint(B)
  end

  for col = 1:n
    # make sure there's a one in the col,col position
    if B[col,col] == 0   # if there isn't swap a row from below
      for r=col:n
        if B[r,col] == 1 # found one; swap rows r & col
          swap_rows!(B,r,col)
          # tmp = B[r,:]
          # B[r,:] = B[col,:]
          # B[col,:] = tmp
          if DEBUG
            println("Swapping rows $col and $r")
            miniprint(B)
          end
          break
        end
      end
    end
    # now use this position to clean up column col
    for r=1:n
      if r != col && B[r,col]==1  # kill this 1
        add_row_to_row!(B,col,r)
        # B[r,:] += B[col,:]
      end
    end
    if DEBUG
      println("Cleaning column $col")
      miniprint(B)
    end
  end

  return B[:,n+1:end]
end
