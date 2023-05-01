program random_umat
    integer n, i
    real(8), allocatable :: u(:, :)
    write(*, *) "input n (1~100) : "
    read(*,*) n 
    allocate ( u(n,n) )
    do i = 1, n 
        u(i,:) = 0.0d0
        call random_number(u(i,i:n))
        write(*, "(100e12.4)") u(i, 1:n)
    enddo
end program random_umat
