username = "fayas"
password = "1234"

userLoggedin = False

while userLoggedin == False:
    user_entered_username = input("Enter Username: ")
    if user_entered_username == username:
        user_entered_password = input("Enter Password: ")
        if user_entered_password == password:
            print("Login Succesfull")
            userLoggedin=True
        else:
            print("Incorrect Password")
    else:
        print("Incorrect Username")