program case
    implicit none
    integer n,a 
    read(*,*) n
    select case(n)
    case(1)
        a = 1
    case(2)
        a = 2
    end select
    write(*,*)"a is : ", a
end program 