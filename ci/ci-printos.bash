#!/bin/bash

# Function to detect the platform
get_platform() {
  case "$(uname -s)" in
    Linux*)   echo "Linux" ;;
    Darwin*)  echo "macOS" ;;
    CYGWIN*|MINGW*|MSYS*) echo "Windows" ;;
    *)        echo "Unknown" ;;
  esac
}

# Function to check for available compilers
check_compilers() {
  local platform="$1"

  if [ "$platform" == "Linux" ] || [ "$platform" == "macOS" ]; then
    # Check for GCC and G++ on Linux and macOS
    if command -v gcc &> /dev/null; then
      echo "GCC Version: $(gcc --version | head -n1 | cut -d" " -f3)"
    else
      echo "GCC is not installed."
    fi

    if command -v g++ &> /dev/null; then
      echo "G++ Version: $(g++ --version | head -n1 | cut -d" " -f3)"
    else
      echo "G++ is not installed."
    fi
  elif [ "$platform" == "Windows" ]; then
    # Check for GCC and G++ on Windows with WSL
    if command -v wsl &> /dev/null; then
      if wsl g++ -v &> /dev/null; then
        echo "GCC Version: $(wsl gcc --version | head -n1 | cut -d" " -f3)"
      else
        echo "GCC is not installed in WSL."
      fi

      if wsl g++ -v &> /dev/null; then
        echo "G++ Version: $(wsl g++ --version | head -n1 | cut -d" " -f3)"
      else
        echo "G++ is not installed in WSL."
      fi
    else
      echo "WSL is not installed. You can install it to use GCC and G++."
    fi
  else
    echo "Unsupported platform: $platform"
  fi
}

# Get the platform
platform="$(get_platform)"

# Hostname
echo "Hostname: $(hostname)"

# Operating System
if [ -f /etc/os-release ]; then
    source /etc/os-release
    echo "Operating System: $PRETTY_NAME"
else
    echo "Operating System: $(uname -s) $(uname -r)"
fi

# Uptime
echo "Uptime: $(uptime)"

# Check and display compiler information
check_compilers "$platform"

# Additional Information
echo "Available Shells: $(cat /etc/shells)"
echo "CPU Information: $(lscpu)"
echo "Memory Information: $(free -h)"
echo "File System Information: $(df -h)"
