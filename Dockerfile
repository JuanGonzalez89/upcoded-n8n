FROM n8nio/n8n:latest

# Variables de entorno base (las sensibles van en Render Dashboard)
ENV NODE_ENV=production
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_HOST=upcoded-n8n.onrender.com
ENV WEBHOOK_URL=https://upcoded-n8n.onrender.com/
ENV N8N_EDITOR_BASE_URL=https://upcoded-n8n.onrender.com/

# Evitar que n8n duerma en Render Free (keep-alive via UptimeRobot ya lo manejás)
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false

# Persistencia: en Render usás Disk o PostgreSQL externo
# ENV DB_TYPE=postgresdb
# ENV DB_POSTGRESDB_HOST=...  (configurar en Render env vars)

EXPOSE 5678

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s \
  CMD wget -qO- http://localhost:5678/healthz || exit 1
