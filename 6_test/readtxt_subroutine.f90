module read
    implicit none
contains
    subroutine readout
        double precision :: rsigma, rcl, rcd
        double precision :: rmu(2)  
        ! サブルーチンを呼び出してデータを読み込む
        call read_data(rsigma, rcl, rcd, rmu)
        ! 読み込んだデータの表示
        write(*, *) "sigma =", rsigma
        write(*, *) "cl =", rcl
        write(*, *) "cd =", rcd
        write(*, *) "mu(1) =", rmu(1)
        write(*, *) "mu(2) =", rmu(2)
    contains
        subroutine read_data(sigma, cl, cd, mu)
            implicit none
            double precision, intent(out) :: sigma, cl, cd
            double precision, intent(out) :: mu(2)
            character(len=100) :: filename
            integer :: unit, iostatus

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
        end subroutine read_data
    end subroutine readout
end module

program main
    use read
    implicit none
    call readout
end program main