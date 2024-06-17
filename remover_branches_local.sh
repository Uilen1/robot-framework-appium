#!/bin/bash

#Obtem a lista de branches remotas e atualiza a lista local
git fetch --prune

#Loopp sobre todas as branchs locais
for branch in $(git branch --format '%(refname:short)'); do
#Verifica se a branch existe no remoto
    if ! git show-ref --quiet refs/remotes/origin/$branch; then
    # Se a branch nao existe no remoto, ela é excluida localmente
        git branch -D $branch
        echo "  => Branch local '$branch' foi excluida porque nao existe no repositorio remoto."
    fi
done