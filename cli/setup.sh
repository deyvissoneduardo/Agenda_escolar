#!/bin/bash

echo "Setando variavél de ambiente em /etc/hosts"
echo "127.0.0.1    desenv.php" >> /etc/hosts


echo "subindo aplicação..."
cd ../
docker-compose up -d

echo "*****************************"
echo "*   Ambienete Configurado  *"
echo "*   acesse desenv.php:8080 *"
echo "*****************************"
