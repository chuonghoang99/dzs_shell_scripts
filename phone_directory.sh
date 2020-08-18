#! /bin/bash

function edit()
{
    echo "Edit Contacts"
    echo ""
    cat phonedir
    read -p "Enter contact name to edit: " name_edit
    
    if [ "$name_edit" = "" ]; then
        echo "Edit false"
        return 0
    fi


    # Tim kiem nguoc tim nhung dong khong chua tu khoa do
    # grep -v "$name_edit" $phonedir > $file

    # mv $fiel $phonedir

    sed -i -e "/$name_edit/d" phonedir

    read -p "Enter new number for $name_edit: " new_number           
    clear
    echo "$name_edit: $new_number" >> phonedir
    echo "Save successfully"
    
}


while :; do
    echo  ------------***----------------
    echo "Welcome to the Phone Directory"
    echo "1. Add a Contact"              
    echo "2. Search Contacts"            
    echo "3. Edit Contacts"    
    echo "4. Delete Contacts"        
    echo "5. View Phone Directory"       
    echo "6. Quit"                       
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
            echo "$name: $number" >> phonedir
            echo "Save successfully"
        ;;

        2)  echo "---Search Contacts---"
            read -p "Enter contact name to Search: " search_query
            clear
            echo "Search Result"
            grep -i $search_query phonedir
        ;;

        3)  edit 
        ;;

        4)  echo "---Delete Contacts---"
            read -p "Enter contact name to be Delete: " delete_string
            sed -i -e "/$delete_string/d" phonedir
            echo "Delete successfully"
        ;;

        5)  echo "---Phone Directory---"
            echo ""
            cat phonedir
            echo ""
        ;;

        6) break 
        ;;

        *)
        ;;

    esac

    read -p "Press 6 to Quit, Anything else to Return Main Memu: " confirm_exit

    if [ $confirm_exit -eq 6 ]; then 
        break
    fi

done

