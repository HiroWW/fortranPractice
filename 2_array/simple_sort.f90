program simple_sort
    implicit none
    integer, parameter :: n = 100
    real(8) a(n)
    call random_seed
    call random_number( a(:) )

end program simple_sort