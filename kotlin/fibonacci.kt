#!/usr/bin/env kotlin

/**
 * Enhanced Fibonacci Sequence Generator in Kotlin
 */

// ANSI color codes
const val RESET = "\u001B[0m"
const val GREEN = "\u001B[32m"
const val YELLOW = "\u001B[33m"
const val CYAN = "\u001B[36m"
const val MAGENTA = "\u001B[35m"
const val RED = "\u001B[31m"
const val GRAY = "\u001B[90m"

// Global variables
var t1: Long = 0
var t2: Long = 1
var nextTerm: Long = 0
var sum: Long = 0
var maxValue: Long = 0
var ratio: Double = 0.0

/**
 * Clear the terminal screen
 */
fun clearScreen() {
    print("\u001B[H\u001B[2J")
    System.out.flush()
}

/**
 * Display the program header
 */
fun displayHeader() {
    println("${GREEN}===============================================${RESET}")
    println("${GREEN}      Enhanced Fibonacci Sequence Generator    ${RESET}")
    println("${GREEN}===============================================${RESET}")
    println()
}

/**
 * Display menu options
 */
fun displayMenu() {
    println("${YELLOW}Generation Options:${RESET}")
    println("  1. Generate by number of terms")
    println("  2. Generate up to a maximum value")
    println("  3. Display with statistics")
    println("  4. Display in columns")
    println()
    print("Enter your choice (1-4): ")
}

/**
 * Generate and display Fibonacci sequence
 */
fun generateFibonacci(termCount: Int, showStats: Boolean, columnMode: Boolean) {
    t1 = 0
    t2 = 1
    sum = 0
    val termsPerLine = 10
    
    if (columnMode) {
        println("${CYAN}Fibonacci Sequence ($termCount terms):${RESET}")
        println()
    } else {
        println("${CYAN}Fibonacci Sequence:${RESET}")
    }
    
    // Handle the first term
    if (termCount >= 1) {
        if (columnMode) {
            print("%12d".format(t1))
        } else {
            print("$t1 ")
        }
        sum += t1
    }
    
    // Handle the second term
    if (termCount >= 2) {
        if (columnMode) {
            print("%12d".format(t2))
        } else {
            print("$t2 ")
        }
        sum += t2
    }
    
    // Calculate and print remaining terms
    for (j in 3..termCount) {
        nextTerm = t1 + t2
        
        if (columnMode) {
            print("%12d".format(nextTerm))
            if (j % termsPerLine == 0) {
                println()
            }
        } else {
            print("$nextTerm ")
        }
        
        sum += nextTerm
        
        t1 = t2
        t2 = nextTerm
    }
    
    println()
    println()
    
    // Display statistics if requested
    if (showStats) {
        println("${MAGENTA}Statistics:${RESET}")
        println("  Number of terms: $termCount")
        println("  Sum of all terms: $sum")
        val average = sum.toDouble() / termCount
        println("  Average value: %.2f".format(average))
        
        if (termCount >= 2) {
            println("  Last term: $t2")
            println("  Second-to-last term: $t1")
            
            if (t1 != 0L) {
                ratio = t2.toDouble() / t1.toDouble()
                val goldenRatio = 1.6180339887
                val difference = kotlin.math.abs(ratio - goldenRatio)
                println("  Ratio (F(n)/F(n-1)): %.10f".format(ratio))
                println("  Golden Ratio (φ): %.10f".format(goldenRatio))
                println("  Difference: %.10f".format(difference))
            }
        }
        println()
    }
}

/**
 * Generate Fibonacci sequence up to a maximum value
 */
fun generateUpToMax(maxVal: Long) {
    t1 = 0
    t2 = 1
    var count = 0
    
    println("${CYAN}Fibonacci Sequence up to $maxVal:${RESET}")
    println()
    
    if (maxVal >= 0) {
        print("$t1 ")
        count++
    }
    
    if (maxVal >= 1) {
        print("$t2 ")
        count++
    }
    
    while ((t1 + t2) <= maxVal) {
        nextTerm = t1 + t2
        print("$nextTerm ")
        count++
        t1 = t2
        t2 = nextTerm
    }
    
    println()
    println()
    println("${MAGENTA}Total terms generated: $count${RESET}")
    println()
}

/**
 * Read an integer from standard input
 */
fun readInt(): Int? {
    return readLine()?.trim()?.toIntOrNull()
}

/**
 * Read a Long from standard input
 */
fun readLong(): Long? {
    return readLine()?.trim()?.toLongOrNull()
}

/**
 * Main program entry point
 */
fun main() {
    clearScreen()
    displayHeader()
    displayMenu()
    
    val choice = readInt() ?: 0
    println()
    
    when (choice) {
        1 -> {
            print("Enter the number of terms to generate (max 92): ")
            var n = readInt() ?: 0
            println()
            
            if (n <= 0) {
                println("${RED}Error: Please enter a positive integer.${RESET}")
            } else if (n > 92) {
                println("${RED}Error: Maximum 92 terms supported with Long.${RESET}")
                println("Using 92 terms instead.")
                n = 92
                println()
                generateFibonacci(n, false, false)
            } else {
                generateFibonacci(n, false, false)
            }
        }
        
        2 -> {
            print("Enter the maximum value: ")
            maxValue = readLong() ?: -1
            println()
            
            if (maxValue < 0) {
                println("${RED}Error: Please enter a non-negative value.${RESET}")
            } else {
                generateUpToMax(maxValue)
            }
        }
        
        3 -> {
            print("Enter the number of terms to generate (max 92): ")
            var n = readInt() ?: 0
            println()
            
            if (n <= 0) {
                println("${RED}Error: Please enter a positive integer.${RESET}")
            } else if (n > 92) {
                println("${RED}Error: Maximum 92 terms supported with Long.${RESET}")
                println("Using 92 terms instead.")
                n = 92
                println()
                generateFibonacci(n, true, false)
            } else {
                generateFibonacci(n, true, false)
            }
        }
        
        4 -> {
            print("Enter the number of terms to generate (max 92): ")
            var n = readInt() ?: 0
            println()
            
            if (n <= 0) {
                println("${RED}Error: Please enter a positive integer.${RESET}")
            } else if (n > 92) {
                println("${RED}Error: Maximum 92 terms supported with Long.${RESET}")
                println("Using 92 terms instead.")
                n = 92
                println()
                generateFibonacci(n, false, true)
            } else {
                generateFibonacci(n, false, true)
            }
        }
        
        else -> {
            println("${RED}Invalid choice. Using default mode (option 1).${RESET}")
            println()
            print("Enter the number of terms to generate (max 92): ")
            var n = readInt() ?: 0
            println()
            
            if (n > 0) {
                if (n > 92) n = 92
                generateFibonacci(n, false, false)
            }
        }
    }
    
    println()
    println("${GRAY}Press ENTER to exit...${RESET}")
    readLine()
}

