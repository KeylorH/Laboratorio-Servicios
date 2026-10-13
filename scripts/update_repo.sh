#!/bin/bash

REPO_DIR="/home/keylor/laboratorio-servicios"
BRANCH="main"

cd "$REPO_DIR" || exit 1

git fetch origin "$BRANCH"

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "origin/$BRANCH")

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "Cambios detectados. Actualizando..."
    git pull --ff-only origin "$BRANCH"
    systemctl --user restart node-hello.service 2>/dev/null || true
else
    echo "No hay cambios."
fi
