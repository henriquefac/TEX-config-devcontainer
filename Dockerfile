# Usa uma imagem base leve do Debian
FROM debian:bookworm-slim

# --- ETAPA 1: INSTALA FERRAMENTAS ESSENCIAIS, CERTIFICADOS E DEPENDÊNCIAS ---
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl \
       tar \
       gzip \
       ca-certificates \
       perl \
       # --- NOVAS DEPENDÊNCIAS ESSENCIAIS PARA O TECTONIC ---
       libgraphite2-3 \
       libharfbuzz0b \
       libicu72 \
       # ----------------------------------------------------
    && rm -rf /var/lib/apt/lists/*

# --- ETAPA 2: INSTALA O TECTONIC USANDO O SCRIPT DROP-SH E CRIA LINK ---
# O script instala o binário em /tectonic.
RUN curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh \
    && ln -s /tectonic /usr/local/bin/tectonic

# --- ETAPA 3: INSTALA O BIBER (Para BibLaTeX) ---
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       biber \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho padrão.
WORKDIR /workspace