program newton
    !newton法で入力aの平方根を数値計算する
    implicit none
    real(8) alpha
    integer i, n, a
    write(*,*) "input a : "
    read(*,*) a
    n = 1000
    alpha = dble(a)
    do i = 0, n
        alpha = alpha - (alpha**2 - dble(a)) /(2 * alpha)
    enddo
    write(*,*) "ans is : ", alpha
end program newton