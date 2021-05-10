#!/bin/sh

#clear

clear

echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m # Instalacion de Aplicacion                     # \e[0m"
echo -e "\e[93m #                                               # \e[0m"
echo -e "\e[92m ################################################# \e[0m"
                                                                                                                                       │            echo -e "\e[93m # Instalacion de Aplicacion                     # \e[0m"
                                                                                                                                       │            echo -e "\e[93m #                                               # \e[0m"
                                                                                                                                       │            echo -e "\e[92m ################################################# \e[0m"


echo -e "\e[96m Escriba el Nombre de la aplicacion \e[0m"
echo -n " >> "
read  app
echo  $app
echo -e "\e[92m  \e[0m"


if [ ! -d $app ]
then 
     echo -e "\e[92m El directorio no existe \e[0m"
     echo -e "\e[92m Se creara la aplicacion \e[0m"
     composer create-project laravel/laravel $app
     echo -e "\e[92m La aplicacion ha sido creada \e[0m"
     read -rsp $'Presione cualquier tecla o espere 5 segundos para continuar  \n' -n 1 -t 5;
     index.sh
else 
     if [ "$(ls $app)" ]
     then  
         echo -e "\e[92m El directorio no esta vacio \e[0m"
     else 
         echo -e "\e[92m El directorio no esta vacio \e[0m"
     fi
fi







