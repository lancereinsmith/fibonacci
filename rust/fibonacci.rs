#!/usr/bin/env rust-script

/**
 * Enhanced Fibonacci Sequence Generator in Rust
 */

use std::io::{self, Write};

// ANSI color codes
const RESET: &str = "\x1b[0m";
const GREEN: &str = "\x1b[32m";
const YELLOW: &str = "\x1b[33m";
const CYAN: &str = "\x1b[36m";
const MAGENTA: &str = "\x1b[35m";
const RED: &str = "\x1b[31m";
const GRAY: &str = "\x1b[90m";

/// Clear the terminal screen
fn clear_screen() {
    print!("\x1b[H\x1b[2J");
    io::stdout().flush().unwrap();
}

/// Display the program header
fn display_header() {
    println!("{}==============================================={}", GREEN, RESET);
    println!("{}      Enhanced Fibonacci Sequence Generator    {}", GREEN, RESET);
    println!("{}==============================================={}", GREEN, RESET);
    println!();
}

/// Display menu options
fn display_menu() {
    println!("{}Generation Options:{}", YELLOW, RESET);
    println!("  1. Generate by number of terms");
    println!("  2. Generate up to a maximum value");
    println!("  3. Display with statistics");
    println!("  4. Display in columns");
    println!();
    print!("Enter your choice (1-4): ");
    io::stdout().flush().unwrap();
}

/// Generate and display Fibonacci sequence
fn generate_fibonacci(term_count: usize, show_stats: bool, column_mode: bool) {
    let mut t1: i64 = 0;
    let mut t2: i64 = 1;
    let mut sum: i64 = 0;
    let terms_per_line = 10;
    
    if column_mode {
        println!("{}Fibonacci Sequence ({} terms):{}", CYAN, term_count, RESET);
        println!();
    } else {
        println!("{}Fibonacci Sequence:{}", CYAN, RESET);
    }
    
    // Handle the first term
    if term_count >= 1 {
        if column_mode {
            print!("{:>12}", t1);
        } else {
            print!("{} ", t1);
        }
        sum += t1;
    }
    
    // Handle the second term
    if term_count >= 2 {
        if column_mode {
            print!("{:>12}", t2);
        } else {
            print!("{} ", t2);
        }
        sum += t2;
    }
    
    // Calculate and print remaining terms
    for j in 3..=term_count {
        let next_term = t1 + t2;
        
        if column_mode {
            print!("{:>12}", next_term);
            if j % terms_per_line == 0 {
                println!();
            }
        } else {
            print!("{} ", next_term);
        }
        
        sum += next_term;
        
        t1 = t2;
        t2 = next_term;
    }
    
    println!();
    println!();
    
    // Display statistics if requested
    if show_stats {
        println!("{}Statistics:{}", MAGENTA, RESET);
        println!("  Number of terms: {}", term_count);
        println!("  Sum of all terms: {}", sum);
        let average = sum as f64 / term_count as f64;
        println!("  Average value: {:.2}", average);
        
        if term_count >= 2 {
            println!("  Last term: {}", t2);
            println!("  Second-to-last term: {}", t1);
            
            if t1 != 0 {
                let ratio = t2 as f64 / t1 as f64;
                let golden_ratio = 1.6180339887;
                let difference = (ratio - golden_ratio).abs();
                println!("  Ratio (F(n)/F(n-1)): {:.10}", ratio);
                println!("  Golden Ratio (φ): {:.10}", golden_ratio);
                println!("  Difference: {:.10}", difference);
            }
        }
        println!();
    }
}

/// Generate Fibonacci sequence up to a maximum value
fn generate_up_to_max(max_val: i64) {
    let mut t1: i64 = 0;
    let mut t2: i64 = 1;
    let mut count = 0;
    
    println!("{}Fibonacci Sequence up to {}:{}", CYAN, max_val, RESET);
    println!();
    
    if max_val >= 0 {
        print!("{} ", t1);
        count += 1;
    }
    
    if max_val >= 1 {
        print!("{} ", t2);
        count += 1;
    }
    
    while (t1 + t2) <= max_val {
        let next_term = t1 + t2;
        print!("{} ", next_term);
        count += 1;
        t1 = t2;
        t2 = next_term;
    }
    
    println!();
    println!();
    println!("{}Total terms generated: {}{}", MAGENTA, count, RESET);
    println!();
}

/// Read an integer from standard input
fn read_int() -> Option<usize> {
    let mut input = String::new();
    io::stdin().read_line(&mut input).ok()?;
    input.trim().parse().ok()
}

/// Read an i64 from standard input
fn read_i64() -> Option<i64> {
    let mut input = String::new();
    io::stdin().read_line(&mut input).ok()?;
    input.trim().parse().ok()
}

/// Main program entry point
fn main() {
    clear_screen();
    display_header();
    display_menu();
    
    let choice = read_int().unwrap_or(0);
    println!();
    
    match choice {
        1 => {
            print!("Enter the number of terms to generate (max 92): ");
            io::stdout().flush().unwrap();
            let mut n = read_int().unwrap_or(0);
            println!();
            
            if n == 0 {
                println!("{}Error: Please enter a positive integer.{}", RED, RESET);
            } else if n > 92 {
                println!("{}Error: Maximum 92 terms supported with i64.{}", RED, RESET);
                println!("Using 92 terms instead.");
                n = 92;
                println!();
                generate_fibonacci(n, false, false);
            } else {
                generate_fibonacci(n, false, false);
            }
        }
        
        2 => {
            print!("Enter the maximum value: ");
            io::stdout().flush().unwrap();
            let max_value = read_i64().unwrap_or(-1);
            println!();
            
            if max_value < 0 {
                println!("{}Error: Please enter a non-negative value.{}", RED, RESET);
            } else {
                generate_up_to_max(max_value);
            }
        }
        
        3 => {
            print!("Enter the number of terms to generate (max 92): ");
            io::stdout().flush().unwrap();
            let mut n = read_int().unwrap_or(0);
            println!();
            
            if n == 0 {
                println!("{}Error: Please enter a positive integer.{}", RED, RESET);
            } else if n > 92 {
                println!("{}Error: Maximum 92 terms supported with i64.{}", RED, RESET);
                println!("Using 92 terms instead.");
                n = 92;
                println!();
                generate_fibonacci(n, true, false);
            } else {
                generate_fibonacci(n, true, false);
            }
        }
        
        4 => {
            print!("Enter the number of terms to generate (max 92): ");
            io::stdout().flush().unwrap();
            let mut n = read_int().unwrap_or(0);
            println!();
            
            if n == 0 {
                println!("{}Error: Please enter a positive integer.{}", RED, RESET);
            } else if n > 92 {
                println!("{}Error: Maximum 92 terms supported with i64.{}", RED, RESET);
                println!("Using 92 terms instead.");
                n = 92;
                println!();
                generate_fibonacci(n, false, true);
            } else {
                generate_fibonacci(n, false, true);
            }
        }
        
        _ => {
            println!("{}Invalid choice. Using default mode (option 1).{}", RED, RESET);
            println!();
            print!("Enter the number of terms to generate (max 92): ");
            io::stdout().flush().unwrap();
            let mut n = read_int().unwrap_or(0);
            println!();
            
            if n > 0 {
                if n > 92 { n = 92; }
                generate_fibonacci(n, false, false);
            }
        }
    }
    
    println!();
    println!("{}Press ENTER to exit...{}", GRAY, RESET);
    let mut _input = String::new();
    io::stdin().read_line(&mut _input).unwrap();
}

