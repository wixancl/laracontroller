#!/bin/bash
#!/bin/sh

#clear


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
	 echo -e "\e[92m Creando entorno de seguridad \e[0m"
	 mkdir -p $app/wixan/log
     cd $app
     composer install
     cd ..	 
     read -rsp $'Presione cualquier tecla o espere 5 segundos para continuar  \n' -n 1 -t 5;
     echo -e "\e[92m Para completar la instalacion es mecesario Instalar la Base de datos  \e[0m"
     instalardb
     echo -e "\e[92m Se creara la aplicacion \e[0m"
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
		 menu
	 else
	 	 echo -e "\e[92m no se ha ejecutado ninguan accion..  \e[0m"
		 menu
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
menu
}
################################################################################################################################################################

################################################################################################################################################################
#Generacion de informe servidor                                                                                                                                #
################################################################################################################################################################
generacioninforme()
{
sudo dpkg --get-selections >> Informe_$FECHA_Y_HORA.txt

grep -i apache Informe*.txt
grep -i php Informe*.txt
grep -i maria Informe*.txt
grep -i mysql Informe*.txt
echo -e "\e[96m El informe a sido generado \e[0m"


menu
}
################################################################################################################################################################

################################################################################################################################################################
#Definicion de variables                                                                                                                                       #
################################################################################################################################################################

FECHA_Y_HORA=`date "+%d-%m-%y_%H-%M-%S"`
namecontroller = ""
namespace = ""
FECHA = ""
s = ""
################################################################################################################################################################


################################################################################################################################################################
#Crear Controller                                                                                                                                              #
################################################################################################################################################################
createcontroller()
{
clear
echo -e "\e[92m ################################################# \e[0m"
echo -e "\e[93m # Crear Controller                              # \e[0m" 
echo -e "\e[93m #                                               # \e[0m" 
echo -e "\e[92m ################################################# \e[0m" 

echo -e "\e[42m Creando lista de Variables \e[0m"
echo -e "\e[92m  \e[0m"
echo -e "\e[92m  \e[0m"

echo -e "\e[92m  \e[0m"
echo -e "\e[96m Escriba el Nombre del Controlador \e[0m"
echo -n " >> "
read namecontroller
echo -e "\e[32m ""Controlador"" \e[94m variable \e[91m >> \e[93m \$nombre \e[97m= \e[96m $namecontroller \e[92m OK \e[0m"

echo -e "\e[92m  \e[0m"
echo -e "\e[96m Escriba el Nombre del namespace \e[0m"
echo -n " >> "
read namespace
echo -e "\e[32m ""NameEspace"" \e[94m variable \e[91m >> \e[93m \$namespace \e[97m= \e[96m $namespace \e[92m OK \e[0m"

FECHA=`date "+%Y_%m_%d_%H%M%S"`
echo -e "\e[32m ""Fecha"" \e[94m variable \e[91m >> \e[93m \$FECHA \e[97m= \e[96m $FECHA \e[92m OK \e[0m"

s="s"
echo -e "\e[32m ""Sufijo s"" \e[94m variable \e[91m >> \e[93m \$s  \e[97m= \e[96m $s \e[92m OK \e[0m"

#sub="$nombre$s"
#echo -e "\e[32m ""Nombre + Sufijo"" \e[94m variable \e[91m >> \e[93m \$sub  \e[97m= \e[96m $sub \e[92m OK \e[0m"

#Contr="Controller"
#echo -e "\e[32m ""Texto Controller"" \e[94m variable \e[91m >> \e[93m \$Contr  \e[97m= \e[96m $Contr \e[92m OK \e[0m"

#variable="$nombre"
#echo -e "\e[32m ""Variable de Nombre"" \e[94m variable \e[91m >> \e[93m \$variable  \e[97m= \e[96m $variable \e[92m OK \e[0m"

#conmayuscula=$(echo -n ${variable:0:1} | tr '[:lower:]' '[:upper:]'; echo ${variable:1} | tr '[:upper:]' '[:lower:]')
#echo -e "\e[32m ""Nombre con mayuscula"" \e[94m variable \e[91m >> \e[93m \$conmayuscula  \e[97m= \e[96m $conmayuscula \e[92m OK \e[0m"

#Contr2="$conmayuscula$Contr.php"
#echo -e "\e[32m ""Nombre archivo controlador"" \e[94m variable \e[91m >> \e[93m \$Contr2 \e[97m= \e[96m $Contr2 \e[92m OK \e[0m"

#Contr3="$conmayuscula$Contr"
#echo -e "\e[32m ""Nombre variable controlador"" \e[94m variable \e[91m >> \e[93m \$Contr3 \e[97m= \e[96m $Contr3 \e[92m OK \e[0m"

#Contr4="$conmayuscula$s"
#echo -e "\e[32m ""Mayuscula con S"" \e[94m variable \e[91m >> \e[93m \$Contr4 \e[97m= \e[96m $Contr4 \e[92m OK \e[0m"

#tablefinal="_table.php"
#echo -e "\e[32m ""Final Migracion"" \e[94m variable \e[91m >> \e[93m \$tablefinal \e[97m= \e[96m $tablefinal \e[92m OK \e[0m"

#asterisco="*"
#echo -e "\e[32m ""asterisco"" \e[94m variable \e[91m >> \e[93m \$asterisco \e[97m= \e[96m $asterisco \e[92m OK \e[0m"

#subfinal="$asterisco$sub$tablefinal"
#echo -e "\e[32m ""asterisco + Final"" \e[94m variable \e[91m >> \e[93m \$asterisco$sub$tablefinal \e[97m= \e[96m $asterisco$sub$tablefinal \e[92m OK \e[0m"

#Create="Create"
#echo -e "\e[32m ""Texto Create"" \e[94m variable \e[91m >> \e[93m \$Create \e[97m= \e[96m $Create \e[92m OK \e[0m"

#Table="Table"
#echo -e "\e[32m ""Table"" \e[94m variable \e[91m >> \e[93m \$Table \e[97m= \e[96m $Table \e[92m OK \e[0m"

#CreateNombresTable=$Create$Contr4$Table
#echo -e "\e[32m ""Create nombre de la Tabla"" \e[94m variable \e[91m >> \e[93m \$CreateNombresTable \e[97m= \e[96m $CreateNombresTable \e[92m OK \e[0m"

#extencionmigracion="_table.php"
#echo -e "\e[32m ""Extencion nombre migracion"" \e[94m variable \e[91m >> \e[93m \$extencionmigracion  \e[97m= \e[96m $extencionmigracion \e[92m OK \e[0m"

#createmigracion="_create_"
#echo -e "\e[32m ""Create migracion"" \e[94m variable \e[91m >> \e[93m \$createmigracion  \e[97m= \e[96m $createmigracion\e[92m OK \e[0m"

#fechamigracion="$fecha"
#echo -e "\e[32m ""Fecha migracion"" \e[94m variable \e[91m >> \e[93m \$fechamigracion  \e[97m= \e[96m $fechamigracion \e[92m OK \e[0m"

#archivomigracion=$fechamigracion$createmigracion$sub$extencionmigracion
#echo -e "\e[32m ""Archivo migracion"" \e[94m variable \e[91m >> \e[93m \$archivomigracion  \e[97m= \e[96m $archivomigracion \e[92m OK \e[0m"


#echo -e "\e[94m Ejecutado \e[92m OK \e[0m"
#echo -e "\e[92m  \e[0m"
#echo -e "\e[92m  \e[0m


menu

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
select opt in instalar instalardb generacioninforme createcontroller salir; 
do 
    case $opt in 
    instalar) 
		instalarapp
		;;

	instalardb)
		instalardb
		;;
		
	generacioninforme)
		generacioninforme
		;;
	
	createcontroller)
		createcontroller
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
