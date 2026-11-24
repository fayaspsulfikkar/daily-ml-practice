def is_pass_correct(password):
    correct_pass = "fayas"

    if password == correct_pass:
        return True
    else:
        return False

username=input("Enter Yout Username: ")

print(is_pass_correct(username))