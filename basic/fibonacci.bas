' Enhanced Fibonacci Sequence Generator in FreeBASIC

' ANSI color codes
#define RESET !"\033[0m"
#define GREENCOLOR !"\033[32m"
#define YELLOW !"\033[33m"
#define CYAN !"\033[36m"
#define MAGENTA !"\033[35m"
#define RED !"\033[31m"
#define GRAY !"\033[90m"

' Global variables
Dim Shared As LongInt t1, t2, nextTerm, sumTotal, maxValue
Dim Shared As Double ratio

' Subroutine to clear screen
Sub ClearScreen()
    Print Chr(27) & "[H" & Chr(27) & "[2J";
End Sub

' Subroutine to display header
Sub DisplayHeader()
    Print GREENCOLOR; "==============================================="; RESET
    Print GREENCOLOR; "      Enhanced Fibonacci Sequence Generator    "; RESET
    Print GREENCOLOR; "==============================================="; RESET
    Print
End Sub

' Subroutine to display menu
Sub DisplayMenu()
    Print YELLOW; "Generation Options:"; RESET
    Print "  1. Generate by number of terms"
    Print "  2. Generate up to a maximum value"
    Print "  3. Display with statistics"
    Print "  4. Display in columns"
    Print
    Print "Enter your choice (1-4): ";
End Sub

' Subroutine to generate and display Fibonacci sequence
Sub GenerateFibonacci(termCount As Integer, showStats As Integer, columnMode As Integer)
    Dim As Integer j, termsPerLine
    Dim As Double average, goldenRatio, difference
    
    t1 = 0
    t2 = 1
    sumTotal = 0
    termsPerLine = 10
    
    If columnMode Then
        Print CYAN; "Fibonacci Sequence ("; termCount; " terms):"; RESET
        Print
    Else
        Print CYAN; "Fibonacci Sequence:"; RESET
    End If
    
    ' Handle the first term
    If termCount >= 1 Then
        If columnMode Then
            Print Using "############"; t1;
        Else
            Print t1; " ";
        End If
        sumTotal = sumTotal + t1
    End If
    
    ' Handle the second term
    If termCount >= 2 Then
        If columnMode Then
            Print Using "############"; t2;
        Else
            Print t2; " ";
        End If
        sumTotal = sumTotal + t2
    End If
    
    ' Calculate and print remaining terms
    For j = 3 To termCount
        nextTerm = t1 + t2
        
        If columnMode Then
            Print Using "############"; nextTerm;
            If (j Mod termsPerLine) = 0 Then
                Print
            End If
        Else
            Print nextTerm; " ";
        End If
        
        sumTotal = sumTotal + nextTerm
        
        t1 = t2
        t2 = nextTerm
    Next j
    
    Print
    Print
    
    ' Display statistics if requested
    If showStats Then
        Print MAGENTA; "Statistics:"; RESET
        Print "  Number of terms: "; termCount
        Print "  Sum of all terms: "; sumTotal
        average = sumTotal / termCount
        Print Using "  Average value: ##.##"; average
        
        If termCount >= 2 Then
            Print "  Last term: "; t2
            Print "  Second-to-last term: "; t1
            
            If t1 <> 0 Then
                ratio = t2 / t1
                goldenRatio = 1.6180339887
                difference = Abs(ratio - goldenRatio)
                Print Using "  Ratio (F(n)/F(n-1)): ##.##########"; ratio
                Print Using "  Golden Ratio (φ): ##.##########"; goldenRatio
                Print Using "  Difference: ##.##########"; difference
            End If
        End If
        Print
    End If
End Sub

' Subroutine to generate up to maximum value
Sub GenerateUpToMax(maxVal As LongInt)
    Dim As Integer count
    
    t1 = 0
    t2 = 1
    count = 0
    
    Print CYAN; "Fibonacci Sequence up to "; maxVal; ":"; RESET
    Print
    
    If maxVal >= 0 Then
        Print t1; " ";
        count = count + 1
    End If
    
    If maxVal >= 1 Then
        Print t2; " ";
        count = count + 1
    End If
    
    While (t1 + t2) <= maxVal
        nextTerm = t1 + t2
        Print nextTerm; " ";
        count = count + 1
        t1 = t2
        t2 = nextTerm
    Wend
    
    Print
    Print
    Print MAGENTA; "Total terms generated: "; count; RESET
    Print
End Sub

' Main program
Dim As Integer n, choice
Dim As String inputLine

ClearScreen()
DisplayHeader()
DisplayMenu()

Input "", choice
Print

Select Case choice
    Case 1
        Print "Enter the number of terms to generate (max 92): ";
        Input "", n
        Print
        
        If n <= 0 Then
            Print RED; "Error: Please enter a positive integer."; RESET
        ElseIf n > 92 Then
            Print RED; "Error: Maximum 92 terms supported with LongInt."; RESET
            Print "Using 92 terms instead."
            n = 92
            Print
            GenerateFibonacci(n, 0, 0)
        Else
            GenerateFibonacci(n, 0, 0)
        End If
        
    Case 2
        Print "Enter the maximum value: ";
        Input "", maxValue
        Print
        
        If maxValue < 0 Then
            Print RED; "Error: Please enter a non-negative value."; RESET
        Else
            GenerateUpToMax(maxValue)
        End If
        
    Case 3
        Print "Enter the number of terms to generate (max 92): ";
        Input "", n
        Print
        
        If n <= 0 Then
            Print RED; "Error: Please enter a positive integer."; RESET
        ElseIf n > 92 Then
            Print RED; "Error: Maximum 92 terms supported with LongInt."; RESET
            Print "Using 92 terms instead."
            n = 92
            Print
            GenerateFibonacci(n, 1, 0)
        Else
            GenerateFibonacci(n, 1, 0)
        End If
        
    Case 4
        Print "Enter the number of terms to generate (max 92): ";
        Input "", n
        Print
        
        If n <= 0 Then
            Print RED; "Error: Please enter a positive integer."; RESET
        ElseIf n > 92 Then
            Print RED; "Error: Maximum 92 terms supported with LongInt."; RESET
            Print "Using 92 terms instead."
            n = 92
            Print
            GenerateFibonacci(n, 0, 1)
        Else
            GenerateFibonacci(n, 0, 1)
        End If
        
    Case Else
        Print RED; "Invalid choice. Using default mode (option 1)."; RESET
        Print
        Print "Enter the number of terms to generate (max 92): ";
        Input "", n
        Print
        
        If n > 0 Then
            If n > 92 Then n = 92
            GenerateFibonacci(n, 0, 0)
        End If
End Select

Print
Print GRAY; "Press ENTER to exit..."; RESET
Input "", inputLine
End

