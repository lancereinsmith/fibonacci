#!/usr/bin/env ruby

# Enhanced Fibonacci Sequence Generator in Ruby

# ANSI color codes
RESET = "\e[0m"
GREEN = "\e[32m"
YELLOW = "\e[33m"
CYAN = "\e[36m"
MAGENTA = "\e[35m"
RED = "\e[31m"
GRAY = "\e[90m"

# Global variables
$t1 = 0
$t2 = 1
$next_term = 0
$sum = 0

# Clear the terminal screen
def clear_screen
  print "\e[H\e[2J"
  $stdout.flush
end

# Display the program header
def display_header
  puts "#{GREEN}===============================================#{RESET}"
  puts "#{GREEN}      Enhanced Fibonacci Sequence Generator    #{RESET}"
  puts "#{GREEN}===============================================#{RESET}"
  puts
end

# Display menu options
def display_menu
  puts "#{YELLOW}Generation Options:#{RESET}"
  puts "  1. Generate by number of terms"
  puts "  2. Generate up to a maximum value"
  puts "  3. Display with statistics"
  puts "  4. Display in columns"
  puts
  print "Enter your choice (1-4): "
end

# Generate and display Fibonacci sequence
def generate_fibonacci(term_count, show_stats, column_mode)
  $t1 = 0
  $t2 = 1
  $sum = 0
  terms_per_line = 10
  
  if column_mode
    puts "#{CYAN}Fibonacci Sequence (#{term_count} terms):#{RESET}"
    puts
  else
    puts "#{CYAN}Fibonacci Sequence:#{RESET}"
  end
  
  # Handle the first term
  if term_count >= 1
    if column_mode
      print "%12d" % $t1
    else
      print "#{$t1} "
    end
    $sum += $t1
  end
  
  # Handle the second term
  if term_count >= 2
    if column_mode
      print "%12d" % $t2
    else
      print "#{$t2} "
    end
    $sum += $t2
  end
  
  # Calculate and print remaining terms
  (3..term_count).each do |j|
    $next_term = $t1 + $t2
    
    if column_mode
      print "%12d" % $next_term
      puts if j % terms_per_line == 0
    else
      print "#{$next_term} "
    end
    
    $sum += $next_term
    
    $t1 = $t2
    $t2 = $next_term
  end
  
  puts
  puts
  
  # Display statistics if requested
  if show_stats
    puts "#{MAGENTA}Statistics:#{RESET}"
    puts "  Number of terms: #{term_count}"
    puts "  Sum of all terms: #{$sum}"
    average = $sum.to_f / term_count
    puts "  Average value: %.2f" % average
    
    if term_count >= 2
      puts "  Last term: #{$t2}"
      puts "  Second-to-last term: #{$t1}"
      
      if $t1 != 0
        ratio = $t2.to_f / $t1
        golden_ratio = 1.6180339887
        difference = (ratio - golden_ratio).abs
        puts "  Ratio (F(n)/F(n-1)): %.10f" % ratio
        puts "  Golden Ratio (φ): %.10f" % golden_ratio
        puts "  Difference: %.10f" % difference
      end
    end
    puts
  end
end

# Generate Fibonacci sequence up to a maximum value
def generate_up_to_max(max_val)
  $t1 = 0
  $t2 = 1
  count = 0
  
  puts "#{CYAN}Fibonacci Sequence up to #{max_val}:#{RESET}"
  puts
  
  if max_val >= 0
    print "#{$t1} "
    count += 1
  end
  
  if max_val >= 1
    print "#{$t2} "
    count += 1
  end
  
  while ($t1 + $t2) <= max_val
    $next_term = $t1 + $t2
    print "#{$next_term} "
    count += 1
    $t1 = $t2
    $t2 = $next_term
  end
  
  puts
  puts
  puts "#{MAGENTA}Total terms generated: #{count}#{RESET}"
  puts
end

# Read an integer from standard input
def read_int
  input = gets
  return nil if input.nil?
  input.strip.to_i
rescue ArgumentError
  nil
end

# Main program entry point
def main
  clear_screen
  display_header
  display_menu
  
  choice = read_int || 0
  puts
  
  case choice
  when 1
    print "Enter the number of terms to generate (max 1476): "
    n = read_int || 0
    puts
    
    if n <= 0
      puts "#{RED}Error: Please enter a positive integer.#{RESET}"
    elsif n > 1476
      puts "#{RED}Error: Maximum 1476 terms supported.#{RESET}"
      puts "Using 1476 terms instead."
      n = 1476
      puts
      generate_fibonacci(n, false, false)
    else
      generate_fibonacci(n, false, false)
    end
    
  when 2
    print "Enter the maximum value: "
    max_value = read_int || -1
    puts
    
    if max_value < 0
      puts "#{RED}Error: Please enter a non-negative value.#{RESET}"
    else
      generate_up_to_max(max_value)
    end
    
  when 3
    print "Enter the number of terms to generate (max 1476): "
    n = read_int || 0
    puts
    
    if n <= 0
      puts "#{RED}Error: Please enter a positive integer.#{RESET}"
    elsif n > 1476
      puts "#{RED}Error: Maximum 1476 terms supported.#{RESET}"
      puts "Using 1476 terms instead."
      n = 1476
      puts
      generate_fibonacci(n, true, false)
    else
      generate_fibonacci(n, true, false)
    end
    
  when 4
    print "Enter the number of terms to generate (max 1476): "
    n = read_int || 0
    puts
    
    if n <= 0
      puts "#{RED}Error: Please enter a positive integer.#{RESET}"
    elsif n > 1476
      puts "#{RED}Error: Maximum 1476 terms supported.#{RESET}"
      puts "Using 1476 terms instead."
      n = 1476
      puts
      generate_fibonacci(n, false, true)
    else
      generate_fibonacci(n, false, true)
    end
    
  else
    puts "#{RED}Invalid choice. Using default mode (option 1).#{RESET}"
    puts
    print "Enter the number of terms to generate (max 1476): "
    n = read_int || 0
    puts
    
    if n > 0
      n = 1476 if n > 1476
      generate_fibonacci(n, false, false)
    end
  end
  
  puts
  puts "#{GRAY}Press ENTER to exit...#{RESET}"
  gets
end

# Run the main program
main if __FILE__ == $0

