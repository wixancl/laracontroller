#!/bin/bash
#!/bin/sh

#clear


################################################################################################################################################################
#Definicion de variables                                                                                                                                       #
################################################################################################################################################################
NOMBRE_1="Informe"
FECHA_Y_HORA=`date "+%d-%m-%y_%H-%M-%S"`
CADENA_1=$NOMBRE_1$FECHA_Y_HORA
################################################################################################################################################################




################################################################################################################################################################
#Pantalla de Presentacion                                                                                                                                      #
################################################################################################################################################################
presentacion()
{
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
################################################################################################################################################################

################################################################################################################################################################
#Instalacion Aplicacion                                                                                                                                        #
################################################################################################################################################################
instalarapp()
{
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m # Instalacion de Aplicacion                     # \e[0m" 
echo -e "\e[93m #                                               # \e[0m" 
echo -e "\e[92m ################################################# \e[0m" 

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
else
     if [ "$(ls $app)" ]
     then

         echo -e "\e[92m El directorio no esta vacio \e[0m"
         echo -e "\e[92m Si desea borrar la aplicacion presione Y en caso contrario N \e[0m"
	 
	 read opcionborraraplicacion
	 if [ $opcionborraraplicacion = "Y" ]
         then
		 rm -rf $app
	 elif [ $opcionborraraplicacion = "N" ]           
	 then
	 	 echo -e "\e[92m no se ha ejecutado ninguan accion  \e[0m"
	 else
	 	 echo -e "\e[92m no se ha ejecutado ninguan accion  \e[0m"
         fi

     else

         echo -e "\e[92m El directorio no esta vacio \e[0m"
         echo -e "\e[92m Si desea borrar la aplicacion presione Y en caso contrario N \e[0m"

	 read opcionborraraplicacion

	 if [ $opcionborraraplicacion = "Y" ]
         then
		 rm -rf $app
	 elif [ $opcionborraraplicacion = "N" ]           
	 then
	 	 echo -e "\e[92m no se ha ejecutado ninguan accion  \e[0m"
	 else
	 	 echo -e "\e[92m no se ha ejecutado ninguan accion..  \e[0m"
         fi
    fi
fi
}
################################################################################################################################################################

################################################################################################################################################################
#Instalacion Base de datos                                                                                                                                     #
################################################################################################################################################################
instalardb()
{
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m # Instalacion de DB                             # \e[0m" 
echo -e "\e[93m #                                               # \e[0m" 
echo -e "\e[92m ################################################# \e[0m" 

echo -e "\e[96m Escriba el Nombre o IP del servidor \e[0m"
echo -n " >> "
read  server
echo  $server
echo -e "\e[92m  \e[0m"

echo -e "\e[96m Escriba el usuario de la base de datos \e[0m"
echo -n " >> "
read dbuser
echo  $dbuser
echo -e "\e[92m  \e[0m"


echo -e "\e[96m Escriba la cotrasena del usaurio de la base de datos \e[0m"
echo -n " >> "
read dbuserpass
echo  $dbuserpass
echo -e "\e[92m  \e[0m"

echo -e "\e[96m Escriba el nombre de la base de datos que desea crear \e[0m"
echo -n " >> "
read db
echo  $db
mysql -h $server -u $dbuser -p$dbuserpass -e "CREATE DATABASE $db;"
mysql -h $server -u $dbuser -p$dbuserpass -e "SHOW DATABASES;"
echo -e "\e[92m  \e[0m"
}
################################################################################################################################################################

################################################################################################################################################################
#Generacion de informe servidor                                                                                                                                #
################################################################################################################################################################
generacioninforme()
{
sudo dpkg --get-selections >> Informe_$FECHA_Y_HORA.txt
}

################################################################################################################################################################



################################################################################################################################################################
#Menu                                                                                                                                                          #
################################################################################################################################################################
menu()
{
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m # Menu                                          # \e[0m" 
echo -e "\e[93m #                                               # \e[0m" 
echo -e "\e[92m ################################################# \e[0m" 

PS3="Selecciona una operación: " 
select opt in instalar instalardb generacioninforme reiniciar salir; 
do 
    case $opt in 
        instalar) 
		instalarapp
		;;
    	
	reiniciar)
		index.sh
		;;
        
	instalardb)
		instalardb
		;;
		
	generacioninforme)
		generacioninforme
		;;
		
	salir) 
            break 
            ;; 
        *) 
            echo "$REPLY no es una operación válida" 
            ;; 
    esac 
done
}
################################################################################################################################################################

clear
presentacion
menu
