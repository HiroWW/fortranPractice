module mat_subporgs
    implicit none
contains
    subroutine print(a, n)
        integer, intent(in) :: n 
        real(8), intent(in) :: a(n,n)
        integer i
        do i = 1, n 
            write(*,"(100e12.4)") a(i,1:n)
        enddo
    end subroutine print
end module mat_subporgs

program main
    use mat_subporgs
    implicit none
    real(8),allocatable :: a(:,:)
    integer n
    write(*,*) "input n (1~100) : "
    read(*,*) n
    allocate( a(n,n) )
    call random_number(a(:,:))
    call print(a, n)
end program main



