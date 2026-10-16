usernames = ["fayas","mahir","afnan"]
passwords = ["fayas@123","python@123","python"]

user_entered_username = input("Enter Username: ")

usernames.append("badhu")

if user_entered_username in usernames:
    index = usernames.index(user_entered_username)
    password = passwords[index]
    user_entered_password = input("Enter Password: ")
    if user_entered_password == password:
        print("Login Success")
    else:
        print("Inavlid Password")
else:
    print("username invalid")