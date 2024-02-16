#!/bin/bash

check_status() {
  if [ $? -ne 0 ]; then
    echo "Une erreur s'est produite. Le déploiement a échoué."
    exit 1
  fi
}

cd /opt/app/front/scripts

echo "1. Récupération depuis GitHub..."
bash ./pull-code.sh
check_status

echo "2. Construction de l'image Docker..."
bash ./create-docker-image.sh
check_status

echo "3. Lancement du conteneur Docker..."
bash ./run-docker-container.sh
check_status

echo "Le déploiement est terminé avec succès !"
