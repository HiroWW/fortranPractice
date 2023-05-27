program type
    implicit none
    ! 派生型（クラス）の定義
    type :: UTcart
        integer :: a
        real(8) :: b
    end type
    
    ! 派生型のインスタンスの宣言
    type(UTcart) :: star
    
    ! Fortranではドット演算子の代わりに%を用いる
    star%a = 3
    
    write(*,*) "a in UTcart is ", star%a
end program 