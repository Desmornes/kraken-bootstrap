FROM python:3.12-slim

WORKDIR /app

# Installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Créer un utilisateur non-root
RUN useradd --create-home --uid 1000 app

# Copier les fichiers nécessaires
COPY --chown=app:app app/ app/
COPY --chown=app:app data/ data/

# Autoriser l'écriture dans le dossier de sortie
RUN mkdir -p /app/output && chown -R app:app /app/output

# Définir le dossier de sortie par défaut
ENV OUTPUT_DIR=output

# Exécuter le job avec un utilisateur non-root
USER app

CMD ["python", "-m", "app.main"]
