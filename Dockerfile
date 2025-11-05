FROM n8nio/n8n:latest

USER root

# Instalar pnpm (necessário para alguns community nodes)
RUN npm install -g pnpm

# Instalar nodes personalizados da comunidade usando pnpm
RUN pnpm add -g \
    n8n-nodes-evolution-api@1.0.4 \
    n8n-nodes-kommo@0.0.16 \
    n8n-nodes-whatsapp-zapi@1.17.6 \
    n8n-nodes-zapi@0.1.0

# Pacotes npm extras para Code nodes (opcional, mas recomendado)
RUN pnpm add -g \
    axios \
    cheerio \
    node-fetch \
    lodash \
    moment \
    uuid

USER node