remove_subject() {
    list_subjects
    echo "Please selectr the subject/project you want to delete: "
    read subject
    if [ -d "$Home/personal_organiser/$subject" ]; then
        echo "Are you sure you want to delete the subject $subject and all its contents?"
        read confirmation

        if ["$confirmation" == "y" ]; then
            rm -r "$HOME/personal_organiser/$subject"
            echo "Subject $subject has been deleted."
        else
            echo "Deletion cancelled."
        fi
    else
        echo "Subject not found."
    fi
}

# Main Menu
while true; do
    echo "------------------------"
    echo "Personal Organizer Menu:"
    echo "1. Create a new subject/project"
    echo "2. Add a note"
    echo "3. View notes"
    echo "4. Search notes"
    echo "5. Archive notes"
    echo "6. Remove a subject"
    echo "7. Exit"
    echo "------------------------"
    echo "Choose an option:"
    read option
    case $option in 
        1)
            create_subject
            ;;
        2)
            list_subjects
            add_note
            ;;
        3)
            list_subjects
            view_notes
            ;;
        4)
            list_subjects
            search_notes
            ;;
        5)
            list_subjects
            archive_notes
            ;;
        6)
            remove_subject
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option, please try again!"
            ;;
    esac
done