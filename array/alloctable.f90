program dotp3
    implicit none
    real(8), allocatable :: u(:), v(:)
    integer :: i, n = 2
    real(8) dotp
    allocate (u(n), v(n))
    write(*,*) dot_product(u, v)
    deallocate (u, v)
end program dotp3