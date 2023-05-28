program read_data
    implicit none
    double precision :: sigma, cl, cd
    double precision :: mu(2)
    integer :: iostatus
    character(len=100) :: filename
    integer :: unit
    ! ファイル名を指定
    filename = "inputALM.txt"
    ! ファイルをオープン
    open(newunit=unit, file=filename, status='old', action='read', iostat=iostatus)

    if (iostatus == 0) then
        ! ファイルからデータを読み込む
        read(unit, *) sigma
        read(unit, *) cl
        read(unit, *) cd
        read(unit, *) mu(1), mu(2)
        ! ファイルをクローズ
        close(unit)
    else
        write(*, *) "ファイルのオープンに失敗しました。"
        stop
    end if
    ! 読み込んだデータの表示
    write(*, *) "sigma =", sigma
    write(*, *) "cl =", cl
    write(*, *) "cd =", cd
    write(*, *) "mu(1) =", mu(1)
    write(*, *) "mu(2) =", mu(2)
end program read_data
