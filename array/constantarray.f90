program constantarray
    implicit none
    integer i 
    !parameter属性をつけて整数定数を宣言している
    integer, parameter :: n = 2
    real(8) u(n), v(n), dotp
    n = 3 !別の値をparamter属性に入れてみるとコンパイルエラーを起こす
    dotp = 0.0d0
    do i = 1, n 
        dotp = dotp + u(i) * v(i)
    enddo
    write(*, *) "dot product = ", dotp
end program constantarray