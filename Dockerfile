# PDFMathTranslate (pdf2zh-next v2) — official prebuilt image.
# We only re-declare the listening port + a live probe so the Railway
# Dockerfile gate sees a valid EXPOSE/HEALTHCHECK without changing the image.
#
# The image's default CMD is `pdf2zh --gui` (Gradio Web UI). The app picks up
# its bind port from the PDF2ZH_SERVER_PORT env var (see railway.json /
# template-vars.json), so no command override is needed.
FROM awwaawwa/pdfmathtranslate-next:v2.9.0-babeldoc-v0.6.4

# Railway routes the public domain to $PORT (8080 by default); the app binds
# PDF2ZH_SERVER_PORT, which defaults to the same 8080.
EXPOSE 8080

# Live probe on the app's bind port (defaults to 8080; follows the env).
HEALTHCHECK --interval=15s --timeout=5s --start-period=60s --retries=6 \
  CMD python3 -c "import os,urllib.request;urllib.request.urlopen('http://127.0.0.1:'+os.environ.get('PDF2ZH_SERVER_PORT','8080')+'/',timeout=4)" || exit 1
