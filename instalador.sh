#!/bin/sh

#clear


presentacion()
{
################################################################################################################################################################
#Pantalla de Presentacion                                                                                                                                      #
################################################################################################################################################################
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m #                                               # \e[0m"
echo -e "\e[93m # Automatizacion Controller 3.0                 # \e[0m"
echo -e "\e[93m #                                               # \e[0m"
echo -e "\e[93m #                                               # \e[0m"
echo -e "\e[93m #                                               # \e[0m"
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m # Mayo 2021                                     # \e[0m"
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m #                                               # \e[0m"
echo -e "\e[93m # WixanCL                                       # \e[0m"
echo -e "\e[93m # wwww.wixan.cl                                 # \e[0m"
echo -e "\e[93m #                                               # \e[0m"
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[92m  \e[0m"

}

presentacion


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
else 
     if [ "$(ls $app)" ]
     then  
         echo "el directorio tiene algo"
     else 
         echo "el directorio está vacío"
     fi
fi





# composer create-project laravel/laravel example

