#!/bin/bash

# ler arquivo de variaveis
read_var=$(cat /etc/hosts | grep desenv.php)

mountapp(){
	echo "*******************Subindo aplicação******************"
	cd ../
	docker-compose	up -d
}

# faz a verificação se existe a varivavel
if [ $? -eq 1 ]
then 
	echo "Setando variavél de ambiente em /etc/hosts"
	echo "127.0.0.1    desenv.php" >> /etc/hosts
	mountapp
else 
	mountapp
fi

echo "*****************************"
echo "*   Ambienete Configurado  *"
echo "*   acesse desenv.php:8080 *"
echo "*****************************"
