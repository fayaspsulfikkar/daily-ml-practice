def mutli_table(num1):
    i = 1
    while i<=10:
        mult = i*num1
        print(i,"*",num1,"=",mult)
        i += 1

num1 = int(input("Enter a Number: "))
mutli_table(num1)