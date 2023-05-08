module interface_mod
    interface
        subroutine matnorm(smat,s1,s2)
            real(8), intent(in) :: smat(:, :)
            real(8), intent(out), optional :: s1, s2
        end subroutine matnorm
    end interface
end module interface_mod

subroutine matnorm(smat,s1,s2)
    implicit none
    real(8), intent(in) :: smat(:, :)
    real(8), intent(out), optional :: s1, s2
    real(8) as1(size(smat,2)), as2(size(smat,1))
    integer i
    if (present(s1)) then
        do i = 1, size(as1)
            as1(i) = sum(abs(smat(:,i)))
        enddo
        s1 = maxval(as1)
    endif
    if (present(s2)) then
        do i = 1, size(as2)
            as2(i) = sum(abs(smat(i,:)))
        enddo
        s2 = maxval(as2)
    endif
end subroutine

program main
    use interface_mod
    implicit none
    real(8) w1, w2, a(100,100)
    call random_seed
    call random_number(a)
    call matnorm(a,w1,w2)
    write(*,*) "w1 is ", w1, "w2 is ", w2
    write(*,*) "just calling w1 "
    call matnorm(a,w1)
    write(*,*) "w1 is ", w1 
end program
