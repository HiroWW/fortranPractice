module eval2
    implicit none
contains 
    function eval2x2mat(a) result(x)
        real(8), intent(in) :: a(2,2)
        real(8) x(2)
        if ((a(1,1)+a(2,2))**2.0d0 + 4.0d0*a(1,2)*a(2,1) < 0) return
        x(1) = ( a(1,1)+a(2,2) + sqrt((a(1,1)+a(2,2))**2.0d0 + 4.0d0*(a(1,2)*a(2,1)-a(1,1)*a(2,2))) ) / 2.0d0
        x(2) = ( a(1,1)+a(2,2) - sqrt((a(1,1)+a(2,2))**2.0d0 + 4.0d0*(a(1,2)*a(2,1)-a(1,1)*a(2,2))) ) / 2.0d0
    end function
end module eval2

program main
    use eval2
    implicit none
    real(8) a(2,2), x(2)
    a(1,:) = (/ 4.0d0, 1.0d0 /)
    a(2,:) = (/-2.0d0, 1.0d0 /)
    x = eval2x2mat(a)
    write(*,*) x
    ! test adding
end program
