program main
    use ifmod
    implicit none
    real(8) :: a(2)  = (/3.0d0,4.0d0/), na(2)
    na(:) = normal_vec(a)
    write(*,*) na(:)
end program main
