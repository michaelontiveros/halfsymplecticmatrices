\\ H = [A, B] is a half-symplectic matrix


rank(H) = #H[1]


{
oneMinus(H, i) = 
  local(A, B, Hnew);
  [A, B] = H;
  [A[,i], B[,i]] = [B[,i], A[,i]];
  Hnew = [A, B];
  return(Hnew)
}


{
oneOver(H, i) = 
  local(A, B, Hnew);
  [A, B] = H;
  [A[,i], B[,i]] = [B[,i] - A[,i], B[,i]];
  Hnew = [A, B];
  return(Hnew)
}


{
renumber(H, i) =
  local(H1, H2, Hvec);
  H1 = oneMinus(oneOver(H, i + 1), i + 1);
  H2 = oneOver(oneMinus(H, i + 1), i + 1);
  if(i == rank(H) - 1,
    Hvec = [H, H1, H2],
    Hvec = concat(renumber(H, i + 1), concat(renumber(H1, i + 1), renumber(H2, i + 1)))
  );
  return(Hvec)
}


{
twoThree(H) =
  local(A, B, Anew, Bnew, Hnew);
  [A, B] = H;
  Anew = [-1,               0,                        0; 
           B[1,1] + B[1,2], B[1,1] - A[1,1] + A[1,2], B[1,2] + A[1,1] - A[1,2]; 
           B[2,1] + B[2,2], B[2,1] - A[2,1] + A[2,2], B[2,2] + A[2,1] - A[2,2]];
  Bnew = [-1,  1,       1; 
           0, -A[1,1], -A[1,2]; 
           0, -A[2,1], -A[2,2]];
  Hnew = [Anew, Bnew];
  return(Hnew)
}