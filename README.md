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

**macOS:**

FreeBASIC is not available via Homebrew. Download and install manually:

1. Visit [https://www.freebasic.net/](https://www.freebasic.net/)
2. Download the macOS package (usually `FreeBASIC-x.xx.x-darwin.tar.gz`)
3. Extract and install:

```bash
tar -xzf FreeBASIC-*.tar.gz
cd FreeBASIC-*-darwin
sudo ./install.sh -i
```

Or via MacPorts:
```bash
sudo port install freebasic
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install freebasic

# Fedora
sudo dnf install freebasic

# Arch Linux
sudo pacman -S freebasic
```

**Windows:**

1. Visit [https://www.freebasic.net/](https://www.freebasic.net/)
2. Download the Windows installer (`FreeBASIC-x.xx.x-win32.exe` or `FreeBASIC-x.xx.x-win64.exe`)
3. Run the installer and follow the prompts
4. Add FreeBASIC to your PATH if not done automatically

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

**macOS:**

macOS comes with Clang. You can also install GCC via Homebrew:

```bash
brew install gcc
```

Verify the built-in Clang:

```bash
clang++ --version
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install build-essential g++

# Fedora
sudo dnf install gcc-c++

# Arch Linux
sudo pacman -S gcc
```

**Windows:**

Option 1: MinGW-w64
1. Download from [mingw-w64.org](https://www.mingw-w64.org/)
2. Install and add to PATH

Option 2: Visual Studio
1. Download [Visual Studio Community](https://visualstudio.microsoft.com/)
2. Install with "Desktop development with C++" workload

Option 3: MSYS2
```bash
# Install MSYS2 from https://www.msys2.org/
pacman -S mingw-w64-x86_64-gcc
```

Verify installation:

```bash
g++ --version
# or
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

**macOS:**

```bash
brew install sbcl
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install sbcl

# Fedora
sudo dnf install sbcl

# Arch Linux
sudo pacman -S sbcl
```

**Windows:**

1. Download from [sbcl.org](http://www.sbcl.org/platform-table.html)
2. Extract the archive
3. Run `install.cmd` or add to PATH manually

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

**macOS:**

```bash
brew install gcc
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install gfortran

# Fedora
sudo dnf install gcc-gfortran

# Arch Linux
sudo pacman -S gcc-fortran
```

**Windows:**

Option 1: MinGW-w64 via MSYS2
```bash
# Install MSYS2 from https://www.msys2.org/
pacman -S mingw-w64-x86_64-gcc-fortran
```

Option 2: Direct download from [equation.com](http://www.equation.com/servlet/equation.cmd?fa=fortran)

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

**macOS:**

```bash
brew install go
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install golang-go

# Fedora
sudo dnf install golang

# Arch Linux
sudo pacman -S go

# Or download from golang.org
wget https://go.dev/dl/go1.21.x.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.x.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

**Windows:**

Option 1: MSI Installer
1. Download from [go.dev/dl](https://go.dev/dl/)
2. Run the MSI installer
3. PATH is set automatically

Option 2: Chocolatey
```bash
choco install golang
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

**macOS:**

```bash
brew install openjdk
# Link the installation
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install default-jdk

# Fedora
sudo dnf install java-latest-openjdk-devel

# Arch Linux
sudo pacman -S jdk-openjdk
```

**Windows:**

Option 1: Adoptium (recommended)
1. Download from [adoptium.net](https://adoptium.net/)
2. Run installer and follow prompts
3. JAVA_HOME is set automatically

Option 2: Chocolatey
```bash
choco install openjdk
```

Option 3: Scoop
```bash
scoop install openjdk
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

**macOS:**

```bash
brew install kotlin
```

**Linux:**

Via SDKMAN (recommended):
```bash
curl -s "https://get.sdkman.io" | bash
sdk install kotlin
```

Or manual installation:
```bash
wget https://github.com/JetBrains/kotlin/releases/download/v1.9.x/kotlin-compiler-1.9.x.zip
unzip kotlin-compiler-*.zip
sudo mv kotlinc /usr/local/
export PATH=$PATH:/usr/local/kotlinc/bin
```

**Windows:**

Option 1: Chocolatey
```bash
choco install kotlin
```

Option 2: Scoop
```bash
scoop install kotlin
```

Option 3: Manual
1. Download from [kotlinlang.org](https://kotlinlang.org/docs/command-line.html)
2. Extract and add to PATH

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

**macOS:**

```bash
brew install node
```

**Linux:**

```bash
# Debian/Ubuntu
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Fedora
sudo dnf install nodejs

# Arch Linux
sudo pacman -S nodejs npm

# Or via NVM (recommended for all distros)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts
```

**Windows:**

Option 1: Official Installer
- Download from [nodejs.org](https://nodejs.org/)

Option 2: Chocolatey
```bash
choco install nodejs
```

Option 3: Scoop
```bash
scoop install nodejs
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

**macOS:**

Objective-C compiler (clang) comes with Xcode Command Line Tools:

```bash
xcode-select --install
```

Verify installation:

```bash
clang --version
```

**Linux:**

Objective-C is primarily a macOS/iOS language, but GNUstep provides support:

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install gobjc gnustep-devel

# Fedora
sudo dnf install gcc-objc gnustep-base-devel
```

**Note:** This implementation uses Foundation framework which is native to macOS. Linux ports may require modifications.

**Windows:**

Objective-C is primarily for macOS/iOS development. For Windows, consider:
- Using WSL2 with Linux instructions above
- Using GNUstep (limited support)
- Cross-compiling from macOS

**Note:** This implementation uses Foundation framework which is native to macOS. Windows ports may require significant modifications.

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

**macOS:**

```bash
brew install fpc
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install fpc

# Fedora
sudo dnf install fpc

# Arch Linux
sudo pacman -S fpc
```

**Windows:**

1. Download from [freepascal.org](https://www.freepascal.org/download.html)
2. Run the installer (e.g., `fpc-x.x.x.i386-win32.exe`)
3. Follow installation prompts

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

**macOS:**

PHP comes pre-installed. For the latest version:

```bash
brew install php
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install php-cli

# Fedora
sudo dnf install php-cli

# Arch Linux
sudo pacman -S php
```

**Windows:**

Option 1: Manual Install
1. Download from [windows.php.net](https://windows.php.net/download/)
2. Extract to `C:\php`
3. Add `C:\php` to PATH

Option 2: Chocolatey
```bash
choco install php
```

Option 3: XAMPP or WAMP (includes PHP, Apache, and MySQL)

Verify installation:

```bash
php --version
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

**macOS:**

Python 3 comes pre-installed. For the latest version:

```bash
brew install python
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install python3 python3-pip

# Fedora
sudo dnf install python3 python3-pip

# Arch Linux
sudo pacman -S python python-pip
```

**Windows:**

Option 1: Download from [python.org](https://www.python.org/downloads/)
1. Download the Windows installer
2. Run installer
3. **Check "Add Python to PATH"** during installation

Option 2: Microsoft Store
- Search for "Python" and install

Option 3: Chocolatey
```bash
choco install python
```

Verify installation:

```bash
python3 --version
# On Windows, often just:
python --version
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

**macOS:**

Ruby comes pre-installed. For the latest version:

```bash
brew install ruby
```

**Linux:**

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install ruby-full

# Fedora
sudo dnf install ruby

# Arch Linux
sudo pacman -S ruby

# Or via rbenv (recommended)
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash
rbenv install 3.2.0
rbenv global 3.2.0
```

**Windows:**

Option 1: RubyInstaller (recommended)
1. Download from [rubyinstaller.org](https://rubyinstaller.org/)
2. Run installer with DevKit

Option 2: Chocolatey
```bash
choco install ruby
```

Verify installation:

```bash
ruby --version
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

**macOS:**

Via rustup (recommended):
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Or via Homebrew:
```bash
brew install rust
```

**Linux:**

Via rustup (recommended):
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Or via package manager:
```bash
# Debian/Ubuntu
sudo apt update
sudo apt install cargo rustc

# Fedora
sudo dnf install cargo rust

# Arch Linux
sudo pacman -S rust
```

**Windows:**

Option 1: Download from [rustup.rs](https://rustup.rs/)
1. Download and run `rustup-init.exe`
2. Follow the installer prompts

Option 2: Chocolatey
```bash
choco install rust
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

**macOS:**

Swift comes pre-installed with Xcode Command Line Tools:

```bash
xcode-select --install
```

Verify:
```bash
swift --version
```

**Linux:**

```bash
# Ubuntu
wget https://download.swift.org/swift-5.9-release/ubuntu2204/swift-5.9-RELEASE/swift-5.9-RELEASE-ubuntu22.04.tar.gz
tar xzf swift-5.9-RELEASE-ubuntu22.04.tar.gz
sudo mv swift-5.9-RELEASE-ubuntu22.04 /usr/share/swift
export PATH=/usr/share/swift/usr/bin:$PATH

# Or follow instructions at swift.org for your distro
```

**Windows:**

Swift support for Windows is experimental:
1. Download from [swift.org/download](https://www.swift.org/download/)
2. Follow Windows installation instructions
3. Requires Visual Studio 2019 or later

**Note:** Swift works best on macOS. Linux support is good but some features may be limited. Windows support is experimental.

Verify installation:

```bash
swift --version
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

TypeScript requires Node.js (see Node.js section above). Then:

**All Platforms (macOS, Linux, Windows):**

```bash
npm install -g typescript ts-node
```

Or install project dependencies:

```bash
cd typescript
npm install
```

**Windows-specific notes:**
- Run Command Prompt or PowerShell as Administrator for global installs
- Or use `--location=global` flag with newer npm versions

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

### macOS

This guide uses [Homebrew](https://brew.sh/) for package management. Install it first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Linux

Most Linux distributions come with their package manager (apt, dnf, pacman). Ensure your system is updated:

```bash
# Debian/Ubuntu
sudo apt update && sudo apt upgrade

# Fedora
sudo dnf upgrade

# Arch Linux
sudo pacman -Syu
```

### Windows

For Windows, consider using one of these package managers:

**Chocolatey:**
```powershell
# Run in PowerShell as Administrator
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

**Scoop:**
```powershell
# Run in PowerShell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

**Windows Subsystem for Linux (WSL2):**
- For best Linux compatibility on Windows, install WSL2
- Follow [Microsoft's WSL installation guide](https://docs.microsoft.com/en-us/windows/wsl/install)
- Then follow Linux instructions for your chosen distribution

---

## License

This is a demonstration program. Feel free to use and modify as needed.

## Contributing

Feel free to submit improvements, bug fixes, or additional language implementations!
