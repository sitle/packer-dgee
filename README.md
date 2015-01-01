## PACKER-DGEE

Ce projet permet de construire des images de machines virtuelles.

### Installation de l'environnement

Pour utiliser l'environnement, vous avez besoin des pré-requis suivant :

* ruby
* la gem bundler ````gem install bundler````
* packer
* vmware workstation

Il faut ensuite cloner le dépôt et installer les dépendances de "rake" :

````bash
git clone https://github.com/farahei14/packer-dgee.git
cd packer-dgee
bundle install
```

### Générer une image

Pour générer une image, veuillez utiliser la commande suivante :

````bash
rake prod:build role=ROLE
```

ROLE prendra le nom d'un des fichiers se trouvant dans le répertoire "roles". Il générera une image au format OVA portant le nom du rôle.

