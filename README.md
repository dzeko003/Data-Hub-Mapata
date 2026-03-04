# DataHub - Plateforme de Gestion de Données

DataHub est une application full-stack complète composée d'un frontend React, d'une API Laravel/PHP, d'une base de données MySQL, le tout orchestré avec Docker et routé via Traefik.

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────┐
│                      TRAEFIK                         │
│  Reverse Proxy & Load Balancer (port 80, 8082)       │
└──────────────┬───────────────────────┬──────────────┘
               │                       │
    ┌──────────▼──────────┐    ┌──────▼──────────┐
    │   datahub_frontend   │    │   datahub_api    │
    │   React              │    │   Laravel/PHP    │
    │   Nginx              │    │   PHP-FPM        │
    │   Port: 80 (interne) │    │   Nginx/Supervisor
    └──────────────────────┘    └──────┬──────────┘
                                       │
                               ┌───────▼────────┐
                               │       db        │
                               │    MySQL 8.0    │
                               │   Port: 3306    │
                               └─────────────────┘
```

## 📦 Prérequis

- [Docker](https://docs.docker.com/get-docker/) (version 20.10+)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0+)
- Git
- 4 Go de RAM minimum disponible
- Configuration DNS locale (fichier hosts)

## 🚀 Installation rapide

### Cloner le projet

```bash
git clone <url-du-depot>
cd datahub
```

### Lancer l'application

```bash
docker-compose up -d
```

### Configurer le fichier hosts

Ajoutez ces lignes à votre fichier hosts (`/etc/hosts` ou `C:\Windows\System32\drivers\etc\hosts`) :

```
127.0.0.1 datahub.localhost
127.0.0.1 api.datahub.localhost
127.0.0.1 pma.localhost
```

## ⚙️ Configuration détaillée

### Docker Compose

```yaml
# Version simplifiée de votre docker-compose.yml
services:
  traefik: # Reverse proxy
  db: # MySQL 8.0
  phpmyadmin: # Interface DB
  datahub_api: # Laravel API
  datahub_frontend: # React App
```

### Backend (Laravel/PHP)

Le backend utilise une image PHP 8.3-FPM avec :

- Extensions PHP : pdo_mysql, mbstring, xml, zip, gd, redis
- Nginx comme serveur web
- Supervisor pour gérer PHP-FPM et Nginx
- Composer pour les dépendances

**Fichiers de configuration requis :**

- `datahub-api/nginx.conf` : Configuration Nginx
- `datahub-api/supervisord.conf` : Configuration Supervisor

### Frontend (React)

Le frontend est construit en 2 étapes :

1. **Build** : Image Node pour compiler l'application avec Vite
2. **Production** : Image Nginx servant les fichiers statiques

## 🌐 Accès aux services

| Service               | URL                          | Identifiants |
| --------------------- | ---------------------------- | ------------ |
| **Application**       | http://datahub.localhost     | -            |
| **API**               | http://api.datahub.localhost | -            |
| **phpMyAdmin**        | http://pma.localhost         | À configurer |
| **Dashboard Traefik** | http://localhost:8082        | -            |

## 📸 Captures d'écran

### Interface Frontend (React)

```
[Image : Capture d'écran de l'application frontend]
*Figure 1: Page d'accueil de l'application DataHub*
```

![alt text](<Capture d’écran du 2026-03-04 21-14-47.png>)

### API Backend (Laravel)

```
[Image : Capture d'écran de la documentation API ou d'une réponse API]
*Figure 2: Exemple de réponse de l'API Laravel*
```

![alt text](<Capture d’écran du 2026-03-04 21-21-28.png>)

### phpMyAdmin

```
[Image : Capture d'écran de l'interface phpMyAdmin]
*Figure 3: Interface d'administration de la base de données*
```

![alt text](<Capture d’écran du 2026-03-04 21-17-07.png>)

### Dashboard Traefik

```
[Image : Capture d'écran du dashboard Traefik]
*Figure 4: Tableau de bord Traefik avec les routes configurées*
```

![alt text](<Capture d’écran du 2026-03-04 21-23-48.png>)

## 📁 Structure du projet

```
datahub/
├── docker-compose.yml
├── README.md
├── datahub-api/                 # Backend Laravel
│   ├── .env.example
│   ├── nginx.conf
│   ├── supervisord.conf
│   ├── app/
│   ├── bootstrap/
│   ├── config/
│   ├── database/
│   ├── public/
│   ├── resources/
│   ├── routes/
│   ├── storage/
│   └── ...
├── data-hub/                     # Frontend React
│   ├── .env.example
│   ├── index.html
│   ├── vite.config.js
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── nginx.conf
└── db/
    └── datahub.sql               # Script d'initialisation DB
```

## 🛠️ Commandes utiles

### Gestion des conteneurs

```bash
# Démarrer tous les services
docker-compose up -d

# Arrêter tous les services
docker-compose down

# Redémarrer un service spécifique
docker-compose restart datahub_api

# Voir les logs en temps réel
docker-compose logs -f

# Voir les logs d'un service spécifique
docker-compose logs -f datahub_api
```

### Accès aux conteneurs

```bash
# Backend Laravel
docker exec -it datahub_api sh

# Frontend
docker exec -it datahub_frontend sh

# Base de données
docker exec -it db mysql -u root -p
```

### Commandes Laravel

```bash
# Exécuter les migrations
docker exec datahub_api php artisan migrate

# Générer une clé d'application
docker exec datahub_api php artisan key:generate

# Vider le cache
docker exec datahub_api php artisan cache:clear
```

### Mode développement

Pour le développement, vous pouvez monter les dossiers locaux :

```yaml
# À ajouter dans docker-compose.yml pour le développement
services:
  datahub_api:
    volumes:
      - ./datahub-api:/var/www # Montage pour développement
  datahub_frontend:
    volumes:
      - ./data-hub:/app # Montage pour développement
```

## 📊 Illustrations supplémentaires

### Flux de requêtes

```
[Image : Diagramme de flux des requêtes à travers Traefik]
*Figure 5: Cheminement d'une requête utilisateur à travers l'infrastructure*
```

![alt text](<Capture d’écran du 2026-03-04 21-27-54.png>)

## 🔧 Dépannage

### Problèmes courants

**1. Les services ne démarrent pas**

```bash
# Vérifier les logs
docker-compose logs
# Vérifier les ports
sudo lsof -i :80,8082,3306
```

**2. Erreur "Host not found"**

- Vérifiez le fichier hosts
- Vérifiez que Traefik est bien démarré

**3. Erreur de connexion à la base de données**

```bash
# Vérifier que MySQL est prêt
docker logs db
# Tester la connexion
docker exec datahub_api php artisan db:monitor
```

**4. Permission denied sur storage**

```bash
docker exec datahub_api chmod -R 777 storage bootstrap/cache
```

**5. Reconstruire depuis zéro**

```bash
# Supprimer tout et recommencer
docker-compose down -v
docker-compose build --no-cache
docker-compose up -d
```

### Logs importants

```bash
# Logs Nginx (backend)
docker exec datahub_api tail -f /var/log/nginx/error.log

# Logs PHP-FPM
docker exec datahub_api tail -f /var/log/php-fpm.log

# Logs Laravel
docker exec datahub_api tail -f storage/logs/laravel.log
```

## 🔒 Sécurité - Production

⚠️ **Configuration de production requise** :

1. **Traefik**
   - Désactiver `api.insecure=true`
   - Configurer HTTPS avec Let's Encrypt
   - Ajouter des middlewares d'authentification

2. **Base de données**
   - Changer le mot de passe root
   - Créer un utilisateur dédié avec privilèges restreints
   - Activer le chiffrement des connexions

3. **Application**
   - Mettre `APP_DEBUG=false`
   - Générer une nouvelle clé d'application
   - Configurer le cache et la session en production

4. **Réseau**
   - Limiter les ports exposés
   - Utiliser des réseaux Docker isolés
   - Configurer des firewalls

## 🤝 Contribution

1. Forkez le projet
2. Créez votre branche (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Pushez vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

---

**Dernière mise à jour :** Mars 2026

**Mainteneur :** [Berenis MASSAMBA]

---

_Pour toute question ou problème, ouvrez une issue sur le dépôt GitHub._
