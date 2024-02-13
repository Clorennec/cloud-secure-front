#!/bin/bash

DOCKER_IMAGE_NAME="cloud-secure-front"

DOCKERFILE_PATH="/opt/app/front/Dockerfile"

PROJET_MAVEN_PATH="/opt/app/front"

# Vérifier si l'image existe avant de la supprimer
if docker inspect "$DOCKER_IMAGE_NAME" &> /dev/null; then
    echo "L'image Docker $DOCKER_IMAGE_NAME existe. Suppression en cours..."
    docker stop front-1
    docker rm front-1
    docker rmi "$DOCKER_IMAGE_NAME"
    echo "L'image Docker $DOCKER_IMAGE_NAME a été supprimée avec succès."
else
    echo "L'image Docker $DOCKER_IMAGE_NAME n'existe pas."
fi

# Construction de la nouvelle image Docker
docker build -t "$DOCKER_IMAGE_NAME" -f "$DOCKERFILE_PATH" "$PROJET_MAVEN_PATH"

if [ $? -eq 0 ]; then
    echo "L'image Docker a été créée avec succès."
    exit 0
else
    echo "Erreur lors de la création de l'image Docker."
    exit 1
fi

