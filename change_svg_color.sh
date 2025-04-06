#!/bin/bash
# i totally know how to write bash and didn't just have chatgpt do it for me
# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <new_hex_code>"
  echo "E.g.: $0 042069"
  exit 1
fi

# Validate the provided hex code
if [[ ! $1 =~ ^[A-Fa-f0-9]{6}$ ]]; then
  echo "Error: Invalid hex code. Please provide a valid 6-character hex code (e.g., 042069)."
  exit 1
fi

# Use sed to replace all hex codes in .svg files
sed -i'' -e "s/#\([A-Fa-f0-9]\{6\}\)/#$1/g" svg/*.svg

# Putting sed in here for portability.
# Personally I prefer https://github.com/chmln/sd