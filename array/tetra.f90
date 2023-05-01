program tetra
    implicit none
    integer m, n  
    real(8) p(3, 4)
    ! do m = 1, 4
    !     do i = 1, 3
    !         call random_number(u(i, m))
    !     enddo
    !     write(*,*) u(:, m)
    ! enddo
    ! 上の処理は以下のようにすることで一行で実装可能
    call random_number(p(1:3, 1:4))
    open(10, file = "tetra.d")
    do m = 1, 3
        do n = m + 1, 4
            write(10, *) p(1:3, m)
            write(10, *) p(1:3, n)
            write(10, *) "" 
        enddo
    enddo
    close(10)
end program tetra
