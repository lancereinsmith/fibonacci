# Enhanced Fibonacci Sequence Generator

A multi-language implementation of an enhanced Fibonacci sequence generator with interactive menu options, statistics, and multiple display modes. Available in **Turbo Pascal**, **C++**, **Java**, **Common Lisp**, **Go**, **Fortran**, and **Node.js**.

## Features

All three implementations include:

- **Menu-driven interface** with 4 generation modes:
  1. Generate by number of terms
  2. Generate up to a maximum value
  3. Display with statistics (sum, average, golden ratio approximation)
  4. Display in aligned columns

- **Color-coded output** for better readability
- **Input validation** with clear error messages
- **Cross-platform compatibility**

## Prerequisites

This guide assumes you have [Homebrew](https://brew.sh/) installed on macOS. If you don't have Homebrew, install it first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Installation

### 1. Install Pascal Compiler (Free Pascal)

Free Pascal is a Turbo Pascal-compatible compiler that works well on macOS:

```bash
brew install fpc
```

Verify installation:

```bash
fpc -v
```

### 2. Install C++ Compiler

macOS comes with Clang, but you can also install GCC via Homebrew for better compatibility:

```bash
brew install gcc
```

Or use the built-in Clang (usually already available):

```bash
clang++ --version
```

### 3. Install Java Development Kit (JDK)

Install OpenJDK via Homebrew:

```bash
brew install openjdk
```

After installation, you may need to link it:

```bash
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

Verify installation:

```bash
java -version
javac -version
```

### 4. Install Common Lisp (SBCL)

Install Steel Bank Common Lisp via Homebrew:

```bash
brew install sbcl
```

Verify installation:

```bash
sbcl --version
```

### 5. Install Go

Install Go via Homebrew:

```bash
brew install go
```

Verify installation:

```bash
go version
```

### 6. Install Fortran Compiler (GFortran)

Install GFortran via Homebrew:

```bash
brew install gcc
```

This installs GCC which includes gfortran. Verify installation:

```bash
gfortran --version
```

### 7. Install Node.js

Install Node.js via Homebrew:

```bash
brew install node
```

Verify installation:

```bash
node --version
npm --version
```

## Compilation & Running

### Turbo Pascal (`fibonnaci.pas`)

**Compile:**

```bash
fpc fibonnaci.pas
```

This will create an executable named `fibonnaci` (or `fibonnaci.exe` on some systems).

**Run:**

```bash
./fibonnaci
```

**Note:** If you encounter issues with the `crt` unit (used for screen clearing and colors), Free Pascal should handle it, but some terminal emulators may not support all color features.

### C++ (`fibonnaci.cpp`)

**Compile:**

```bash
# Using Clang (default on macOS)
clang++ -o fibonnaci fibonnaci.cpp

# Or using GCC (if installed via Homebrew)
g++ -o fibonnaci fibonnaci.cpp
```

**Run:**

```bash
./fibonnaci
```

**Note:** The C++ version uses ANSI escape codes for colors, which work in most modern terminals (Terminal.app, iTerm2, etc.).

### Java (`Fibonacci.java`)

**Compile:**

```bash
javac Fibonacci.java
```

This creates `Fibonacci.class` in the same directory.

**Run:**

```bash
java Fibonacci
```

**Note:** Java uses ANSI escape codes for colors. If colors don't appear, your terminal may not support them, but the program will still function correctly.

### Common Lisp (`fibonacci.lisp`)

**Run directly with SBCL:**

```bash
sbcl --script fibonacci.lisp
```

**Or compile and run:**

```bash
# Start SBCL
sbcl

# In the SBCL REPL:
(load "fibonacci.lisp")
```

**Note:** The Lisp version uses ANSI escape codes for colors. For best results, run in a terminal that supports ANSI codes.

### Go (`fibonacci.go`)

**Compile:**

```bash
go build fibonacci.go
```

This creates an executable named `fibonacci` in the same directory.

**Run:**

```bash
./fibonacci
```

**Or compile and run in one step:**

```bash
go run fibonacci.go
```

**Note:** Go uses ANSI escape codes for colors, which work in most modern terminals.

### Fortran (`fibonacci.f90`)

**Compile:**

```bash
gfortran -o fibonacci fibonacci.f90
```

This creates an executable named `fibonacci`.

**Run:**

```bash
./fibonacci
```

**Note:** The Fortran version uses ANSI escape codes for colors. Modern Fortran compilers like GFortran support these well.

### Node.js (`fibonacci.js`)

**Run directly:**

```bash
node fibonacci.js
```

**Or make it executable and run:**

```bash
chmod +x fibonacci.js
./fibonacci.js
```

**Note:** The Node.js version uses BigInt for arbitrary precision arithmetic, allowing it to calculate up to 1476 terms before running into JavaScript's Number precision limits. It uses ANSI escape codes for colors which work in most modern terminals.

## Program Usage

When you run any of the programs, you'll see a menu:

```text
===============================================
      Enhanced Fibonacci Sequence Generator    
===============================================

Generation Options:
  1. Generate by number of terms
  2. Generate up to a maximum value
  3. Display with statistics
  4. Display in columns

Enter your choice (1-4):
```

### Option 1: Generate by Number of Terms

Generates a specified number of Fibonacci numbers starting from 0, 1, ...

**Example:** Enter `10` to generate the first 10 Fibonacci numbers.

### Option 2: Generate up to Maximum Value

Generates all Fibonacci numbers up to (and including) a specified maximum value.

**Example:** Enter `100` to generate: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89

### Option 3: Display with Statistics

Generates Fibonacci numbers and displays:

- Number of terms
- Sum of all terms
- Average value
- Last two terms
- Ratio approximation to the golden ratio (φ ≈ 1.6180339887)

### Option 4: Display in Columns

Generates Fibonacci numbers in a neatly aligned column format (10 numbers per line).

## Technical Details

### Maximum Terms Supported

- **Pascal:** Up to 46 terms (using `LongInt`)
- **C++:** Up to 92 terms (using `long long`)
- **Java:** Up to 92 terms (using `long`)
- **Common Lisp:** Up to 92 terms (using fixnum/bignum, but limited to 92 for consistency)
- **Go:** Up to 92 terms (using `int64`)
- **Fortran:** Up to 92 terms (using `integer(kind=8)`)
- **Node.js:** Up to 1476 terms (using `BigInt` for arbitrary precision)

### Color Support

All programs use ANSI escape codes for terminal colors. If your terminal doesn't support colors, the programs will still function, but output will appear without color formatting.

### Platform Compatibility

- **Pascal:** Free Pascal is cross-platform; this code is compatible with Turbo Pascal
- **C++:** Standard C++11 features; compatible with Clang and GCC
- **Java:** Java 8+ compatible; uses standard Java libraries only
- **Common Lisp:** SBCL compatible; should work with other Common Lisp implementations
- **Go:** Go 1.11+ compatible; uses standard library only
- **Fortran:** Fortran 90+ standard; compatible with GFortran and other modern compilers
- **Node.js:** Node.js 10.4.0+ (requires BigInt support); uses built-in modules only

## Troubleshooting

### Pascal Issues

**Problem:** `Error: Can't find unit crt`

- **Solution:** Free Pascal should include the `crt` unit. If not, try installing a different Pascal compiler or use the `crt` unit from Free Pascal's standard library.

**Problem:** Colors don't work

- **Solution:** Some terminal emulators don't support all Turbo Pascal color features. The program will still work, just without colors.

### C++ Issues

**Problem:** `clang++: command not found`

- **Solution:** Install Xcode Command Line Tools: `xcode-select --install`

**Problem:** Colors don't appear

- **Solution:** Ensure your terminal supports ANSI escape codes. Try using Terminal.app or iTerm2.

### Java Issues

**Problem:** `javac: command not found`

- **Solution:** Make sure OpenJDK is properly installed and linked. Try: `brew reinstall openjdk`

**Problem:** `java: command not found`

- **Solution:** Add Java to your PATH or use the full path: `/opt/homebrew/opt/openjdk/bin/java Fibonacci`

**Problem:** Colors don't appear

- **Solution:** Java uses ANSI escape codes. If your terminal doesn't support them, the program will still work without colors.

### Common Lisp Issues

**Problem:** `sbcl: command not found`

- **Solution:** Make sure SBCL is properly installed: `brew install sbcl`

**Problem:** Script exits immediately

- **Solution:** When using `--script`, make sure the file is executable or run it with `sbcl --script fibonacci.lisp`

**Problem:** Colors don't appear

- **Solution:** ANSI escape codes may not work in all terminals. Try Terminal.app or iTerm2.

### Go Issues

**Problem:** `go: command not found`

- **Solution:** Make sure Go is properly installed and in your PATH: `brew install go`

**Problem:** Colors don't appear

- **Solution:** Go uses ANSI escape codes. Most modern terminals support them by default.

**Problem:** Import errors

- **Solution:** Make sure you're running Go 1.11 or later: `go version`

### Fortran Issues

**Problem:** `gfortran: command not found`

- **Solution:** Install GCC which includes gfortran: `brew install gcc`

**Problem:** Compilation errors

- **Solution:** Make sure you're using a Fortran 90+ compatible compiler. GFortran should work out of the box.

**Problem:** Colors don't appear

- **Solution:** The program uses ANSI escape codes. If your terminal doesn't support them, you can modify the color constants in the source code.

### Node.js Issues

**Problem:** `node: command not found`

- **Solution:** Install Node.js: `brew install node`

**Problem:** `SyntaxError: BigInt is not defined`

- **Solution:** Make sure you're using Node.js 10.4.0 or later: `node --version`. Update if necessary: `brew upgrade node`

**Problem:** Colors don't appear

- **Solution:** Node.js uses ANSI escape codes. Most modern terminals (Terminal.app, iTerm2) support them by default.

**Problem:** Permission denied when running `./fibonacci.js`

- **Solution:** Make the file executable: `chmod +x fibonacci.js`

### General Issues

**Problem:** Screen doesn't clear

- **Solution:** The screen clearing function may not work in all terminals. This is normal and doesn't affect functionality.

**Problem:** Program exits immediately

- **Solution:** The program waits for you to press ENTER at the end. Make sure you're running it in an interactive terminal, not redirecting input.

## File Structure

```text
fibonacci/
├── pascal/
│   └── fibonnaci.pas      # Turbo Pascal source
├── c++/
│   └── fibonnaci.cpp      # C++ source
├── java/
│   └── Fibonacci.java     # Java source
├── lisp/
│   └── fibonacci.lisp     # Common Lisp source
├── go/
│   └── fibonacci.go       # Go source
├── fortran/
│   └── fibonacci.f90      # Fortran source
├── nodejs/
│   └── fibonacci.js       # Node.js source
├── README.md              # This file
└── (compiled files)       # Generated during compilation
```

## License

This is a demonstration program. Feel free to use and modify as needed.

## Contributing

Feel free to submit improvements, bug fixes, or additional language implementations!
