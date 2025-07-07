# Apache Tika API Examples

## Extract from Remote URLs

```bash
# Extract text from a remote PDF URL
curl -X PUT http://localhost:9998/tika \
  --header "fileUrl: https://example.com/document.pdf" \
  --header "Accept: text/plain"

# Extract with metadata from remote URL
curl -X PUT http://localhost:9998/tika \
  --header "fileUrl: https://example.com/document.pdf" \
  --header "Accept: application/json"

# Extract from any remote file type (Tika will auto-detect)
curl -X PUT http://localhost:9998/tika \
  --header "fileUrl: https://example.com/report.docx" \
  --header "Accept: text/plain"

# Real example with a public PDF
curl -X PUT http://localhost:9998/tika \
  --header "fileUrl: https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" \
  --header "Accept: text/plain"
```

## Extract text from PDF

```bash
# Basic text extraction from a PDF file
curl -T /path/to/your/document.pdf http://localhost:9998/tika --header "Accept: text/plain"

# Extract text with metadata
curl -T /path/to/your/document.pdf http://localhost:9998/tika --header "Accept: application/json"

# Extract text from URL
curl -X PUT --data-binary @/path/to/your/document.pdf http://localhost:9998/tika --header "Content-type: application/pdf" --header "Accept: text/plain"
```

## Extract from other file types

```bash
# Extract from Word document
curl -T /path/to/document.docx http://localhost:9998/tika --header "Accept: text/plain"

# Extract from image with OCR
curl -T /path/to/image.png http://localhost:9998/tika --header "Accept: text/plain"

# Extract metadata only
curl -T /path/to/document.pdf http://localhost:9998/meta --header "Accept: application/json"
```

## Advanced usage

```bash
# Detect file type
curl -T /path/to/unknown.file http://localhost:9998/detect

# Extract structured content as XHTML
curl -T /path/to/document.pdf http://localhost:9998/tika --header "Accept: text/html"

# Extract with specific parser hints
curl -T /path/to/document.pdf http://localhost:9998/tika --header "Accept: text/plain" --header "X-Tika-PDFextractInlineImages: true"
```

## Integration with n8n

You can use the HTTP Request node in n8n to interact with Tika:

### For local files:
1. Set Method: PUT
2. URL: http://tika:9998/tika (when running in Docker network)
3. Body: Binary data from previous node
4. Headers:
   - Accept: text/plain (or application/json for metadata)
   - Content-Type: application/pdf (or appropriate mime type)

### For remote URLs:
1. Set Method: PUT
2. URL: http://tika:9998/tika
3. Body: None/Empty
4. Headers:
   - fileUrl: https://example.com/document.pdf
   - Accept: text/plain (or application/json for metadata)