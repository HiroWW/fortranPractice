module subprogs
    implicit none
contains
    function vnorm(vec, norm) result(nvec)
        real(8), intent(in) :: vec(:)
        real(8), intent(in), optional :: norm ! optional属性を指定する
        real(8) :: nvec(size(vec))
        real(8) vecl, factor
        vecl = dot_product(vec, vec)
        if (present(norm)) then
            factor = norm
        else
            factor = 1.0d0
        endif
        if (vecl == 0.0d0) then
            nvec(:) 0.0d0
        else
            vecl = factor / sqrt(vecl)
            nvec(:) = vecl * vec(:)
        endif
    end function vnorm
end module subprogs

