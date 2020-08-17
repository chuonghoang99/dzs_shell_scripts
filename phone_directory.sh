#! /bin/bash

while :
do
    echo  ------------***----------------
    echo "Welcome to the Phone Directory"
    echo "1. Add a Contact"              
    echo "2. Search Contacts"            
    echo "3. Delete Contacts"            
    echo "4. View Phone Directory"       
    echo "5. Quit"                       
    echo -------------***----------------

    read -p "Enter your choice: " usr_cmd
    clear

    case $usr_cmd in 
        1)  echo "---Add New Contact---"
            read -p "Enter name: " name
            read -p "Enter number: " number            
            clear
            echo "New contact info:"
            echo "-> Name: $name. ->Number: $number"
            echo "$name: $number" >> phonedir.log
            echo "Save successfully"
        ;;

        2)  echo "---Search Contacts---"
            read -p "Enter contact name to Search: " search_query
            clear
            echo "Search Result"
            grep -i $search_query phonedir.log
        ;;

        3)  echo "---Delete Contacts---"
            read -p "Enter contact name to be Delete: " delete_string
            sed -i -e "/$delete_string/d" phonedir.log
            echo "Delete successfully"
        ;;

        4)  echo "---Phone Directory---"
            echo ""
            cat phonedir.log
        ;;

        5) break ;;
        *);;

    esac


    read -p "Press 5 to Quit, Anything else to Return Main Memu: " confirm_exit

    if [ $confirm_exit -eq 5 ]
    then 
        break
    fi

done
