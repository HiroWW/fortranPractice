module file_mod
    implicit none
    interface read_file_data
        module procedure &
            read_file_idata, &
            read_file_i2data, &
            read_file_ddata
    end interface
contains
    subroutine read_file_idata()
    end subroutine read_file_idata
end module file_mod
