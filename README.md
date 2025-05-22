<img alt="workoflow bot - logo" src="assets/color.png" height="350px">

# Concept
"Workoflow BOT" added to MS Teams for a scoped private conversions.
AI driven communication will be processed by n8n on premise services.
N8N has access to company internal tools, and AI agents are serving as a bridge between the two.

# Privacy
General Data Protection Regulation (GDPR) (EU Datenschutzgrundverordnung EDGVO) law production ready setup.
Minimized risk in leaking any company data, only EU services involved.
ALl cloud services are ISO 27001, ISO 27018, BSI C5 certified.

# Services OnPremise
 - n8n (http://localhost:5678/)
 - qdrant (http://localhost:6333/dashboard)
 - minio (http://localhost:9001/)
 - redis (http://localhost:6379/)
 - postgres (jdbc 5432)

# Services Cloud
 - MS Teams (https://admin.teams.microsoft.com/)
 - Azure-Bot Service (https://azure.microsoft.com/de-de/products/ai-services/ai-bot-service)
 - self deployed AI (https://ai.azure.com/)

# DevOps Setup
 - Host Workoflow BOT (nodejs)
 - Setup Cloud Services
   - create azure bot https://portal.azure.com/
     - configure message endpoint
     - in channels, add teams
   - create teams app and copy App ID https://dev.teams.microsoft.com/apps
 - upload and register your "Workoflow Bot" to MS Teams https://admin.teams.microsoft.com/policies/manage-apps

# Local Development Proxy Workoflow-Bot to Azusre
 - npm run watch
 - ngrok http --host-header=rewrite http://localhost:3978
 - add ngrok url to your Azure bot message endpoint
   - open https://portal.azure.com/#@nxs.rocks/resource/subscriptions/9e0780af-a98b-4867-9788-2262bfa387f8/resourceGroups/GenesisHorizonRG/providers/Microsoft.BotService/botServices/GenesisHorizon/config
   - https://8c67-80-246-113-44.ngrok-free.app/api/messages

# SSH access hosting
 - cat ~/.ssh/config

Host val-*
User xxx.xxx
ForwardAgent yes

Host val-srv-nc-heimdall
Hostname hosting.vcec.cloud

Host val-n8n
Hostname xxxx.xxx.xxx.xxx
ProxyJump xxxx-xxxx-xxx-xxxx

 - ssh val-n8n
 - patrick.xxxx@morris:~$ sudo -iu docker
 - cd /home/docker/docker-setups/n8n

# Port Service tunneling
 - ssh -L 5678:localhost:5678 -L 5432:localhost:5432 -L 6333:localhost:6333 -L 9000:localhost:9000 -L 9001:localhost:9001 -L 6379:localhost:6379 val-n8n

# qdrant collection create and delete
curl -X DELETE "http://localhost:6333/collections/workoflow_vector_n8n"

curl -X PUT "http://localhost:6333/collections/workoflow_vector_n8n" \
-H "Content-Type: application/json" \
--data-raw '{
"vectors": {
"size": 3072,
"distance": "Cosine"
}
}'
