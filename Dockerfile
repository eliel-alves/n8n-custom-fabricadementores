FROM n8nio/n8n:latest

USER root

# Instalar nodes ignorando a verificação de pnpm
RUN npm install -g \
    n8n-nodes-evolution-api@1.0.4 \
    n8n-nodes-kommo@0.0.16 \
    n8n-nodes-whatsapp-zapi@1.17.6 \
    n8n-nodes-zapi@0.1.0 \
    --force \
    --legacy-peer-deps || \
    (npm config set ignore-scripts false && \
     npm install -g \
         n8n-nodes-evolution-api@1.0.4 \
         n8n-nodes-kommo@0.0.16 \
         n8n-nodes-whatsapp-zapi@1.17.6 \
         n8n-nodes-zapi@0.1.0 \
         --ignore-scripts)

# Pacotes npm extras para Code nodes
RUN npm install -g \
    axios \
    cheerio \
    node-fetch \
    lodash \
    moment \
    uuid

USER node