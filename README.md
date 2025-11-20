# Enhanced Fibonacci Sequence Generator

A multi-language implementation of an enhanced Fibonacci sequence generator with interactive menu options, statistics, and multiple display modes.

## Overview

This project implements the same Fibonacci sequence generator across 16 different programming languages, demonstrating language-specific features while maintaining consistent functionality.

### Features

All implementations include:

- **Menu-driven interface** with 4 generation modes:
  1. Generate by number of terms
  2. Generate up to a maximum value
  3. Display with statistics (sum, average, golden ratio approximation)
  4. Display in aligned columns

- **Color-coded output** for better readability
- **Input validation** with clear error messages
- **Cross-platform compatibility** (where applicable)

## Languages Implemented

[**BASIC (FreeBASIC)**](#basic-freebasic) • [**C++**](#c) • [**Common Lisp**](#common-lisp) • [**Fortran**](#fortran) • [**Go**](#go) • [**Java**](#java) • [**Kotlin**](#kotlin) • [**Node.js**](#nodejs) • [**Objective-C**](#objective-c) • [**Pascal**](#pascal) • [**PHP**](#php) • [**Python**](#python) • [**Ruby**](#ruby) • [**Rust**](#rust) • [**Swift**](#swift) • [**TypeScript**](#typescript)

---

## BASIC (FreeBASIC)

### Installation

FreeBASIC is not available via Homebrew. Download and install manually:

**Option 1: Download Pre-built Binary (Recommended)**

1. Visit [https://www.freebasic.net/](https://www.freebasic.net/)
2. Download the macOS package (usually `FreeBASIC-x.xx.x-darwin.tar.gz`)
3. Extract and install:

```bash
tar -xzf FreeBASIC-*.tar.gz
cd FreeBASIC-*-darwin
sudo ./install.sh -i
```

**Option 2: Install via MacPorts (if you have MacPorts)**

```bash
sudo port install freebasic
```

Verify installation:

```bash
fbc -version
```

### Compilation & Running

**Compile:**

```bash
cd basic
fbc fibonacci.bas
```

**Run:**

```bash
./fibonacci
```

**Note:** FreeBASIC uses LongInt (64-bit), supporting max 92 terms. Compatible with QuickBASIC.

### Troubleshooting

**Problem:** `fbc: command not found`
- **Solution:** Download from [freebasic.net](https://www.freebasic.net/) or install via MacPorts: `sudo port install freebasic`

**Problem:** Installation script fails
- **Solution:** Run with sudo: `sudo ./install.sh -i`. Grant permissions in System Preferences → Security & Privacy.

**Problem:** PATH not set after installation
- **Solution:** Add to `~/.zshrc`: `export PATH="/usr/local/bin:$PATH"`, then run `source ~/.zshrc`

**Problem:** Colors don't appear
- **Solution:** FreeBASIC uses ANSI escape codes. Most modern terminals support them.

---

## C++

### Installation

macOS comes with Clang. You can also install GCC via Homebrew:

```bash
brew install gcc
```

Or verify the built-in Clang:

```bash
clang++ --version
```

### Compilation & Running

**Compile:**

```bash
cd c++
# Using Clang (default on macOS)
clang++ -o fibonnaci fibonnaci.cpp

# Or using GCC (if installed)
g++ -o fibonnaci fibonnaci.cpp
```

**Run:**

```bash
./fibonnaci
```

**Note:** Uses ANSI escape codes for colors. Supports max 92 terms with `long long`.

### Troubleshooting

**Problem:** `clang++: command not found`
- **Solution:** Install Xcode Command Line Tools: `xcode-select --install`

**Problem:** Colors don't appear
- **Solution:** Ensure your terminal supports ANSI escape codes (Terminal.app, iTerm2).

---

## Common Lisp

### Installation

Install Steel Bank Common Lisp (SBCL) via Homebrew:

```bash
brew install sbcl
```

Verify installation:

```bash
sbcl --version
```

### Compilation & Running

**Run directly with SBCL:**

```bash
cd lisp
sbcl --script fibonacci.lisp
```

**Or compile and run in REPL:**

```bash
sbcl
# In the SBCL REPL:
(load "fibonacci.lisp")
```

**Note:** Supports max 92 terms (limited for consistency, though capable of more with bignums).

### Troubleshooting

**Problem:** `sbcl: command not found`
- **Solution:** Install SBCL: `brew install sbcl`

**Problem:** Script exits immediately
- **Solution:** Run with `sbcl --script fibonacci.lisp`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes may not work in all terminals. Try Terminal.app or iTerm2.

---

## Fortran

### Installation

Install GFortran (part of GCC) via Homebrew:

```bash
brew install gcc
```

Verify installation:

```bash
gfortran --version
```

### Compilation & Running

**Compile:**

```bash
cd fortran
gfortran -o fibonacci fibonacci.f90
```

**Run:**

```bash
./fibonacci
```

**Note:** Uses `integer(kind=8)` for 64-bit integers. Supports max 92 terms.

### Troubleshooting

**Problem:** `gfortran: command not found`
- **Solution:** Install GCC: `brew install gcc`

**Problem:** Compilation errors
- **Solution:** Ensure Fortran 90+ compatible compiler. GFortran works out of the box.

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most modern terminals.

---

## Go

### Installation

Install Go via Homebrew:

```bash
brew install go
```

Verify installation:

```bash
go version
```

### Compilation & Running

**Compile:**

```bash
cd go
go build fibonacci.go
```

**Run:**

```bash
./fibonacci
```

**Or compile and run in one step:**

```bash
go run fibonacci.go
```

**Note:** Uses `int64` for 64-bit integers. Supports max 92 terms.

### Troubleshooting

**Problem:** `go: command not found`
- **Solution:** Install Go: `brew install go`

**Problem:** Import errors
- **Solution:** Ensure Go 1.11 or later: `go version`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most modern terminals.

---

## Java

### Installation

Install OpenJDK via Homebrew:

```bash
brew install openjdk
```

Link the installation:

```bash
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

Verify installation:

```bash
java -version
javac -version
```

### Compilation & Running

**Compile:**

```bash
cd java
javac Fibonacci.java
```

**Run:**

```bash
java Fibonacci
```

**Note:** Uses `long` (64-bit). Supports max 92 terms.

### Troubleshooting

**Problem:** `javac: command not found`
- **Solution:** Install and link OpenJDK: `brew reinstall openjdk`

**Problem:** `java: command not found`
- **Solution:** Add Java to PATH or use full path: `/opt/homebrew/opt/openjdk/bin/java Fibonacci`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most terminals.

---

## Kotlin

### Installation

Install Kotlin compiler via Homebrew:

```bash
brew install kotlin
```

Verify installation:

```bash
kotlin -version
```

### Compilation & Running

**Compile and run:**

```bash
cd kotlin
kotlinc fibonacci.kt -include-runtime -d fibonacci.jar
java -jar fibonacci.jar
```

**Or run as script (requires Kotlin 1.3.70+):**

```bash
kotlin fibonacci.kt
```

**Note:** Uses `Long` (64-bit). Supports max 92 terms. Compilation can be slow.

### Troubleshooting

**Problem:** `kotlinc: command not found`
- **Solution:** Install Kotlin: `brew install kotlin`

**Problem:** Compilation takes a long time
- **Solution:** Use script mode: `kotlin fibonacci.kt`

**Problem:** `java: command not found` when running JAR
- **Solution:** Install OpenJDK: `brew install openjdk`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most terminals.

---

## Node.js

### Installation

Install Node.js via Homebrew:

```bash
brew install node
```

Verify installation:

```bash
node --version
npm --version
```

### Compilation & Running

**Run directly:**

```bash
cd nodejs
node fibonacci.js
```

**Or make executable:**

```bash
chmod +x fibonacci.js
./fibonacci.js
```

**Note:** Uses `BigInt` for arbitrary precision. Supports up to 1476 terms.

### Troubleshooting

**Problem:** `node: command not found`
- **Solution:** Install Node.js: `brew install node`

**Problem:** `SyntaxError: BigInt is not defined`
- **Solution:** Requires Node.js 10.4.0+. Update: `brew upgrade node`

**Problem:** Permission denied
- **Solution:** Make executable: `chmod +x fibonacci.js`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in Terminal.app and iTerm2.

---

## Objective-C

### Installation

Objective-C compiler (clang) comes with Xcode Command Line Tools:

```bash
xcode-select --install
```

Verify installation:

```bash
clang --version
```

### Compilation & Running

**Compile with Makefile:**

```bash
cd objc
make
```

**Or compile directly:**

```bash
clang -framework Foundation -fobjc-arc -o fibonacci fibonacci.m
```

**Run:**

```bash
./fibonacci
```

**Note:** Uses `long long` (64-bit). Supports max 92 terms. Uses Foundation framework and ARC.

### Troubleshooting

**Problem:** `clang: command not found`
- **Solution:** Install Xcode Command Line Tools: `xcode-select --install`

**Problem:** `framework not found Foundation`
- **Solution:** Reset Xcode tools: `sudo xcode-select --reset`

**Problem:** Compilation errors with ARC
- **Solution:** Compile with `-fobjc-arc` flag.

**Problem:** `make: command not found`
- **Solution:** Install Xcode Command Line Tools or compile directly with clang.

---

## Pascal

### Installation

Install Free Pascal via Homebrew:

```bash
brew install fpc
```

Verify installation:

```bash
fpc -v
```

### Compilation & Running

**Compile:**

```bash
cd pascal
fpc fibonnaci.pas
```

**Run:**

```bash
./fibonnaci
```

**Note:** Uses `LongInt` (32-bit). Supports max 46 terms. Compatible with Turbo Pascal.

### Troubleshooting

**Problem:** `Error: Can't find unit crt`
- **Solution:** Free Pascal should include `crt` unit. Reinstall if needed.

**Problem:** Colors don't work
- **Solution:** Some terminals don't support all Turbo Pascal color features.

---

## PHP

### Installation

PHP comes pre-installed on macOS. Verify:

```bash
php --version
```

For the latest version:

```bash
brew install php
```

### Compilation & Running

**Run directly:**

```bash
cd php
php fibonacci.php
```

**Or make executable:**

```bash
chmod +x fibonacci.php
./fibonacci.php
```

**Note:** Arbitrary precision integers. Supports up to 1476 terms.

### Troubleshooting

**Problem:** `php: command not found`
- **Solution:** Install via Homebrew: `brew install php`

**Problem:** Permission denied
- **Solution:** Make executable: `chmod +x fibonacci.php`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most terminals.

---

## Python

### Installation

Python 3 comes pre-installed on macOS. Verify:

```bash
python3 --version
```

For the latest version:

```bash
brew install python
```

### Compilation & Running

**Run directly:**

```bash
cd python
python3 fibonacci.py
```

**Or make executable:**

```bash
chmod +x fibonacci.py
./fibonacci.py
```

**Note:** Arbitrary precision integers. Supports up to 1476 terms. Requires Python 3.6+.

### Troubleshooting

**Problem:** `python3: command not found`
- **Solution:** Install via Homebrew: `brew install python`

**Problem:** Permission denied
- **Solution:** Make executable: `chmod +x fibonacci.py`

**Problem:** `ModuleNotFoundError`
- **Solution:** Uses only standard library. Ensure Python 3.6+: `python3 --version`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most terminals.

---

## Ruby

### Installation

Ruby comes pre-installed on macOS. Verify:

```bash
ruby --version
```

For the latest version:

```bash
brew install ruby
```

### Compilation & Running

**Run directly:**

```bash
cd ruby
ruby fibonacci.rb
```

**Or make executable:**

```bash
chmod +x fibonacci.rb
./fibonacci.rb
```

**Note:** Arbitrary precision integers. Supports up to 1476 terms.

### Troubleshooting

**Problem:** `ruby: command not found`
- **Solution:** Install via Homebrew: `brew install ruby`

**Problem:** Permission denied
- **Solution:** Make executable: `chmod +x fibonacci.rb`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most terminals.

---

## Rust

### Installation

Install Rust via rustup (recommended):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Or via Homebrew:

```bash
brew install rust
```

Verify installation:

```bash
rustc --version
cargo --version
```

### Compilation & Running

**Compile:**

```bash
cd rust
rustc fibonacci.rs
```

**Run:**

```bash
./fibonacci
```

**Note:** Uses `i64` (64-bit). Supports max 92 terms. Highly optimized compiled binary.

### Troubleshooting

**Problem:** `rustc: command not found`
- **Solution:** Install via rustup: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

**Problem:** Compilation warnings
- **Solution:** Code should compile cleanly. Warnings are informational.

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in most modern terminals.

---

## Swift

### Installation

Swift comes pre-installed with Xcode Command Line Tools. Verify:

```bash
swift --version
```

If not installed:

```bash
xcode-select --install
```

### Compilation & Running

**Run directly:**

```bash
cd swift
swift fibonacci.swift
```

**Or make executable:**

```bash
chmod +x fibonacci.swift
./fibonacci.swift
```

**Or compile for better performance:**

```bash
swiftc -o fibonacci fibonacci.swift
./fibonacci
```

**Note:** Uses `Int64` (64-bit). Supports max 92 terms.

### Troubleshooting

**Problem:** `swift: command not found`
- **Solution:** Install Xcode Command Line Tools: `xcode-select --install`

**Problem:** Compilation is slow
- **Solution:** Use interpreted mode: `swift fibonacci.swift`

**Problem:** Colors don't appear
- **Solution:** ANSI escape codes work in modern terminals.

---

## TypeScript

### Installation

Install TypeScript and ts-node via npm:

```bash
npm install -g typescript ts-node
```

Or install project dependencies:

```bash
cd typescript
npm install
```

Verify installation:

```bash
tsc --version
ts-node --version
```

### Compilation & Running

**Option 1: Run with ts-node (Development)**

```bash
cd typescript
npm install  # First time only
npx ts-node fibonacci.ts
```

**Option 2: Compile and run (Production)**

```bash
cd typescript
npm install  # First time only
npm run build
npm start
```

**Option 3: Compile manually**

```bash
cd typescript
tsc fibonacci.ts
node fibonacci.js
```

**Note:** Uses `BigInt` for arbitrary precision. Supports up to 1476 terms. Requires Node.js 10.4.0+.

### Troubleshooting

**Problem:** `tsc: command not found` or `ts-node: command not found`
- **Solution:** Install globally: `npm install -g typescript ts-node` or run `npm install` in typescript directory

**Problem:** `Cannot find module` errors
- **Solution:** Run `npm install` in the typescript directory

**Problem:** BigInt errors
- **Solution:** Requires Node.js 10.4.0+ and TypeScript 3.2+. Update: `npm install -g typescript@latest`

**Problem:** Compilation target errors
- **Solution:** tsconfig.json uses ES2020. Ensure Node.js supports this target.

---

## Program Usage

When you run any of the programs, you'll see this menu:

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

---

## Technical Details

### Maximum Terms Supported

| Language | Max Terms | Data Type |
|----------|-----------|-----------|
| Pascal | 46 | `LongInt` (32-bit) |
| C++ | 92 | `long long` (64-bit) |
| Java | 92 | `long` (64-bit) |
| Common Lisp | 92 | fixnum/bignum |
| Go | 92 | `int64` (64-bit) |
| Fortran | 92 | `integer(kind=8)` (64-bit) |
| Swift | 92 | `Int64` (64-bit) |
| Kotlin | 92 | `Long` (64-bit) |
| Rust | 92 | `i64` (64-bit) |
| Objective-C | 92 | `long long` (64-bit) |
| FreeBASIC | 92 | `LongInt` (64-bit) |
| Node.js | 1476 | `BigInt` (arbitrary precision) |
| Ruby | 1476 | Integer (arbitrary precision) |
| PHP | 1476 | Integer (arbitrary precision) |
| Python | 1476 | int (arbitrary precision) |
| TypeScript | 1476 | `BigInt` (arbitrary precision) |

### Color Support

All programs use ANSI escape codes for terminal colors. If your terminal doesn't support colors, programs will still function without color formatting.

### Platform Compatibility

- **Pascal:** Cross-platform, Turbo Pascal compatible
- **C++:** C++11 standard, Clang and GCC compatible
- **Java:** Java 8+, standard libraries only
- **Common Lisp:** SBCL compatible
- **Go:** Go 1.11+, standard library only
- **Fortran:** Fortran 90+ standard
- **Node.js:** Node.js 10.4.0+ (BigInt support)
- **Swift:** Swift 5.0+, macOS/Linux/Windows
- **Ruby:** Ruby 2.0+, standard library only
- **Kotlin:** Kotlin 1.3+, requires JVM
- **Rust:** Rust 1.40+, standard library only
- **PHP:** PHP 7.0+, standard functions only
- **Python:** Python 3.6+, standard library only
- **FreeBASIC:** FreeBASIC 1.0+, cross-platform
- **TypeScript:** TypeScript 4.0+, Node.js 10.4.0+
- **Objective-C:** macOS/iOS, Foundation framework

---

## File Structure

```text
fibonacci/
├── basic/
│   └── fibonacci.bas          # FreeBASIC source
├── c++/
│   └── fibonnaci.cpp          # C++ source
├── fortran/
│   └── fibonacci.f90          # Fortran source
├── go/
│   └── fibonacci.go           # Go source
├── java/
│   └── Fibonacci.java         # Java source
├── kotlin/
│   └── fibonacci.kt           # Kotlin source
├── lisp/
│   └── fibonacci.lisp         # Common Lisp source
├── nodejs/
│   └── fibonacci.js           # Node.js source
├── objc/
│   ├── fibonacci.m            # Objective-C source
│   └── Makefile               # Build configuration
├── pascal/
│   └── fibonnaci.pas          # Turbo Pascal source
├── php/
│   └── fibonacci.php          # PHP source
├── python/
│   └── fibonacci.py           # Python source
├── ruby/
│   └── fibonacci.rb           # Ruby source
├── rust/
│   └── fibonacci.rs           # Rust source
├── swift/
│   └── fibonacci.swift        # Swift source
├── typescript/
│   ├── fibonacci.ts           # TypeScript source
│   ├── package.json           # Node.js dependencies
│   └── tsconfig.json          # TypeScript config
├── .gitignore                 # Git ignore rules
└── README.md                  # This file
```

---

## General Troubleshooting

**Problem:** Screen doesn't clear
- **Solution:** Screen clearing may not work in all terminals. This doesn't affect functionality.

**Problem:** Program exits immediately
- **Solution:** The program waits for ENTER at the end. Run in an interactive terminal, not with redirected input.

---

## Prerequisites

This guide assumes you have [Homebrew](https://brew.sh/) installed on macOS. If you don't have Homebrew, install it first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## License

This is a demonstration program. Feel free to use and modify as needed.

## Contributing

Feel free to submit improvements, bug fixes, or additional language implementations!
