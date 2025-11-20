! Enhanced Fibonacci Sequence Generator in Fortran 90+
program FibonacciGenerator
    implicit none
    
    ! Variable declarations
    integer :: n, choice, termsPerLine, count, j
    integer(kind=8) :: t1, t2, nextTerm, sum, maxValue
    real(kind=8) :: ratio, goldenRatio, difference, average
    logical :: showStats, columnMode
    character(len=100) :: input_line
    integer :: ios
    
    ! ANSI color codes (character escape sequences)
    character(len=*), parameter :: ESC = achar(27)
    character(len=*), parameter :: RESET = ESC // "[0m"
    character(len=*), parameter :: GREEN = ESC // "[32m"
    character(len=*), parameter :: YELLOW = ESC // "[33m"
    character(len=*), parameter :: CYAN = ESC // "[36m"
    character(len=*), parameter :: MAGENTA = ESC // "[35m"
    character(len=*), parameter :: RED = ESC // "[31m"
    character(len=*), parameter :: GRAY = ESC // "[90m"
    
    ! Clear screen and display header
    call clearScreen()
    call displayHeader()
    call displayMenu()
    
    ! Read user choice
    read(*, *, iostat=ios) choice
    if (ios /= 0) choice = 0
    write(*, *)
    
    ! Process user choice
    select case (choice)
        case (1)
            write(*, '(A)', advance='no') 'Enter the number of terms to generate (max 92): '
            read(*, *, iostat=ios) n
            write(*, *)
            
            if (ios /= 0 .or. n <= 0) then
                write(*, '(A)') RED // 'Error: Please enter a positive integer.' // RESET
            else if (n > 92) then
                write(*, '(A)') RED // 'Error: Maximum 92 terms supported with 64-bit integers.' // RESET
                write(*, '(A)') 'Using 92 terms instead.'
                n = 92
                write(*, *)
                call generateFibonacci(n, .false., .false.)
            else
                call generateFibonacci(n, .false., .false.)
            end if
            
        case (2)
            write(*, '(A)', advance='no') 'Enter the maximum value: '
            read(*, *, iostat=ios) maxValue
            write(*, *)
            
            if (ios /= 0 .or. maxValue < 0) then
                write(*, '(A)') RED // 'Error: Please enter a non-negative value.' // RESET
            else
                call generateUpToMax(maxValue)
            end if
            
        case (3)
            write(*, '(A)', advance='no') 'Enter the number of terms to generate (max 92): '
            read(*, *, iostat=ios) n
            write(*, *)
            
            if (ios /= 0 .or. n <= 0) then
                write(*, '(A)') RED // 'Error: Please enter a positive integer.' // RESET
            else if (n > 92) then
                write(*, '(A)') RED // 'Error: Maximum 92 terms supported with 64-bit integers.' // RESET
                write(*, '(A)') 'Using 92 terms instead.'
                n = 92
                write(*, *)
                call generateFibonacci(n, .true., .false.)
            else
                call generateFibonacci(n, .true., .false.)
            end if
            
        case (4)
            write(*, '(A)', advance='no') 'Enter the number of terms to generate (max 92): '
            read(*, *, iostat=ios) n
            write(*, *)
            
            if (ios /= 0 .or. n <= 0) then
                write(*, '(A)') RED // 'Error: Please enter a positive integer.' // RESET
            else if (n > 92) then
                write(*, '(A)') RED // 'Error: Maximum 92 terms supported with 64-bit integers.' // RESET
                write(*, '(A)') 'Using 92 terms instead.'
                n = 92
                write(*, *)
                call generateFibonacci(n, .false., .true.)
            else
                call generateFibonacci(n, .false., .true.)
            end if
            
        case default
            write(*, '(A)') RED // 'Invalid choice. Using default mode (option 1).' // RESET
            write(*, *)
            write(*, '(A)', advance='no') 'Enter the number of terms to generate (max 92): '
            read(*, *, iostat=ios) n
            write(*, *)
            if (ios == 0 .and. n > 0) then
                if (n > 92) n = 92
                call generateFibonacci(n, .false., .false.)
            end if
    end select
    
    write(*, *)
    write(*, '(A)') GRAY // 'Press ENTER to exit...' // RESET
    read(*, '(A)') input_line
    
contains

    ! Subroutine to clear screen
    subroutine clearScreen()
        implicit none
        ! Use ANSI escape codes to clear screen
        write(*, '(A)', advance='no') ESC // '[H' // ESC // '[2J'
    end subroutine clearScreen
    
    ! Subroutine to display header
    subroutine displayHeader()
        implicit none
        write(*, '(A)') GREEN // '===============================================' // RESET
        write(*, '(A)') GREEN // '      Enhanced Fibonacci Sequence Generator    ' // RESET
        write(*, '(A)') GREEN // '===============================================' // RESET
        write(*, *)
    end subroutine displayHeader
    
    ! Subroutine to display menu
    subroutine displayMenu()
        implicit none
        write(*, '(A)') YELLOW // 'Generation Options:' // RESET
        write(*, '(A)') '  1. Generate by number of terms'
        write(*, '(A)') '  2. Generate up to a maximum value'
        write(*, '(A)') '  3. Display with statistics'
        write(*, '(A)') '  4. Display in columns'
        write(*, *)
        write(*, '(A)', advance='no') 'Enter your choice (1-4): '
    end subroutine displayMenu
    
    ! Subroutine to generate and display Fibonacci sequence
    subroutine generateFibonacci(termCount, showStats, columnMode)
        implicit none
        integer, intent(in) :: termCount
        logical, intent(in) :: showStats, columnMode
        integer :: j, termsPerLine
        integer(kind=8) :: t1, t2, nextTerm, sum
        real(kind=8) :: ratio, goldenRatio, difference, average
        
        t1 = 0
        t2 = 1
        sum = 0
        termsPerLine = 10
        
        if (columnMode) then
            write(*, '(A,I0,A)') CYAN // 'Fibonacci Sequence (', termCount, ' terms):' // RESET
            write(*, *)
        else
            write(*, '(A)') CYAN // 'Fibonacci Sequence:' // RESET
        end if
        
        ! Handle the first term
        if (termCount >= 1) then
            if (columnMode) then
                write(*, '(I12)', advance='no') t1
            else
                write(*, '(I0,A)', advance='no') t1, ' '
            end if
            sum = sum + t1
        end if
        
        ! Handle the second term
        if (termCount >= 2) then
            if (columnMode) then
                write(*, '(I12)', advance='no') t2
            else
                write(*, '(I0,A)', advance='no') t2, ' '
            end if
            sum = sum + t2
        end if
        
        ! Calculate and print remaining terms
        do j = 3, termCount
            nextTerm = t1 + t2
            
            if (columnMode) then
                write(*, '(I12)', advance='no') nextTerm
                if (mod(j, termsPerLine) == 0) then
                    write(*, *)
                end if
            else
                write(*, '(I0,A)', advance='no') nextTerm, ' '
            end if
            
            sum = sum + nextTerm
            
            t1 = t2
            t2 = nextTerm
        end do
        
        write(*, *)
        write(*, *)
        
        ! Display statistics if requested
        if (showStats) then
            write(*, '(A)') MAGENTA // 'Statistics:' // RESET
            write(*, '(A,I0)') '  Number of terms: ', termCount
            write(*, '(A,I0)') '  Sum of all terms: ', sum
            average = real(sum, kind=8) / real(termCount, kind=8)
            write(*, '(A,F0.2)') '  Average value: ', average
            
            if (termCount >= 2) then
                write(*, '(A,I0)') '  Last term: ', t2
                write(*, '(A,I0)') '  Second-to-last term: ', t1
                
                if (t1 /= 0) then
                    ratio = real(t2, kind=8) / real(t1, kind=8)
                    goldenRatio = 1.6180339887d0
                    difference = abs(ratio - goldenRatio)
                    write(*, '(A,F0.10)') '  Ratio (F(n)/F(n-1)): ', ratio
                    write(*, '(A,F0.10)') '  Golden Ratio (φ): ', goldenRatio
                    write(*, '(A,F0.10)') '  Difference: ', difference
                end if
            end if
            write(*, *)
        end if
    end subroutine generateFibonacci
    
    ! Subroutine to generate up to maximum value
    subroutine generateUpToMax(maxVal)
        implicit none
        integer(kind=8), intent(in) :: maxVal
        integer(kind=8) :: t1, t2, nextTerm
        integer :: count
        
        t1 = 0
        t2 = 1
        count = 0
        
        write(*, '(A,I0,A)') CYAN // 'Fibonacci Sequence up to ', maxVal, ':' // RESET
        write(*, *)
        
        if (maxVal >= 0) then
            write(*, '(I0,A)', advance='no') t1, ' '
            count = count + 1
        end if
        
        if (maxVal >= 1) then
            write(*, '(I0,A)', advance='no') t2, ' '
            count = count + 1
        end if
        
        do while ((t1 + t2) <= maxVal)
            nextTerm = t1 + t2
            write(*, '(I0,A)', advance='no') nextTerm, ' '
            count = count + 1
            t1 = t2
            t2 = nextTerm
        end do
        
        write(*, *)
        write(*, *)
        write(*, '(A,I0)') MAGENTA // 'Total terms generated: ', count, RESET
        write(*, *)
    end subroutine generateUpToMax

end program FibonacciGenerator

