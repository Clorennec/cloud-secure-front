#!/bin/bash

docker run -d --network cloud-secure-network --name front-1 -p 19006:19006 cloud-secure-front

if [ $? -eq 0 ]; then
    echo "Lancement du container réussi."
    exit 0
else
    echo "Erreur lors du lancement du container."
    exit 1
fi