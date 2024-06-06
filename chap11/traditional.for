do i = 1, n
  a[i] = a[i] + c*i
end do



T = c
do i = 1, n
    a[i] = a[i] + T
    T = T + c
end do



do i = 2, n
    a[i] = a[i] + c
    if (x < 7) then
        b[i] = a[i] * c[i]
    else
        b[i] = a[i-1] * b[i-1]
    endif
end do


if (n > 1) then
    if (x < 7) then
        do all i = 2, n
            a[i] = a[i] + c
            b[i] = a[i] * c[i]
        endi do all
    else
        do i = 2, n
            a[i] = a[i] + c
            b[i] = a[i-1] * c[i-1]
        endi do 
    end if
end if



