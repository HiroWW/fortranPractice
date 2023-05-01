program tetrahedron
    implicit none
    integer, parameter :: dp = selected_real_kind(15, 307)
    real(dp) :: p(3, 4), r
    integer :: i, j
    character(len=100) :: command
    open(10, file='tetrahedron.dat', status='replace')
    do i = 1, 4
      do j = 1, 3
        call random_number(r)
        p(j, i) = r
      end do
      write(10, '(4f10.6)') (p(j, i), j=1,3)
    end do
    close(10)
    command = 'gnuplot -p -e "splot ''tetrahedron.dat'' w l"'
    call execute_command_line(command)
  end program tetrahedron
  