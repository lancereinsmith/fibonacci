#import <Foundation/Foundation.h>
#import <stdio.h>

/**
 * Enhanced Fibonacci Sequence Generator in Objective-C
 */

// ANSI color codes
#define RESET "\033[0m"
#define GREEN "\033[32m"
#define YELLOW "\033[33m"
#define CYAN "\033[36m"
#define MAGENTA "\033[35m"
#define RED "\033[31m"
#define GRAY "\033[90m"

// Global variables
long long t1, t2, nextTerm, sum;
long long maxValue;
double ratio;

/**
 * Clear the terminal screen
 */
void clearScreen() {
    printf("\033[H\033[2J");
    fflush(stdout);
}

/**
 * Display the program header
 */
void displayHeader() {
    printf("%s===============================================%s\n", GREEN, RESET);
    printf("%s      Enhanced Fibonacci Sequence Generator    %s\n", GREEN, RESET);
    printf("%s===============================================%s\n", GREEN, RESET);
    printf("\n");
}

/**
 * Display menu options
 */
void displayMenu() {
    printf("%sGeneration Options:%s\n", YELLOW, RESET);
    printf("  1. Generate by number of terms\n");
    printf("  2. Generate up to a maximum value\n");
    printf("  3. Display with statistics\n");
    printf("  4. Display in columns\n");
    printf("\n");
    printf("Enter your choice (1-4): ");
    fflush(stdout);
}

/**
 * Generate and display Fibonacci sequence
 */
void generateFibonacci(int termCount, BOOL showStats, BOOL columnMode) {
    t1 = 0;
    t2 = 1;
    sum = 0;
    int termsPerLine = 10;
    
    if (columnMode) {
        printf("%sFibonacci Sequence (%d terms):%s\n", CYAN, termCount, RESET);
        printf("\n");
    } else {
        printf("%sFibonacci Sequence:%s\n", CYAN, RESET);
    }
    
    // Handle the first term
    if (termCount >= 1) {
        if (columnMode) {
            printf("%12lld", t1);
        } else {
            printf("%lld ", t1);
        }
        sum += t1;
    }
    
    // Handle the second term
    if (termCount >= 2) {
        if (columnMode) {
            printf("%12lld", t2);
        } else {
            printf("%lld ", t2);
        }
        sum += t2;
    }
    
    // Calculate and print remaining terms
    for (int j = 3; j <= termCount; j++) {
        nextTerm = t1 + t2;
        
        if (columnMode) {
            printf("%12lld", nextTerm);
            if (j % termsPerLine == 0) {
                printf("\n");
            }
        } else {
            printf("%lld ", nextTerm);
        }
        
        sum += nextTerm;
        
        t1 = t2;
        t2 = nextTerm;
    }
    
    printf("\n\n");
    
    // Display statistics if requested
    if (showStats) {
        printf("%sStatistics:%s\n", MAGENTA, RESET);
        printf("  Number of terms: %d\n", termCount);
        printf("  Sum of all terms: %lld\n", sum);
        double average = (double)sum / termCount;
        printf("  Average value: %.2f\n", average);
        
        if (termCount >= 2) {
            printf("  Last term: %lld\n", t2);
            printf("  Second-to-last term: %lld\n", t1);
            
            if (t1 != 0) {
                ratio = (double)t2 / t1;
                double goldenRatio = 1.6180339887;
                double difference = fabs(ratio - goldenRatio);
                printf("  Ratio (F(n)/F(n-1)): %.10f\n", ratio);
                printf("  Golden Ratio (φ): %.10f\n", goldenRatio);
                printf("  Difference: %.10f\n", difference);
            }
        }
        printf("\n");
    }
}

/**
 * Generate Fibonacci sequence up to a maximum value
 */
void generateUpToMax(long long maxVal) {
    t1 = 0;
    t2 = 1;
    int count = 0;
    
    printf("%sFibonacci Sequence up to %lld:%s\n", CYAN, maxVal, RESET);
    printf("\n");
    
    if (maxVal >= 0) {
        printf("%lld ", t1);
        count++;
    }
    
    if (maxVal >= 1) {
        printf("%lld ", t2);
        count++;
    }
    
    while ((t1 + t2) <= maxVal) {
        nextTerm = t1 + t2;
        printf("%lld ", nextTerm);
        count++;
        t1 = t2;
        t2 = nextTerm;
    }
    
    printf("\n\n");
    printf("%sTotal terms generated: %d%s\n", MAGENTA, count, RESET);
    printf("\n");
}

/**
 * Read an integer from standard input
 */
int readInt() {
    int value;
    if (scanf("%d", &value) == 1) {
        // Clear the input buffer
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    // Clear the input buffer on error
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
    return -1;
}

/**
 * Read a long long from standard input
 */
long long readLongLong() {
    long long value;
    if (scanf("%lld", &value) == 1) {
        // Clear the input buffer
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    // Clear the input buffer on error
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
    return -1;
}

/**
 * Wait for Enter key
 */
void waitForEnter() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

/**
 * Main program entry point
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n, choice;
        
        clearScreen();
        displayHeader();
        displayMenu();
        
        choice = readInt();
        printf("\n");
        
        switch (choice) {
            case 1:
                printf("Enter the number of terms to generate (max 92): ");
                fflush(stdout);
                n = readInt();
                printf("\n");
                
                if (n <= 0) {
                    printf("%sError: Please enter a positive integer.%s\n", RED, RESET);
                } else if (n > 92) {
                    printf("%sError: Maximum 92 terms supported with long long.%s\n", RED, RESET);
                    printf("Using 92 terms instead.\n");
                    n = 92;
                    printf("\n");
                    generateFibonacci(n, NO, NO);
                } else {
                    generateFibonacci(n, NO, NO);
                }
                break;
                
            case 2:
                printf("Enter the maximum value: ");
                fflush(stdout);
                maxValue = readLongLong();
                printf("\n");
                
                if (maxValue < 0) {
                    printf("%sError: Please enter a non-negative value.%s\n", RED, RESET);
                } else {
                    generateUpToMax(maxValue);
                }
                break;
                
            case 3:
                printf("Enter the number of terms to generate (max 92): ");
                fflush(stdout);
                n = readInt();
                printf("\n");
                
                if (n <= 0) {
                    printf("%sError: Please enter a positive integer.%s\n", RED, RESET);
                } else if (n > 92) {
                    printf("%sError: Maximum 92 terms supported with long long.%s\n", RED, RESET);
                    printf("Using 92 terms instead.\n");
                    n = 92;
                    printf("\n");
                    generateFibonacci(n, YES, NO);
                } else {
                    generateFibonacci(n, YES, NO);
                }
                break;
                
            case 4:
                printf("Enter the number of terms to generate (max 92): ");
                fflush(stdout);
                n = readInt();
                printf("\n");
                
                if (n <= 0) {
                    printf("%sError: Please enter a positive integer.%s\n", RED, RESET);
                } else if (n > 92) {
                    printf("%sError: Maximum 92 terms supported with long long.%s\n", RED, RESET);
                    printf("Using 92 terms instead.\n");
                    n = 92;
                    printf("\n");
                    generateFibonacci(n, NO, YES);
                } else {
                    generateFibonacci(n, NO, YES);
                }
                break;
                
            default:
                printf("%sInvalid choice. Using default mode (option 1).%s\n", RED, RESET);
                printf("\n");
                printf("Enter the number of terms to generate (max 92): ");
                fflush(stdout);
                n = readInt();
                printf("\n");
                
                if (n > 0) {
                    if (n > 92) n = 92;
                    generateFibonacci(n, NO, NO);
                }
                break;
        }
        
        printf("\n");
        printf("%sPress ENTER to exit...%s\n", GRAY, RESET);
        waitForEnter();
    }
    return 0;
}

