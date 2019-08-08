program sinedistort

  implicit none
  
  call run_fft()

end

subroutine run_fft ( )

    implicit none
  
    integer ( kind = 4 ), parameter :: n = 8192
  
    integer ( kind = 4 ) ier
    integer ( kind = 4 ) inc
    integer ( kind = 4 ) lenr
    integer ( kind = 4 ) lensav
    integer ( kind = 4 ) lenwrk
    integer ( kind = 4 ) i
    integer ( kind = 4 ) j
    real ( kind = 8 ) r(n)
    real ( kind = 8 ), allocatable, dimension ( : ) :: work
    real ( kind = 8 ), allocatable, dimension ( : ) :: wsave
  
    real ( kind = 4 ) :: pi = 3.141593
    real ( kind = 4 ) :: freq = 0.18
    real ( kind = 4 ) :: amp = 2


    lensav = n + int ( log ( real ( n, kind = 4 ) ) / log ( 2.0E+00 ) ) + 4
    lenwrk = n
  
    allocate ( work(1:lenwrk) )
    allocate ( wsave(1:lensav) )
  
    call dfft1i ( n, wsave, lensav, ier )

    do j = 1,n
      r(j) =   tanh( amp * sin(2*pi*freq*real(j-1)))
    end do

    inc = 1
    lenr = n
  
    call dfft1f ( n, inc, r, lenr, wsave, lensav, work, lenwrk, ier )
  
    do i = 1,n 
      write(*,*) abs(r(i))
    end do
  
    deallocate ( work )
    deallocate ( wsave )
  
    return
end

