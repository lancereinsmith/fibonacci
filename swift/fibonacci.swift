#!/usr/bin/env swift

/**
 * Enhanced Fibonacci Sequence Generator in Swift
 */

import Foundation

// ANSI color codes
let RESET = "\u{001B}[0m"
let GREEN = "\u{001B}[32m"
let YELLOW = "\u{001B}[33m"
let CYAN = "\u{001B}[36m"
let MAGENTA = "\u{001B}[35m"
let RED = "\u{001B}[31m"
let GRAY = "\u{001B}[90m"

// Global variables
var t1: Int64 = 0
var t2: Int64 = 1
var nextTerm: Int64 = 0
var sum: Int64 = 0
var maxValue: Int64 = 0
var ratio: Double = 0.0

/// Clear the terminal screen
func clearScreen() {
    print("\u{001B}[H\u{001B}[2J", terminator: "")
    fflush(stdout)
}

/// Display the program header
func displayHeader() {
    print("\(GREEN)===============================================\(RESET)")
    print("\(GREEN)      Enhanced Fibonacci Sequence Generator    \(RESET)")
    print("\(GREEN)===============================================\(RESET)")
    print()
}

/// Display menu options
func displayMenu() {
    print("\(YELLOW)Generation Options:\(RESET)")
    print("  1. Generate by number of terms")
    print("  2. Generate up to a maximum value")
    print("  3. Display with statistics")
    print("  4. Display in columns")
    print()
    print("Enter your choice (1-4): ", terminator: "")
    fflush(stdout)
}

/// Generate and display Fibonacci sequence
func generateFibonacci(termCount: Int, showStats: Bool, columnMode: Bool) {
    t1 = 0
    t2 = 1
    sum = 0
    let termsPerLine = 10
    
    if columnMode {
        print("\(CYAN)Fibonacci Sequence (\(termCount) terms):\(RESET)")
        print()
    } else {
        print("\(CYAN)Fibonacci Sequence:\(RESET)")
    }
    
    // Handle the first term
    if termCount >= 1 {
        if columnMode {
            print(String(format: "%12lld", t1), terminator: "")
        } else {
            print("\(t1) ", terminator: "")
        }
        sum += t1
    }
    
    // Handle the second term
    if termCount >= 2 {
        if columnMode {
            print(String(format: "%12lld", t2), terminator: "")
        } else {
            print("\(t2) ", terminator: "")
        }
        sum += t2
    }
    
    // Calculate and print remaining terms
    for j in 3...termCount {
        nextTerm = t1 + t2
        
        if columnMode {
            print(String(format: "%12lld", nextTerm), terminator: "")
            if j % termsPerLine == 0 {
                print()
            }
        } else {
            print("\(nextTerm) ", terminator: "")
        }
        
        sum += nextTerm
        
        t1 = t2
        t2 = nextTerm
    }
    
    print()
    print()
    
    // Display statistics if requested
    if showStats {
        print("\(MAGENTA)Statistics:\(RESET)")
        print("  Number of terms: \(termCount)")
        print("  Sum of all terms: \(sum)")
        let average = Double(sum) / Double(termCount)
        print(String(format: "  Average value: %.2f", average))
        
        if termCount >= 2 {
            print("  Last term: \(t2)")
            print("  Second-to-last term: \(t1)")
            
            if t1 != 0 {
                ratio = Double(t2) / Double(t1)
                let goldenRatio = 1.6180339887
                let difference = abs(ratio - goldenRatio)
                print(String(format: "  Ratio (F(n)/F(n-1)): %.10f", ratio))
                print(String(format: "  Golden Ratio (φ): %.10f", goldenRatio))
                print(String(format: "  Difference: %.10f", difference))
            }
        }
        print()
    }
}

/// Generate Fibonacci sequence up to a maximum value
func generateUpToMax(maxVal: Int64) {
    t1 = 0
    t2 = 1
    var count = 0
    
    print("\(CYAN)Fibonacci Sequence up to \(maxVal):\(RESET)")
    print()
    
    if maxVal >= 0 {
        print("\(t1) ", terminator: "")
        count += 1
    }
    
    if maxVal >= 1 {
        print("\(t2) ", terminator: "")
        count += 1
    }
    
    while (t1 + t2) <= maxVal {
        nextTerm = t1 + t2
        print("\(nextTerm) ", terminator: "")
        count += 1
        t1 = t2
        t2 = nextTerm
    }
    
    print()
    print()
    print("\(MAGENTA)Total terms generated: \(count)\(RESET)")
    print()
}

/// Read an integer from standard input
func readInt() -> Int? {
    guard let input = readLine() else { return nil }
    return Int(input.trimmingCharacters(in: .whitespaces))
}

/// Read an Int64 from standard input
func readInt64() -> Int64? {
    guard let input = readLine() else { return nil }
    return Int64(input.trimmingCharacters(in: .whitespaces))
}

/// Main program entry point
func main() {
    clearScreen()
    displayHeader()
    displayMenu()
    
    let choice = readInt() ?? 0
    print()
    
    switch choice {
    case 1:
        print("Enter the number of terms to generate (max 92): ", terminator: "")
        fflush(stdout)
        var n = readInt() ?? 0
        print()
        
        if n <= 0 {
            print("\(RED)Error: Please enter a positive integer.\(RESET)")
        } else if n > 92 {
            print("\(RED)Error: Maximum 92 terms supported with Int64.\(RESET)")
            print("Using 92 terms instead.")
            n = 92
            print()
            generateFibonacci(termCount: n, showStats: false, columnMode: false)
        } else {
            generateFibonacci(termCount: n, showStats: false, columnMode: false)
        }
        
    case 2:
        print("Enter the maximum value: ", terminator: "")
        fflush(stdout)
        let maxValue = readInt64() ?? -1
        print()
        
        if maxValue < 0 {
            print("\(RED)Error: Please enter a non-negative value.\(RESET)")
        } else {
            generateUpToMax(maxVal: maxValue)
        }
        
    case 3:
        print("Enter the number of terms to generate (max 92): ", terminator: "")
        fflush(stdout)
        var n = readInt() ?? 0
        print()
        
        if n <= 0 {
            print("\(RED)Error: Please enter a positive integer.\(RESET)")
        } else if n > 92 {
            print("\(RED)Error: Maximum 92 terms supported with Int64.\(RESET)")
            print("Using 92 terms instead.")
            n = 92
            print()
            generateFibonacci(termCount: n, showStats: true, columnMode: false)
        } else {
            generateFibonacci(termCount: n, showStats: true, columnMode: false)
        }
        
    case 4:
        print("Enter the number of terms to generate (max 92): ", terminator: "")
        fflush(stdout)
        var n = readInt() ?? 0
        print()
        
        if n <= 0 {
            print("\(RED)Error: Please enter a positive integer.\(RESET)")
        } else if n > 92 {
            print("\(RED)Error: Maximum 92 terms supported with Int64.\(RESET)")
            print("Using 92 terms instead.")
            n = 92
            print()
            generateFibonacci(termCount: n, showStats: false, columnMode: true)
        } else {
            generateFibonacci(termCount: n, showStats: false, columnMode: true)
        }
        
    default:
        print("\(RED)Invalid choice. Using default mode (option 1).\(RESET)")
        print()
        print("Enter the number of terms to generate (max 92): ", terminator: "")
        fflush(stdout)
        var n = readInt() ?? 0
        print()
        
        if n > 0 {
            if n > 92 { n = 92 }
            generateFibonacci(termCount: n, showStats: false, columnMode: false)
        }
    }
    
    print()
    print("\(GRAY)Press ENTER to exit...\(RESET)")
    _ = readLine()
}

// Run the main program
main()

