module ifmod
    interface
        function normal_vec(v) result(nv)
            ! implicit none
            real(8), intent(in) :: v(:)
            real(8) nv(size(v))
        end function normal_vec
    end interface
end module ifmod
