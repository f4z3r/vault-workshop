vault kv put -mount=secret teams/cloud-operations/app/backend/database username=admin password=supersecret > /dev/null
vault kv put -mount=secret teams/cloud-operations/app/backend/event-stream username=admin password=alsosecret > /dev/null
vault kv put -mount=secret teams/cloud-operations/app/backend/cache username=admin password=supersecret > /dev/null
vault kv get -mount=secret teams/cloud-operations/app/backend/event-stream > /dev/null
vault kv get -mount=secret teams/cloud-operations/app/backend/database > /dev/null
