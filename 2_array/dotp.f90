program dotp1
    implicit none
    real(8) u(2),v(2)
    real(8) :: dotp = 0.0d0
    !integer i
    ! dotp = 0.0d0
    ! u(1) = 1.2d0
    ! u(2) = 3.4d0
    u(1:2) = (/ 1.2d0, 3.4d0 /) !
    v(1) = 4.1d0
    v(2) = 2.6d0
    ! do i = 1, 2
    !     dotp = dotp + u(i) * v(i)
    !     ! dotp = u(3)
    ! enddo
    dotp = dot_product(u, v)
    write(*,*) dotp

end program dotp1
