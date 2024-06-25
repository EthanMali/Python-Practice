import json

# Global Variables
user_password = '8000'

# Function to read passwords from a file
def read_passwords_from_file(filename):
    try:
        with open(filename, 'r') as file:
            return json.load(file)
    except FileNotFoundError:
        return {}

# Function to save passwords to a file
def save_passwords_to_file(filename, passwords):
    with open(filename, 'w') as file:
        json.dump(passwords, file, indent=4)

# Filename for storing passwords
filename = 'passwords.txt'

# Load stored passwords at startup
user_stored_passwords = read_passwords_from_file(filename)

# Program loop
while True:
    # Prompt the user for the password or an option
    user_input = input("Type the correct password to access your protected passwords, 'add' to add a new password, 'edit' to edit one of your existing passwords, or 'q' to quit: ")
    
    # Check if the entered password matches the stored password
    if user_input == user_password:
        # If the password is correct, display the stored passwords
        print("Stored Passwords:")
        for service, password in user_stored_passwords.items():
            print(f"{service} - {password}")
    
    elif user_input == 'add':
        # Option to add a new password
        service_name = input("Enter the service name: ")
        new_password = input(f"Enter the password for {service_name}: ")
        user_stored_passwords[service_name] = new_password
        save_passwords_to_file(filename, user_stored_passwords)
        print(f"Password for {service_name} added successfully.")

    elif user_input == 'edit':
        # Option to edit an existing password
        service_name = input("Enter the service name: ")
        new_password = input(f"Enter your new password for {service_name}: ")
        user_stored_passwords[service_name] = new_password
        save_passwords_to_file(filename, user_stored_passwords)
        print(f"You have updated your password for {service_name}.")

    elif user_input == 'del':
        service_name = input("Enter the Password Name that you would like to Delete: ")

        if service_name in user_stored_passwords:
            del user_stored_passwords[service_name]
            save_passwords_to_file(filename, user_stored_passwords)
            print(f"You have successfully deleted {service_name}.")

        else:
            print(f"No password found for {service_name}, try again.")
            continue
    
    elif user_input == 'q':
        # Save passwords before quitting
        save_passwords_to_file(filename, user_stored_passwords)
        print("Passwords saved. Program exited.")
        break
    
    else:
        # If the password is incorrect, print an error message and prompt again
        print('Incorrect Password, try again')
