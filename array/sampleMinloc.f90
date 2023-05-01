program sample
    implicit none
    integer, parameter :: n = 100
    real(8) wa, m1 ,m2 ,b(n,n)
    integer i, j, i1(2), i2(2)
    call random_seed
    call random_number(b(:,:))
    write(*,*) minval(b), maxval(b), sum(b), minloc(b), maxloc(b)
end program sample