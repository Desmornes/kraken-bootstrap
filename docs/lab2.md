Le ruleset de `kraken-bootstrap` impose une Pull Request avant toute fusion sur `main`.
Le check `kraken / lint-test` exécute Ruff et Pytest et bloque la fusion si une erreur est détectée.
Le check `kraken / build-push` vérifie que l'image Docker se construit correctement ; les deux checks doivent réussir pour autoriser la fusion.