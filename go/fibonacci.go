package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"os/exec"
	"runtime"
	"strconv"
	"strings"
)

// ANSI color codes
const (
	RESET   = "\033[0m"
	GREEN   = "\033[32m"
	YELLOW  = "\033[33m"
	CYAN    = "\033[36m"
	MAGENTA = "\033[35m"
	RED     = "\033[31m"
	GRAY    = "\033[90m"
)

// Global variables
var (
	t1, t2, nextTerm, sum int64
	maxValue              int64
	ratio                 float64
)

// clearScreen clears the terminal screen
func clearScreen() {
	var cmd *exec.Cmd
	if runtime.GOOS == "windows" {
		cmd = exec.Command("cmd", "/c", "cls")
	} else {
		cmd = exec.Command("clear")
	}
	cmd.Stdout = os.Stdout
	cmd.Run()
}

// displayHeader displays the program header
func displayHeader() {
	fmt.Printf("%s===============================================%s\n", GREEN, RESET)
	fmt.Printf("%s      Enhanced Fibonacci Sequence Generator    %s\n", GREEN, RESET)
	fmt.Printf("%s===============================================%s\n", GREEN, RESET)
	fmt.Println()
}

// displayMenu displays menu options
func displayMenu() {
	fmt.Printf("%sGeneration Options:%s\n", YELLOW, RESET)
	fmt.Println("  1. Generate by number of terms")
	fmt.Println("  2. Generate up to a maximum value")
	fmt.Println("  3. Display with statistics")
	fmt.Println("  4. Display in columns")
	fmt.Println()
	fmt.Print("Enter your choice (1-4): ")
}

// generateFibonacci generates and displays Fibonacci sequence
func generateFibonacci(termCount int, showStats bool, columnMode bool) {
	t1 = 0
	t2 = 1
	sum = 0
	termsPerLine := 10

	if columnMode {
		fmt.Printf("%sFibonacci Sequence (%d terms):%s\n", CYAN, termCount, RESET)
		fmt.Println()
	} else {
		fmt.Printf("%sFibonacci Sequence:%s\n", CYAN, RESET)
	}

	// Handle the first term
	if termCount >= 1 {
		if columnMode {
			fmt.Printf("%12d", t1)
		} else {
			fmt.Printf("%d ", t1)
		}
		sum += t1
	}

	// Handle the second term
	if termCount >= 2 {
		if columnMode {
			fmt.Printf("%12d", t2)
		} else {
			fmt.Printf("%d ", t2)
		}
		sum += t2
	}

	// Calculate and print remaining terms
	for j := 3; j <= termCount; j++ {
		nextTerm = t1 + t2

		if columnMode {
			fmt.Printf("%12d", nextTerm)
			if j%termsPerLine == 0 {
				fmt.Println()
			}
		} else {
			fmt.Printf("%d ", nextTerm)
		}

		sum += nextTerm

		t1 = t2
		t2 = nextTerm
	}

	fmt.Println()
	fmt.Println()

	// Display statistics if requested
	if showStats {
		fmt.Printf("%sStatistics:%s\n", MAGENTA, RESET)
		fmt.Printf("  Number of terms: %d\n", termCount)
		fmt.Printf("  Sum of all terms: %d\n", sum)
		fmt.Printf("  Average value: %.2f\n", float64(sum)/float64(termCount))
		if termCount >= 2 {
			fmt.Printf("  Last term: %d\n", t2)
			fmt.Printf("  Second-to-last term: %d\n", t1)
			if t1 != 0 {
				ratio = float64(t2) / float64(t1)
				goldenRatio := 1.6180339887
				fmt.Printf("  Ratio (F(n)/F(n-1)): %.10f\n", ratio)
				fmt.Printf("  Golden Ratio (φ): %.10f\n", goldenRatio)
				fmt.Printf("  Difference: %.10f\n", math.Abs(ratio-goldenRatio))
			}
		}
		fmt.Println()
	}
}

// generateUpToMax generates Fibonacci sequence up to a maximum value
func generateUpToMax(maxVal int64) {
	t1 = 0
	t2 = 1
	count := 0

	fmt.Printf("%sFibonacci Sequence up to %d:%s\n", CYAN, maxVal, RESET)
	fmt.Println()

	if maxVal >= 0 {
		fmt.Printf("%d ", t1)
		count++
	}

	if maxVal >= 1 {
		fmt.Printf("%d ", t2)
		count++
	}

	for (t1 + t2) <= maxVal {
		nextTerm = t1 + t2
		fmt.Printf("%d ", nextTerm)
		count++
		t1 = t2
		t2 = nextTerm
	}

	fmt.Println()
	fmt.Println()
	fmt.Printf("%sTotal terms generated: %d%s\n", MAGENTA, count, RESET)
	fmt.Println()
}

// readInt reads an integer from standard input
func readInt(reader *bufio.Reader) (int, error) {
	input, err := reader.ReadString('\n')
	if err != nil {
		return 0, err
	}
	input = strings.TrimSpace(input)
	return strconv.Atoi(input)
}

// readInt64 reads an int64 from standard input
func readInt64(reader *bufio.Reader) (int64, error) {
	input, err := reader.ReadString('\n')
	if err != nil {
		return 0, err
	}
	input = strings.TrimSpace(input)
	return strconv.ParseInt(input, 10, 64)
}

func main() {
	reader := bufio.NewReader(os.Stdin)
	var n int
	var choice int

	// Clear the terminal screen
	clearScreen()

	displayHeader()
	displayMenu()

	choice, err := readInt(reader)
	if err != nil {
		choice = 0
	}
	fmt.Println()

	switch choice {
	case 1:
		fmt.Print("Enter the number of terms to generate (max 92): ")
		n, err = readInt(reader)
		fmt.Println()

		if err != nil || n <= 0 {
			fmt.Printf("%sError: Please enter a positive integer.%s\n", RED, RESET)
		} else if n > 92 {
			fmt.Printf("%sError: Maximum 92 terms supported with int64.%s\n", RED, RESET)
			fmt.Println("Using 92 terms instead.")
			n = 92
			fmt.Println()
			generateFibonacci(n, false, false)
		} else {
			generateFibonacci(n, false, false)
		}

	case 2:
		fmt.Print("Enter the maximum value: ")
		maxValue, err = readInt64(reader)
		fmt.Println()

		if err != nil || maxValue < 0 {
			fmt.Printf("%sError: Please enter a non-negative value.%s\n", RED, RESET)
		} else {
			generateUpToMax(maxValue)
		}

	case 3:
		fmt.Print("Enter the number of terms to generate (max 92): ")
		n, err = readInt(reader)
		fmt.Println()

		if err != nil || n <= 0 {
			fmt.Printf("%sError: Please enter a positive integer.%s\n", RED, RESET)
		} else if n > 92 {
			fmt.Printf("%sError: Maximum 92 terms supported with int64.%s\n", RED, RESET)
			fmt.Println("Using 92 terms instead.")
			n = 92
			fmt.Println()
			generateFibonacci(n, true, false)
		} else {
			generateFibonacci(n, true, false)
		}

	case 4:
		fmt.Print("Enter the number of terms to generate (max 92): ")
		n, err = readInt(reader)
		fmt.Println()

		if err != nil || n <= 0 {
			fmt.Printf("%sError: Please enter a positive integer.%s\n", RED, RESET)
		} else if n > 92 {
			fmt.Printf("%sError: Maximum 92 terms supported with int64.%s\n", RED, RESET)
			fmt.Println("Using 92 terms instead.")
			n = 92
			fmt.Println()
			generateFibonacci(n, false, true)
		} else {
			generateFibonacci(n, false, true)
		}

	default:
		fmt.Printf("%sInvalid choice. Using default mode (option 1).%s\n", RED, RESET)
		fmt.Println()
		fmt.Print("Enter the number of terms to generate (max 92): ")
		n, err = readInt(reader)
		fmt.Println()
		if err == nil && n > 0 {
			if n > 92 {
				n = 92
			}
			generateFibonacci(n, false, false)
		}
	}

	fmt.Println()
	fmt.Printf("%sPress ENTER to exit...%s\n", GRAY, RESET)
	reader.ReadString('\n')
}

