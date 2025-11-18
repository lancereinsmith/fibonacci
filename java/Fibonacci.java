import java.util.Scanner;

public class Fibonacci {
    // ANSI color codes
    private static final String RESET = "\033[0m";
    private static final String GREEN = "\033[32m";
    private static final String YELLOW = "\033[33m";
    private static final String CYAN = "\033[36m";
    private static final String MAGENTA = "\033[35m";
    private static final String RED = "\033[31m";
    private static final String GRAY = "\033[90m";
    
    // Global variables
    private static long t1, t2, nextTerm, sum;
    private static long maxValue;
    private static double ratio;
    
    // Function to clear screen
    private static void clearScreen() {
        try {
            String os = System.getProperty("os.name").toLowerCase();
            if (os.contains("win")) {
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            } else {
                new ProcessBuilder("clear").inheritIO().start().waitFor();
            }
        } catch (Exception e) {
            // If clearing fails, just print newlines
            System.out.print("\033[H\033[2J");
            System.out.flush();
        }
    }
    
    // Procedure to display the header
    private static void displayHeader() {
        System.out.println(GREEN + "===============================================" + RESET);
        System.out.println(GREEN + "      Enhanced Fibonacci Sequence Generator    " + RESET);
        System.out.println(GREEN + "===============================================" + RESET);
        System.out.println();
    }
    
    // Procedure to display menu options
    private static void displayMenu() {
        System.out.println(YELLOW + "Generation Options:" + RESET);
        System.out.println("  1. Generate by number of terms");
        System.out.println("  2. Generate up to a maximum value");
        System.out.println("  3. Display with statistics");
        System.out.println("  4. Display in columns");
        System.out.println();
        System.out.print("Enter your choice (1-4): ");
    }
    
    // Procedure to generate and display Fibonacci sequence
    private static void generateFibonacci(int termCount, boolean showStats, boolean columnMode) {
        t1 = 0;
        t2 = 1;
        sum = 0;
        int termsPerLine = 10;
        
        if (columnMode) {
            System.out.println(CYAN + "Fibonacci Sequence (" + termCount + " terms):" + RESET);
            System.out.println();
        } else {
            System.out.println(CYAN + "Fibonacci Sequence:" + RESET);
        }
        
        // Handle the first term
        if (termCount >= 1) {
            if (columnMode)
                System.out.printf("%12d", t1);
            else
                System.out.print(t1 + " ");
            sum += t1;
        }
        
        // Handle the second term
        if (termCount >= 2) {
            if (columnMode)
                System.out.printf("%12d", t2);
            else
                System.out.print(t2 + " ");
            sum += t2;
        }
        
        // Calculate and print remaining terms
        for (int j = 3; j <= termCount; j++) {
            nextTerm = t1 + t2;
            
            if (columnMode) {
                System.out.printf("%12d", nextTerm);
                if (j % termsPerLine == 0)
                    System.out.println();
            } else {
                System.out.print(nextTerm + " ");
            }
            
            sum += nextTerm;
            
            t1 = t2;
            t2 = nextTerm;
        }
        
        System.out.println();
        System.out.println();
        
        // Display statistics if requested
        if (showStats) {
            System.out.println(MAGENTA + "Statistics:" + RESET);
            System.out.println("  Number of terms: " + termCount);
            System.out.println("  Sum of all terms: " + sum);
            System.out.printf("  Average value: %.2f%n", (double)sum / termCount);
            if (termCount >= 2) {
                System.out.println("  Last term: " + t2);
                System.out.println("  Second-to-last term: " + t1);
                if (t1 != 0) {
                    ratio = (double)t2 / t1;
                    System.out.printf("  Ratio (F(n)/F(n-1)): %.10f%n", ratio);
                    System.out.println("  Golden Ratio (φ): 1.6180339887");
                    System.out.printf("  Difference: %.10f%n", Math.abs(ratio - 1.6180339887));
                }
            }
            System.out.println();
        }
    }
    
    // Procedure to generate up to a maximum value
    private static void generateUpToMax(long maxVal) {
        t1 = 0;
        t2 = 1;
        int count = 0;
        
        System.out.println(CYAN + "Fibonacci Sequence up to " + maxVal + ":" + RESET);
        System.out.println();
        
        if (maxVal >= 0) {
            System.out.print(t1 + " ");
            count++;
        }
        
        if (maxVal >= 1) {
            System.out.print(t2 + " ");
            count++;
        }
        
        while ((t1 + t2) <= maxVal) {
            nextTerm = t1 + t2;
            System.out.print(nextTerm + " ");
            count++;
            t1 = t2;
            t2 = nextTerm;
        }
        
        System.out.println();
        System.out.println();
        System.out.println(MAGENTA + "Total terms generated: " + count + RESET);
        System.out.println();
    }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n, choice;
        
        // Clear the terminal screen
        clearScreen();
        
        displayHeader();
        displayMenu();
        choice = scanner.nextInt();
        System.out.println();
        
        switch (choice) {
            case 1: {
                System.out.print("Enter the number of terms to generate (max 92): ");
                n = scanner.nextInt();
                System.out.println();
                
                if (n <= 0) {
                    System.out.println(RED + "Error: Please enter a positive integer." + RESET);
                } else if (n > 92) {
                    System.out.println(RED + "Error: Maximum 92 terms supported with long." + RESET);
                    System.out.println("Using 92 terms instead.");
                    n = 92;
                    System.out.println();
                    generateFibonacci(n, false, false);
                } else {
                    generateFibonacci(n, false, false);
                }
                break;
            }
            
            case 2: {
                System.out.print("Enter the maximum value: ");
                maxValue = scanner.nextLong();
                System.out.println();
                
                if (maxValue < 0) {
                    System.out.println(RED + "Error: Please enter a non-negative value." + RESET);
                } else {
                    generateUpToMax(maxValue);
                }
                break;
            }
            
            case 3: {
                System.out.print("Enter the number of terms to generate (max 92): ");
                n = scanner.nextInt();
                System.out.println();
                
                if (n <= 0) {
                    System.out.println(RED + "Error: Please enter a positive integer." + RESET);
                } else if (n > 92) {
                    System.out.println(RED + "Error: Maximum 92 terms supported with long." + RESET);
                    System.out.println("Using 92 terms instead.");
                    n = 92;
                    System.out.println();
                    generateFibonacci(n, true, false);
                } else {
                    generateFibonacci(n, true, false);
                }
                break;
            }
            
            case 4: {
                System.out.print("Enter the number of terms to generate (max 92): ");
                n = scanner.nextInt();
                System.out.println();
                
                if (n <= 0) {
                    System.out.println(RED + "Error: Please enter a positive integer." + RESET);
                } else if (n > 92) {
                    System.out.println(RED + "Error: Maximum 92 terms supported with long." + RESET);
                    System.out.println("Using 92 terms instead.");
                    n = 92;
                    System.out.println();
                    generateFibonacci(n, false, true);
                } else {
                    generateFibonacci(n, false, true);
                }
                break;
            }
            
            default: {
                System.out.println(RED + "Invalid choice. Using default mode (option 1)." + RESET);
                System.out.println();
                System.out.print("Enter the number of terms to generate (max 92): ");
                n = scanner.nextInt();
                System.out.println();
                if (n > 0) {
                    if (n > 92) n = 92;
                    generateFibonacci(n, false, false);
                }
                break;
            }
        }
        
        System.out.println();
        System.out.println(GRAY + "Press ENTER to exit..." + RESET);
        scanner.nextLine(); // consume newline
        scanner.nextLine(); // wait for enter
        scanner.close();
    }
}

