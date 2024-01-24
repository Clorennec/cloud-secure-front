# Utiliser une image Node.js avec npm installé
FROM node:14-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le package.json et le package-lock.json dans le conteneur
COPY package.json package-lock.json /app/

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers du projet dans le conteneur
COPY . /app/

# Exposer le port utilisé par l'application React Native (par exemple, 3000)
EXPOSE 19006

# Commande pour démarrer l'application React Native
CMD ["npm", "run", "web"]
