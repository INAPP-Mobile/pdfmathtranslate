FROM ollama/ollama:0.32.13

# Companion Ollama service for PDFMathTranslate.
# The image auto-starts `ollama serve` on 0.0.0.0:11434.
# Models are persisted in the Railway volume mounted at /root/.ollama.
# No model is pre-pulled — pick one via `ollama pull <model>` or the Web UI.

EXPOSE 11434
