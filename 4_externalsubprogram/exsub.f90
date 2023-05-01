function normal_vec(v) result(nv)
    implicit none
    real(8), intent(in) :: v(:)
    real(8) nv(size(v,1)), vl
    vl = sqrt(dot_product(v,v))
    if (vl == 0.0d0) then
        nv(:) = 0.0d0
    else
        nv(:) = v(:) / vl 
    endif
end function normal_vec 
