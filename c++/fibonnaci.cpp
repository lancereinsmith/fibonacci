#include <iostream>
#include <iomanip>
#include <cmath>
#include <limits>
#ifdef _WIN32
#include <windows.h>
#include <conio.h>
#else
#include <termios.h>
#include <unistd.h>
#endif

using namespace std;

// ANSI color codes for cross-platform support
const string RESET = "\033[0m";
const string GREEN = "\033[32m";
const string YELLOW = "\033[33m";
const string CYAN = "\033[36m";
const string MAGENTA = "\033[35m";
const string RED = "\033[31m";
const string GRAY = "\033[90m";

// Global variables
long long t1, t2, nextTerm, sum;
long long maxValue;
double fibRatio;

// Function to clear screen
void clearScreen() {
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}

// Function to wait for Enter key
void waitForEnter() {
    cout << "\nPress ENTER to exit...";
    cin.ignore();
    cin.get();
}

// Procedure to display the header
void displayHeader() {
    cout << GREEN << "===============================================" << RESET << endl;
    cout << GREEN << "      Enhanced Fibonacci Sequence Generator    " << RESET << endl;
    cout << GREEN << "===============================================" << RESET << endl;
    cout << endl;
}

// Procedure to display menu options
void displayMenu() {
    cout << YELLOW << "Generation Options:" << RESET << endl;
    cout << "  1. Generate by number of terms" << endl;
    cout << "  2. Generate up to a maximum value" << endl;
    cout << "  3. Display with statistics" << endl;
    cout << "  4. Display in columns" << endl;
    cout << endl;
    cout << "Enter your choice (1-4): ";
}

// Procedure to generate and display Fibonacci sequence
void generateFibonacci(int termCount, bool showStats, bool columnMode) {
    t1 = 0;
    t2 = 1;
    sum = 0;
    int termsPerLine = 10;

    if (columnMode) {
        cout << CYAN << "Fibonacci Sequence (" << termCount << " terms):" << RESET << endl;
        cout << endl;
    } else {
        cout << CYAN << "Fibonacci Sequence:" << RESET << endl;
    }

    // Handle the first term
    if (termCount >= 1) {
        if (columnMode)
            cout << setw(12) << t1;
        else
            cout << t1 << " ";
        sum += t1;
    }

    // Handle the second term
    if (termCount >= 2) {
        if (columnMode)
            cout << setw(12) << t2;
        else
            cout << t2 << " ";
        sum += t2;
    }

    // Calculate and print remaining terms
    for (int j = 3; j <= termCount; j++) {
        nextTerm = t1 + t2;
        
        if (columnMode) {
            cout << setw(12) << nextTerm;
            if (j % termsPerLine == 0)
                cout << endl;
        } else {
            cout << nextTerm << " ";
        }
        
        sum += nextTerm;
        
        t1 = t2;
        t2 = nextTerm;
    }
    
    cout << endl;
    cout << endl;

    // Display statistics if requested
    if (showStats) {
        cout << MAGENTA << "Statistics:" << RESET << endl;
        cout << "  Number of terms: " << termCount << endl;
        cout << "  Sum of all terms: " << sum << endl;
        cout << fixed << setprecision(2);
        cout << "  Average value: " << (double)sum / termCount << endl;
        if (termCount >= 2) {
            cout << "  Last term: " << t2 << endl;
            cout << "  Second-to-last term: " << t1 << endl;
            if (t1 != 0) {
                fibRatio = (double)t2 / t1;
                cout << fixed << setprecision(10);
                cout << "  Ratio (F(n)/F(n-1)): " << fibRatio << endl;
                cout << "  Golden Ratio (φ): 1.6180339887" << endl;
                cout << "  Difference: " << abs(fibRatio - 1.6180339887) << endl;
            }
        }
        cout << endl;
    }
}

// Procedure to generate up to a maximum value
void generateUpToMax(long long maxVal) {
    t1 = 0;
    t2 = 1;
    int count = 0;

    cout << CYAN << "Fibonacci Sequence up to " << maxVal << ":" << RESET << endl;
    cout << endl;

    if (maxVal >= 0) {
        cout << t1 << " ";
        count++;
    }

    if (maxVal >= 1) {
        cout << t2 << " ";
        count++;
    }

    while ((t1 + t2) <= maxVal) {
        nextTerm = t1 + t2;
        cout << nextTerm << " ";
        count++;
        t1 = t2;
        t2 = nextTerm;
    }

    cout << endl;
    cout << endl;
    cout << MAGENTA << "Total terms generated: " << count << RESET << endl;
    cout << endl;
}

int main() {
    int n, choice;
    
    // Clear the terminal screen
    clearScreen();
    
    displayHeader();
    displayMenu();
    cin >> choice;
    cout << endl;

    switch (choice) {
        case 1: {
            cout << "Enter the number of terms to generate (max 92): ";
            cin >> n;
            cout << endl;
            
            if (n <= 0) {
                cout << RED << "Error: Please enter a positive integer." << RESET << endl;
            } else if (n > 92) {
                cout << RED << "Error: Maximum 92 terms supported with long long." << endl;
                cout << "Using 92 terms instead." << RESET << endl;
                n = 92;
                cout << endl;
                generateFibonacci(n, false, false);
            } else {
                generateFibonacci(n, false, false);
            }
            break;
        }
        
        case 2: {
            cout << "Enter the maximum value: ";
            cin >> maxValue;
            cout << endl;
            
            if (maxValue < 0) {
                cout << RED << "Error: Please enter a non-negative value." << RESET << endl;
            } else {
                generateUpToMax(maxValue);
            }
            break;
        }
        
        case 3: {
            cout << "Enter the number of terms to generate (max 92): ";
            cin >> n;
            cout << endl;
            
            if (n <= 0) {
                cout << RED << "Error: Please enter a positive integer." << RESET << endl;
            } else if (n > 92) {
                cout << RED << "Error: Maximum 92 terms supported with long long." << endl;
                cout << "Using 92 terms instead." << RESET << endl;
                n = 92;
                cout << endl;
                generateFibonacci(n, true, false);
            } else {
                generateFibonacci(n, true, false);
            }
            break;
        }
        
        case 4: {
            cout << "Enter the number of terms to generate (max 92): ";
            cin >> n;
            cout << endl;
            
            if (n <= 0) {
                cout << RED << "Error: Please enter a positive integer." << RESET << endl;
            } else if (n > 92) {
                cout << RED << "Error: Maximum 92 terms supported with long long." << endl;
                cout << "Using 92 terms instead." << RESET << endl;
                n = 92;
                cout << endl;
                generateFibonacci(n, false, true);
            } else {
                generateFibonacci(n, false, true);
            }
            break;
        }
        
        default: {
            cout << RED << "Invalid choice. Using default mode (option 1)." << RESET << endl;
            cout << endl;
            cout << "Enter the number of terms to generate (max 92): ";
            cin >> n;
            cout << endl;
            if (n > 0) {
                if (n > 92) n = 92;
                generateFibonacci(n, false, false);
            }
            break;
        }
    }

    cout << endl;
    waitForEnter();
    return 0;
}

