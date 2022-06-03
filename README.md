# swapi_demo

C'est un flutter projet sur swapi api.

Avant de lancer le projet, exécutez cette commande pour installer les librairie:
```
flutter pub get
```

Lancer le projet:
```
flutter run
```

### Functions V1

- Liste de catégorie dans dashboard
- En cliquant chaque catégorie, il affiche une liste de ressource
- Vous pouvez ajouter les éléments comme favori, et les trouver dans la liste de favoris

### Functions V2

- **Search bar** dans chaque page resource
- Lazy loading de la liste de ressource quand **glisser vers le bas**
- Enlever les favoris:
    - Dans la liste de ressource: **LongPress** la coeur
    - Dans la liste de favoris: **LongPress** la coeur / **glisser vers le gauche** et cliquer **Remove**
- Mettre la favori en haut: **glisser vers le gauche** et cliquer **Top**

### Performance amélioré

- L'animation de dashboard n'est chargée que la première fois

    
    



