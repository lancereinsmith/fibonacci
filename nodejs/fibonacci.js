#!/usr/bin/env node

/**
 * Enhanced Fibonacci Sequence Generator in Node.js
 */

const readline = require('readline');

// ANSI color codes
const RESET = '\x1b[0m';
const GREEN = '\x1b[32m';
const YELLOW = '\x1b[33m';
const CYAN = '\x1b[36m';
const MAGENTA = '\x1b[35m';
const RED = '\x1b[31m';
const GRAY = '\x1b[90m';

// Global variables
let t1, t2, nextTerm, sum;
let maxValue;
let ratio;

/**
 * Clear the terminal screen
 */
function clearScreen() {
    // Use ANSI escape codes to clear screen
    console.clear();
}

/**
 * Display the program header
 */
function displayHeader() {
    console.log(`${GREEN}===============================================${RESET}`);
    console.log(`${GREEN}      Enhanced Fibonacci Sequence Generator    ${RESET}`);
    console.log(`${GREEN}===============================================${RESET}`);
    console.log();
}

/**
 * Display menu options
 */
function displayMenu() {
    console.log(`${YELLOW}Generation Options:${RESET}`);
    console.log('  1. Generate by number of terms');
    console.log('  2. Generate up to a maximum value');
    console.log('  3. Display with statistics');
    console.log('  4. Display in columns');
    console.log();
    process.stdout.write('Enter your choice (1-4): ');
}

/**
 * Generate and display Fibonacci sequence
 * @param {number} termCount - Number of terms to generate
 * @param {boolean} showStats - Whether to show statistics
 * @param {boolean} columnMode - Whether to display in columns
 */
function generateFibonacci(termCount, showStats, columnMode) {
    t1 = 0n;
    t2 = 1n;
    sum = 0n;
    const termsPerLine = 10;
    let output = '';

    if (columnMode) {
        console.log(`${CYAN}Fibonacci Sequence (${termCount} terms):${RESET}`);
        console.log();
    } else {
        console.log(`${CYAN}Fibonacci Sequence:${RESET}`);
    }

    // Handle the first term
    if (termCount >= 1) {
        if (columnMode) {
            output += t1.toString().padStart(12);
        } else {
            output += `${t1} `;
        }
        sum += t1;
    }

    // Handle the second term
    if (termCount >= 2) {
        if (columnMode) {
            output += t2.toString().padStart(12);
        } else {
            output += `${t2} `;
        }
        sum += t2;
    }

    // Calculate and print remaining terms
    for (let j = 3; j <= termCount; j++) {
        nextTerm = t1 + t2;

        if (columnMode) {
            output += nextTerm.toString().padStart(12);
            if (j % termsPerLine === 0) {
                output += '\n';
            }
        } else {
            output += `${nextTerm} `;
        }

        sum += nextTerm;

        t1 = t2;
        t2 = nextTerm;
    }

    console.log(output);
    console.log();

    // Display statistics if requested
    if (showStats) {
        console.log(`${MAGENTA}Statistics:${RESET}`);
        console.log(`  Number of terms: ${termCount}`);
        console.log(`  Sum of all terms: ${sum}`);
        const average = Number(sum) / termCount;
        console.log(`  Average value: ${average.toFixed(2)}`);

        if (termCount >= 2) {
            console.log(`  Last term: ${t2}`);
            console.log(`  Second-to-last term: ${t1}`);

            if (t1 !== 0n) {
                ratio = Number(t2) / Number(t1);
                const goldenRatio = 1.6180339887;
                const difference = Math.abs(ratio - goldenRatio);
                console.log(`  Ratio (F(n)/F(n-1)): ${ratio.toFixed(10)}`);
                console.log(`  Golden Ratio (φ): ${goldenRatio.toFixed(10)}`);
                console.log(`  Difference: ${difference.toFixed(10)}`);
            }
        }
        console.log();
    }
}

/**
 * Generate Fibonacci sequence up to a maximum value
 * @param {bigint} maxVal - Maximum value to generate up to
 */
function generateUpToMax(maxVal) {
    t1 = 0n;
    t2 = 1n;
    let count = 0;
    let output = '';

    console.log(`${CYAN}Fibonacci Sequence up to ${maxVal}:${RESET}`);
    console.log();

    if (maxVal >= 0n) {
        output += `${t1} `;
        count++;
    }

    if (maxVal >= 1n) {
        output += `${t2} `;
        count++;
    }

    while ((t1 + t2) <= maxVal) {
        nextTerm = t1 + t2;
        output += `${nextTerm} `;
        count++;
        t1 = t2;
        t2 = nextTerm;
    }

    console.log(output);
    console.log();
    console.log(`${MAGENTA}Total terms generated: ${count}${RESET}`);
    console.log();
}

/**
 * Parse integer input safely
 * @param {string} input - Input string to parse
 * @returns {number|null} Parsed number or null if invalid
 */
function parseIntSafe(input) {
    const num = parseInt(input.trim(), 10);
    return isNaN(num) ? null : num;
}

/**
 * Parse bigint input safely
 * @param {string} input - Input string to parse
 * @returns {bigint|null} Parsed bigint or null if invalid
 */
function parseBigIntSafe(input) {
    try {
        return BigInt(input.trim());
    } catch (e) {
        return null;
    }
}

/**
 * Main program entry point
 */
async function main() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    // Promisify readline question
    const question = (query) => new Promise((resolve) => rl.question(query, resolve));

    clearScreen();
    displayHeader();
    displayMenu();

    const choiceInput = await question('');
    const choice = parseIntSafe(choiceInput);
    console.log();

    try {
        switch (choice) {
            case 1: {
                const nInput = await question('Enter the number of terms to generate (max 1476): ');
                let n = parseIntSafe(nInput);
                console.log();

                if (n === null || n <= 0) {
                    console.log(`${RED}Error: Please enter a positive integer.${RESET}`);
                } else if (n > 1476) {
                    console.log(`${RED}Error: Maximum 1476 terms supported with BigInt.${RESET}`);
                    console.log('Using 1476 terms instead.');
                    n = 1476;
                    console.log();
                    generateFibonacci(n, false, false);
                } else {
                    generateFibonacci(n, false, false);
                }
                break;
            }

            case 2: {
                const maxInput = await question('Enter the maximum value: ');
                const maxValue = parseBigIntSafe(maxInput);
                console.log();

                if (maxValue === null || maxValue < 0n) {
                    console.log(`${RED}Error: Please enter a non-negative value.${RESET}`);
                } else {
                    generateUpToMax(maxValue);
                }
                break;
            }

            case 3: {
                const nInput = await question('Enter the number of terms to generate (max 1476): ');
                let n = parseIntSafe(nInput);
                console.log();

                if (n === null || n <= 0) {
                    console.log(`${RED}Error: Please enter a positive integer.${RESET}`);
                } else if (n > 1476) {
                    console.log(`${RED}Error: Maximum 1476 terms supported with BigInt.${RESET}`);
                    console.log('Using 1476 terms instead.');
                    n = 1476;
                    console.log();
                    generateFibonacci(n, true, false);
                } else {
                    generateFibonacci(n, true, false);
                }
                break;
            }

            case 4: {
                const nInput = await question('Enter the number of terms to generate (max 1476): ');
                let n = parseIntSafe(nInput);
                console.log();

                if (n === null || n <= 0) {
                    console.log(`${RED}Error: Please enter a positive integer.${RESET}`);
                } else if (n > 1476) {
                    console.log(`${RED}Error: Maximum 1476 terms supported with BigInt.${RESET}`);
                    console.log('Using 1476 terms instead.');
                    n = 1476;
                    console.log();
                    generateFibonacci(n, false, true);
                } else {
                    generateFibonacci(n, false, true);
                }
                break;
            }

            default: {
                console.log(`${RED}Invalid choice. Using default mode (option 1).${RESET}`);
                console.log();
                const nInput = await question('Enter the number of terms to generate (max 1476): ');
                let n = parseIntSafe(nInput);
                console.log();

                if (n !== null && n > 0) {
                    if (n > 1476) n = 1476;
                    generateFibonacci(n, false, false);
                }
                break;
            }
        }

        console.log();
        console.log(`${GRAY}Press ENTER to exit...${RESET}`);
        await question('');
    } finally {
        rl.close();
    }
}

// Run the main program
main().catch(console.error);

