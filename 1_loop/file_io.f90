program file_io
    implicit none
    real(8) x,y,d,z
    integer :: n,i,j,fi=10,fo=11
    ! write(*,*) "input n : "
    ! read(*,*) n
    open(fi, file = "input.d")
    open(fo, file = "output.d")
    read(fi, *) n 
    close(fi)
    if (n < 3) stop "stop : n < 3"
    d = 10 / dble(n-1)
    do i = 1, n
        y = -5.0d0 + dble(i-1) * d
        do j = 1, n 
            x = -5.0d0 + dble(j-1) * d
            z = sin(x) * cos(y)
            write(fo,"(3e12.4)")x,y,z
        enddo
        write(fo,*)""
    enddo
    close(fo)
end program file_io


