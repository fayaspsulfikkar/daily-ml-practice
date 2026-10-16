username = "fayas"
password = "1234"

user_entered_username = input("Enter Your Username: ")



if user_entered_username == username:
    user_entered_password = input("Enter Your Password: ")
    print("\n")
    if user_entered_password == password:
        print("You Have Succesfully Loginned")
    else:
        print("Incorrect Password")
else:
    print("Entered Username is incorrect")