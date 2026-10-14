def menu_items():
    print()
    print("--------MENU--------")
    print("1. For Login")
    print("2. For Register")
    print("3. For Delete")
    print("4. For Exit")
    print("--------------------")

usernames = ["fayas","mahir","afnan"]
passwords = ["fayas@123","python","python@123"]

def login():
    username = input("Enter Your Username: ")
    password = input("Enter Your Password: ")
    if username in usernames:
        index = usernames.index(username)
        if password == passwords[index]:
            print("--Login Successfully--")
            print("Welcome ",username)
        else:
            print("--Incorrect Password--")
    else:
        print("--Username Not Found--")
        print("--Please Register--")

def register():
    username = input("Enter Yout Username: ")
    password = input("Enter Your Password: ")

    if username in usernames:
        print("------")
        print("User name Alreadi exisiting")
        print("------")
    else:
        usernames.append(username)
        passwords.append(password)
        print("---Registered Succesfully---")

def delete(username):
    if username in usernames:
        index = usernames.index(username)
        password = input("Enter Your Password: ")

        if password == passwords[index]:
            usernames.pop(index)
            passwords.pop(index)
            print("--Account deleted Successfully--")
        else:
            print("Incorrect Passowrd")
    else:
        print("Account Not Found")


isRunning = True

while isRunning == True:
    menu_items()

    choice = int(input("Enter Your Choice: "))

    if choice == 1:
        login()
    elif choice == 2:
        register()
    elif choice == 3:
        username = input("Enter Username for Deletion: ")
        delete(username)
    elif choice == 4:
        print("---Programm Exiting---")
        isRunning = False
        break
    else:
        print("---Invalid Choice---")

