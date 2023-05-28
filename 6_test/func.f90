module functest
    implicit none
contains
    function testFunc(a,b)
        integer,intent(in) :: a,b
        integer :: testFunc
        testFunc = ( a + b ) ** b
    end function
end module 
program func
    use functest
    implicit none
    integer a,b,c
    a = 10
    b = 2
    c = testFunc(a,b)
    write(*,*) "ans is ", c
end program