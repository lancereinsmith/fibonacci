#!/usr/bin/env python3

"""
Enhanced Fibonacci Sequence Generator in Python
"""

import os
import sys

# ANSI color codes
RESET = "\033[0m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
CYAN = "\033[36m"
MAGENTA = "\033[35m"
RED = "\033[31m"
GRAY = "\033[90m"

# Global variables
t1 = 0
t2 = 1
next_term = 0
sum_total = 0


def clear_screen():
    """Clear the terminal screen"""
    print("\033[H\033[2J", end="")
    sys.stdout.flush()


def display_header():
    """Display the program header"""
    print(f"{GREEN}==============================================={RESET}")
    print(f"{GREEN}      Enhanced Fibonacci Sequence Generator    {RESET}")
    print(f"{GREEN}==============================================={RESET}")
    print()


def display_menu():
    """Display menu options"""
    print(f"{YELLOW}Generation Options:{RESET}")
    print("  1. Generate by number of terms")
    print("  2. Generate up to a maximum value")
    print("  3. Display with statistics")
    print("  4. Display in columns")
    print()
    print("Enter your choice (1-4): ", end="")
    sys.stdout.flush()


def generate_fibonacci(term_count, show_stats, column_mode):
    """
    Generate and display Fibonacci sequence

    Args:
        term_count: Number of terms to generate
        show_stats: Whether to show statistics
        column_mode: Whether to display in columns
    """
    global t1, t2, next_term, sum_total

    t1 = 0
    t2 = 1
    sum_total = 0
    terms_per_line = 10

    if column_mode:
        print(f"{CYAN}Fibonacci Sequence ({term_count} terms):{RESET}")
        print()
    else:
        print(f"{CYAN}Fibonacci Sequence:{RESET}")

    # Handle the first term
    if term_count >= 1:
        if column_mode:
            print(f"{t1:12}", end="")
        else:
            print(f"{t1} ", end="")
        sum_total += t1

    # Handle the second term
    if term_count >= 2:
        if column_mode:
            print(f"{t2:12}", end="")
        else:
            print(f"{t2} ", end="")
        sum_total += t2

    # Calculate and print remaining terms
    for j in range(3, term_count + 1):
        next_term = t1 + t2

        if column_mode:
            print(f"{next_term:12}", end="")
            if j % terms_per_line == 0:
                print()
        else:
            print(f"{next_term} ", end="")

        sum_total += next_term

        t1 = t2
        t2 = next_term

    print()
    print()

    # Display statistics if requested
    if show_stats:
        print(f"{MAGENTA}Statistics:{RESET}")
        print(f"  Number of terms: {term_count}")
        print(f"  Sum of all terms: {sum_total}")
        average = sum_total / term_count
        print(f"  Average value: {average:.2f}")

        if term_count >= 2:
            print(f"  Last term: {t2}")
            print(f"  Second-to-last term: {t1}")

            if t1 != 0:
                ratio = t2 / t1
                golden_ratio = 1.6180339887
                difference = abs(ratio - golden_ratio)
                print(f"  Ratio (F(n)/F(n-1)): {ratio:.10f}")
                print(f"  Golden Ratio (φ): {golden_ratio:.10f}")
                print(f"  Difference: {difference:.10f}")
        print()


def generate_up_to_max(max_val):
    """
    Generate Fibonacci sequence up to a maximum value

    Args:
        max_val: Maximum value to generate up to
    """
    global t1, t2, next_term

    t1 = 0
    t2 = 1
    count = 0

    print(f"{CYAN}Fibonacci Sequence up to {max_val}:{RESET}")
    print()

    if max_val >= 0:
        print(f"{t1} ", end="")
        count += 1

    if max_val >= 1:
        print(f"{t2} ", end="")
        count += 1

    while (t1 + t2) <= max_val:
        next_term = t1 + t2
        print(f"{next_term} ", end="")
        count += 1
        t1 = t2
        t2 = next_term

    print()
    print()
    print(f"{MAGENTA}Total terms generated: {count}{RESET}")
    print()


def read_int():
    """
    Read an integer from standard input

    Returns:
        Integer value or None if invalid
    """
    try:
        return int(input().strip())
    except (ValueError, EOFError):
        return None


def main():
    """Main program entry point"""
    clear_screen()
    display_header()
    display_menu()

    choice = read_int()
    if choice is None:
        choice = 0
    print()

    if choice == 1:
        print("Enter the number of terms to generate (max 1476): ", end="")
        sys.stdout.flush()
        n = read_int()
        print()

        if n is None or n <= 0:
            print(f"{RED}Error: Please enter a positive integer.{RESET}")
        elif n > 1476:
            print(f"{RED}Error: Maximum 1476 terms supported.{RESET}")
            print("Using 1476 terms instead.")
            n = 1476
            print()
            generate_fibonacci(n, False, False)
        else:
            generate_fibonacci(n, False, False)

    elif choice == 2:
        print("Enter the maximum value: ", end="")
        sys.stdout.flush()
        max_value = read_int()
        print()

        if max_value is None or max_value < 0:
            print(f"{RED}Error: Please enter a non-negative value.{RESET}")
        else:
            generate_up_to_max(max_value)

    elif choice == 3:
        print("Enter the number of terms to generate (max 1476): ", end="")
        sys.stdout.flush()
        n = read_int()
        print()

        if n is None or n <= 0:
            print(f"{RED}Error: Please enter a positive integer.{RESET}")
        elif n > 1476:
            print(f"{RED}Error: Maximum 1476 terms supported.{RESET}")
            print("Using 1476 terms instead.")
            n = 1476
            print()
            generate_fibonacci(n, True, False)
        else:
            generate_fibonacci(n, True, False)

    elif choice == 4:
        print("Enter the number of terms to generate (max 1476): ", end="")
        sys.stdout.flush()
        n = read_int()
        print()

        if n is None or n <= 0:
            print(f"{RED}Error: Please enter a positive integer.{RESET}")
        elif n > 1476:
            print(f"{RED}Error: Maximum 1476 terms supported.{RESET}")
            print("Using 1476 terms instead.")
            n = 1476
            print()
            generate_fibonacci(n, False, True)
        else:
            generate_fibonacci(n, False, True)

    else:
        print(f"{RED}Invalid choice. Using default mode (option 1).{RESET}")
        print()
        print("Enter the number of terms to generate (max 1476): ", end="")
        sys.stdout.flush()
        n = read_int()
        print()

        if n is not None and n > 0:
            if n > 1476:
                n = 1476
            generate_fibonacci(n, False, False)

    print()
    print(f"{GRAY}Press ENTER to exit...{RESET}")
    input()


if __name__ == "__main__":
    main()
