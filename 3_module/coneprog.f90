module subprogs
    implicit none
contains
    function volCone(r, h) result(v)
        real(8), intent(in) :: r, h
        real(8) v, s, pi
        pi = 2.0d0 * acos(0.0d0)
        s = pi * r**2.0d0
        v = s * h / 3.0d0
    end function volCone
end module subprogs

program calcCone
    use subprogs
    implicit none
    real(8) a, b, vol
    a = 1.5d0
    b = 3.0d0
    vol = volCone(a,b)
    write(*,*) "volume is : " , vol
end program calcCone



