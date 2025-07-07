# Gotenberg API Examples

## Convert HTML/Text to PDF

### Basic HTML to PDF
```bash
curl -X POST http://localhost:3002/forms/chromium/convert/html \
  -F "files=@index.html" \
  -o result.pdf
```

### Convert with custom HTML content
```bash
echo '<h1>My PDF</h1><p>This is a PDF generated from HTML</p>' > content.html
curl -X POST http://localhost:3002/forms/chromium/convert/html \
  -F "files=@content.html" \
  -o result.pdf
```

### With page settings
```bash
curl -X POST http://localhost:3002/forms/chromium/convert/html \
  -F "files=@index.html" \
  -F "paperWidth=8.27" \
  -F "paperHeight=11.69" \
  -F "marginTop=1" \
  -F "marginBottom=1" \
  -F "marginLeft=1" \
  -F "marginRight=1" \
  -o result.pdf
```

## Convert Markdown to PDF
```bash
curl -X POST http://localhost:3002/forms/chromium/convert/markdown \
  -F "files=@document.md" \
  -o result.pdf
```

## Convert Office documents to PDF
```bash
# Word to PDF
curl -X POST http://localhost:3002/forms/libreoffice/convert \
  -F "files=@document.docx" \
  -o result.pdf

# Excel to PDF
curl -X POST http://localhost:3002/forms/libreoffice/convert \
  -F "files=@spreadsheet.xlsx" \
  -o result.pdf
```

## Using from Node.js/JavaScript
```javascript
const FormData = require('form-data');
const fs = require('fs');
const axios = require('axios');

async function convertToPDF(htmlContent) {
  const form = new FormData();
  form.append('files', Buffer.from(htmlContent), {
    filename: 'index.html',
    contentType: 'text/html',
  });

  const response = await axios.post(
    'http://localhost:3002/forms/chromium/convert/html',
    form,
    {
      headers: form.getHeaders(),
      responseType: 'arraybuffer',
    }
  );

  fs.writeFileSync('output.pdf', response.data);
}

// Usage
convertToPDF('<h1>Hello PDF</h1><p>Generated with Gotenberg</p>');
```

## Health Check
```bash
curl http://localhost:3002/health
```