#!/bin/bash

# Example: Convert complex HTML to PDF using Gotenberg

echo "Converting HTML to PDF using Gotenberg..."

# Convert the complex HTML file to PDF with custom settings
curl -X POST http://localhost:3002/forms/chromium/convert/html \
  -F "files=@index.html" \
  -o company-report.pdf
#  -F "paperWidth=8.27" \
#  -F "paperHeight=11.69" \
#  -F "marginTop=0.39" \
#  -F "marginBottom=0.39" \
#  -F "marginLeft=0.39" \
#  -F "marginRight=0.39" \
#  -F "preferCssPageSize=false" \
#  -F "printBackground=true" \
#  -F "waitDelay=1s" \


if [ $? -eq 0 ]; then
    echo "✓ PDF created successfully: company-report.pdf"
    echo "  File size: $(ls -lh company-report.pdf | awk '{print $5}')"
else
    echo "✗ Error creating PDF"
    exit 1
fi
