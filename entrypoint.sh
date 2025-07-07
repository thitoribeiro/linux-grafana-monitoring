#!/bin/sh

set -e

echo "Iniciando a execução sequencial dos cenários de teste k6..."

echo "Executando Load Testing: scenarios/getListUsersLoadTest-script.js"
k6 run scenarios/getListUsersLoadTest-script.js

# echo "Executando Stress Testing: scenarios/getListUsersStressTest-script.js"
# k6 run scenarios/getListUsersStressTest-script.js

# echo "Executando Soak Testing: scenarios/getListUsersSoakTest-script.js"
# k6 run scenarios/getListUsersSoakTest-script.js

# echo "Executando Spike Testing: scenarios/getListUsersSpikeTest-script.js"
# k6 run scenarios/getListUsersSpikeTest-script.js

echo "Todos os cenários foram executados com sucesso."