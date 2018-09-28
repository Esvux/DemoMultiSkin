#!/bin/bash
echo -e "Powered by Nabenik"
echo -e "\nIngrese un identificador para el nuevo skin\n(solo se permiten letras minúsculas y sin espacios en blanco):\n"
read skin
id_tpl='^[a-z]+$'
if [[ ! $skin =~ $id_tpl ]]; then
  echo -e "\033[0;30mID de skin inválido\nBye, bye...\n\033[0m"
  echo "Presione [Enter] para salir"
  exit 2
fi
echo -e "\nID de skin válido\n"

#########################################
############## DIRECTORIOS ##############
#########################################
sleep .8
if [ ! -d "$skin/res/drawable" ]; then
  echo -e "Creando directorio [drawable]"
  mkdir --parents "$skin/res/drawable"
else
  echo -e "El directorio [drawable] ya existe"
fi
sleep .8
if [ ! -d "$skin/res/values" ]; then
  echo -e "Creando directorio [values]"
  mkdir --parents "$skin/res/values"
else
  echo -e "El directorio [values] ya existe"
fi
sleep .8
if [ ! -d "$skin/res/values" -o ! -d "$skin/res/drawable" ]; then
  echo -e "\033[0;30mError al crear los directorios\nBye, bye...\n\033[0m"
  echo "Presione [Enter] para salir"
  exit 3
fi
echo -e "Directorios creados correctamente\n"
echo "  $skin"
echo "  └── res"
echo "      ├──drawable"
echo "      └──values"
echo ""

#########################################
############### ARCHIVOS ################
#########################################
sleep .8
if [ ! -f "$skin/res/values/colors.xml" ]; then
  echo -e "Creando archivo de definición de colores [colors.xml]"
  echo -e "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n<!--Define your colors here-->\n</resources>" >> "$skin/res/values/colors.xml"
else
  echo -e "El archivo de colores [colors.xml] ya existe"
fi
sleep .8
if [ ! -f "$skin/res/values/colors.xml" ]; then
  echo -e "\033[0;30mError al crear el archivo de colores\nBye, bye...\n\033[0m"
  echo "Presione [Enter] para salir"
  exit 3
fi
sleep .8
echo -e "Para modificar los colores del skin, debe modificar\nel archivo \033[0;33m$skin/res/values/colors.xml\033[0m\n"

#########################################
############## NEW FLAVOR ###############
#########################################
sleep .8
echo -e "\nCopiar y pegar el siguiente texto en el archivo \nbuild.gradle, en el apartado productFlavors"
echo -e "\n\033[0;33m\t\t$skin {"
echo -e "\t\t\tdimension 'client'"
echo -e "\t\t\tresValue 'string', 'app_name', 'CAMBIAR POR NOMBRE DE APP'"
echo -e "\t\t\tapplicationId 'org.esvux.demos.demomultiskin.$skin'"
echo -e "\t\t}\033[0m\n"
echo "Presione [Enter] para terminar"
read v
