program rnum
    implicit none
    integer i, n
    real(8), allocatable :: a(:), b(:)
    write(*,*) "input n (>=1) : "
    read(*,*)  n 
    allocate ( a(n), b(n) )
    do i = 1, n 
        call random_number(a(i))
    enddo
    b(:) = a(:) * 2.0d0 - 1.0d0
    write(*,*) b(:)
end program rnum