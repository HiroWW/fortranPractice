program loop !プログラム文（名称の指定）
    implicit none
    integer i, wa
    wa = 0
    do i = 1, 100
        wa = wa + i
    enddo
    write(*, *) 'wa = ' , wa
end program loop