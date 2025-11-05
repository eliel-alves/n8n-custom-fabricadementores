FROM n8nio/n8n:latest

USER root

# Instalar nodes personalizados da comunidade
RUN npm install -g \
    n8n-nodes-evolution-api \
    n8n-nodes-kommo \
    n8n-nodes-whatsapp-zapi \
    n8n-nodes-zapi

# Pacotes npm extras para Code nodes (opcional, mas recomendado)
RUN npm install -g \
    axios \
    cheerio \
    node-fetch \
    lodash \
    moment \
    uuid

USER node