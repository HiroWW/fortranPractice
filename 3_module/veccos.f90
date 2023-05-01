module veccos
    implicit none
contains
    function calcCos(a, b) result(co)
        real(8), intent(in) :: a(:), b(:)
        real(8) co
        co = dot_product(a,b) / sqrt(dot_product(a,a) * dot_product(b,b))
    end function
end module veccos

program main
    use veccos
    implicit none
    real(8) a(3), b(3), ans
    a(:) = (/1d0,2d0,3d0/)
    b(:) = (/2d0,5d0,6d0/)
    ans = calcCos(a,b)
    write(*,*) "ans is : ", ans
end program main
