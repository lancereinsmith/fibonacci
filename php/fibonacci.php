#!/usr/bin/env php
<?php

/**
 * Enhanced Fibonacci Sequence Generator in PHP
 */

// ANSI color codes
define('RESET', "\033[0m");
define('GREEN', "\033[32m");
define('YELLOW', "\033[33m");
define('CYAN', "\033[36m");
define('MAGENTA', "\033[35m");
define('RED', "\033[31m");
define('GRAY', "\033[90m");

// Global variables
$t1 = 0;
$t2 = 1;
$nextTerm = 0;
$sum = 0;

/**
 * Clear the terminal screen
 */
function clearScreen() {
    echo "\033[H\033[2J";
    flush();
}

/**
 * Display the program header
 */
function displayHeader() {
    echo GREEN . "===============================================" . RESET . PHP_EOL;
    echo GREEN . "      Enhanced Fibonacci Sequence Generator    " . RESET . PHP_EOL;
    echo GREEN . "===============================================" . RESET . PHP_EOL;
    echo PHP_EOL;
}

/**
 * Display menu options
 */
function displayMenu() {
    echo YELLOW . "Generation Options:" . RESET . PHP_EOL;
    echo "  1. Generate by number of terms" . PHP_EOL;
    echo "  2. Generate up to a maximum value" . PHP_EOL;
    echo "  3. Display with statistics" . PHP_EOL;
    echo "  4. Display in columns" . PHP_EOL;
    echo PHP_EOL;
    echo "Enter your choice (1-4): ";
}

/**
 * Generate and display Fibonacci sequence
 *
 * @param int $termCount Number of terms to generate
 * @param bool $showStats Whether to show statistics
 * @param bool $columnMode Whether to display in columns
 */
function generateFibonacci($termCount, $showStats, $columnMode) {
    global $t1, $t2, $nextTerm, $sum;
    
    $t1 = 0;
    $t2 = 1;
    $sum = 0;
    $termsPerLine = 10;
    
    if ($columnMode) {
        echo CYAN . "Fibonacci Sequence ($termCount terms):" . RESET . PHP_EOL;
        echo PHP_EOL;
    } else {
        echo CYAN . "Fibonacci Sequence:" . RESET . PHP_EOL;
    }
    
    // Handle the first term
    if ($termCount >= 1) {
        if ($columnMode) {
            printf("%12d", $t1);
        } else {
            echo "$t1 ";
        }
        $sum += $t1;
    }
    
    // Handle the second term
    if ($termCount >= 2) {
        if ($columnMode) {
            printf("%12d", $t2);
        } else {
            echo "$t2 ";
        }
        $sum += $t2;
    }
    
    // Calculate and print remaining terms
    for ($j = 3; $j <= $termCount; $j++) {
        $nextTerm = $t1 + $t2;
        
        if ($columnMode) {
            printf("%12d", $nextTerm);
            if ($j % $termsPerLine == 0) {
                echo PHP_EOL;
            }
        } else {
            echo "$nextTerm ";
        }
        
        $sum += $nextTerm;
        
        $t1 = $t2;
        $t2 = $nextTerm;
    }
    
    echo PHP_EOL;
    echo PHP_EOL;
    
    // Display statistics if requested
    if ($showStats) {
        echo MAGENTA . "Statistics:" . RESET . PHP_EOL;
        echo "  Number of terms: $termCount" . PHP_EOL;
        echo "  Sum of all terms: $sum" . PHP_EOL;
        $average = $sum / $termCount;
        printf("  Average value: %.2f\n", $average);
        
        if ($termCount >= 2) {
            echo "  Last term: $t2" . PHP_EOL;
            echo "  Second-to-last term: $t1" . PHP_EOL;
            
            if ($t1 != 0) {
                $ratio = $t2 / $t1;
                $goldenRatio = 1.6180339887;
                $difference = abs($ratio - $goldenRatio);
                printf("  Ratio (F(n)/F(n-1)): %.10f\n", $ratio);
                printf("  Golden Ratio (φ): %.10f\n", $goldenRatio);
                printf("  Difference: %.10f\n", $difference);
            }
        }
        echo PHP_EOL;
    }
}

/**
 * Generate Fibonacci sequence up to a maximum value
 *
 * @param int $maxVal Maximum value to generate up to
 */
function generateUpToMax($maxVal) {
    global $t1, $t2, $nextTerm;
    
    $t1 = 0;
    $t2 = 1;
    $count = 0;
    
    echo CYAN . "Fibonacci Sequence up to $maxVal:" . RESET . PHP_EOL;
    echo PHP_EOL;
    
    if ($maxVal >= 0) {
        echo "$t1 ";
        $count++;
    }
    
    if ($maxVal >= 1) {
        echo "$t2 ";
        $count++;
    }
    
    while (($t1 + $t2) <= $maxVal) {
        $nextTerm = $t1 + $t2;
        echo "$nextTerm ";
        $count++;
        $t1 = $t2;
        $t2 = $nextTerm;
    }
    
    echo PHP_EOL;
    echo PHP_EOL;
    echo MAGENTA . "Total terms generated: $count" . RESET . PHP_EOL;
    echo PHP_EOL;
}

/**
 * Read an integer from standard input
 *
 * @return int|null The integer value or null if invalid
 */
function readInt() {
    $input = trim(fgets(STDIN));
    if (is_numeric($input)) {
        return intval($input);
    }
    return null;
}

/**
 * Main program entry point
 */
function main() {
    clearScreen();
    displayHeader();
    displayMenu();
    
    $choice = readInt();
    if ($choice === null) {
        $choice = 0;
    }
    echo PHP_EOL;
    
    switch ($choice) {
        case 1:
            echo "Enter the number of terms to generate (max 1476): ";
            $n = readInt();
            echo PHP_EOL;
            
            if ($n === null || $n <= 0) {
                echo RED . "Error: Please enter a positive integer." . RESET . PHP_EOL;
            } elseif ($n > 1476) {
                echo RED . "Error: Maximum 1476 terms supported." . RESET . PHP_EOL;
                echo "Using 1476 terms instead." . PHP_EOL;
                $n = 1476;
                echo PHP_EOL;
                generateFibonacci($n, false, false);
            } else {
                generateFibonacci($n, false, false);
            }
            break;
            
        case 2:
            echo "Enter the maximum value: ";
            $maxValue = readInt();
            echo PHP_EOL;
            
            if ($maxValue === null || $maxValue < 0) {
                echo RED . "Error: Please enter a non-negative value." . RESET . PHP_EOL;
            } else {
                generateUpToMax($maxValue);
            }
            break;
            
        case 3:
            echo "Enter the number of terms to generate (max 1476): ";
            $n = readInt();
            echo PHP_EOL;
            
            if ($n === null || $n <= 0) {
                echo RED . "Error: Please enter a positive integer." . RESET . PHP_EOL;
            } elseif ($n > 1476) {
                echo RED . "Error: Maximum 1476 terms supported." . RESET . PHP_EOL;
                echo "Using 1476 terms instead." . PHP_EOL;
                $n = 1476;
                echo PHP_EOL;
                generateFibonacci($n, true, false);
            } else {
                generateFibonacci($n, true, false);
            }
            break;
            
        case 4:
            echo "Enter the number of terms to generate (max 1476): ";
            $n = readInt();
            echo PHP_EOL;
            
            if ($n === null || $n <= 0) {
                echo RED . "Error: Please enter a positive integer." . RESET . PHP_EOL;
            } elseif ($n > 1476) {
                echo RED . "Error: Maximum 1476 terms supported." . RESET . PHP_EOL;
                echo "Using 1476 terms instead." . PHP_EOL;
                $n = 1476;
                echo PHP_EOL;
                generateFibonacci($n, false, true);
            } else {
                generateFibonacci($n, false, true);
            }
            break;
            
        default:
            echo RED . "Invalid choice. Using default mode (option 1)." . RESET . PHP_EOL;
            echo PHP_EOL;
            echo "Enter the number of terms to generate (max 1476): ";
            $n = readInt();
            echo PHP_EOL;
            
            if ($n !== null && $n > 0) {
                if ($n > 1476) $n = 1476;
                generateFibonacci($n, false, false);
            }
            break;
    }
    
    echo PHP_EOL;
    echo GRAY . "Press ENTER to exit..." . RESET . PHP_EOL;
    fgets(STDIN);
}

// Run the main program
main();

