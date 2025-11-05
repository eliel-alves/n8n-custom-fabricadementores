# n8n Custom - Fábrica de Mentores

Imagem Docker customizada do n8n com nodes da comunidade pré-instalados.

## Nodes Instalados

- **n8n-nodes-evolution-api** (v1.0.4) - Evolution API WhatsApp
- **n8n-nodes-kommo** (v0.0.16) - Kommo CRM
- **n8n-nodes-whatsapp-zapi** (v1.17.6) - Z-API WhatsApp
- **n8n-nodes-zapi** (v0.1.0) - Z-API

## Como Adicionar Novos Nodes

1. Edite o `Dockerfile`
2. Adicione a linha: `RUN npm install -g nome-do-node@versao`
3. Commit e push
4. O Coolify vai redesenhar automaticamente

## Variáveis de Ambiente Necessárias

```bash
SERVICE_BASE64_N8N=mFG9xmKaGfm4Bpc0JAiwohAMH93AfAgK
SERVICE_FQDN_N8N=https://n8n.fabricadementores.com
SERVICE_URL_N8N=https://n8n.fabricadementores.com
POSTGRES_DB=n8n
POSTGRES_HOST=og0g4o8ggc88gcgw8w08osw4
POSTGRES_PASSWORD=<senha-do-postgres>
POSTGRES_USER=postgres
REDIS_HOST=okko48k40sscok8c4ckwgg0g
REDIS_PASSWORD=<senha-do-redis>
GENERIC_TIMEZONE=America/Sao_Paulo
TZ=America/Sao_Paulo
```

## Backup

```bash
# Backup do volume
docker run --rm \
  -v n8n-stack-n8n-data:/source \
  -v /root/backups:/backup \
  alpine tar czf /backup/n8n-backup-$(date +%Y%m%d).tar.gz -C /source .

# Backup do banco
docker exec og0g4o8ggc88gcgw8w08osw4 pg_dump -U postgres n8n > /root/backups/n8n-db-$(date +%Y%m%d).sql
```

## Restaurar

```bash
# Restaurar volume
docker run --rm \
  -v n8n-stack-n8n-data:/target \
  -v /root/backups:/backup \
  alpine sh -c "cd /target && tar xzf /backup/n8n-backup-YYYYMMDD.tar.gz"

# Restaurar banco
cat /root/backups/n8n-db-YYYYMMDD.sql | docker exec -i og0g4o8ggc88gcgw8w08osw4 psql -U postgres n8n
```
