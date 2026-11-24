nums = []
total=0

while True:
    num = int(input("Enter Numbers: "))

    if num == 0:
        print("Your Entered ",len(nums))
        print("Your List:",nums)
        print("Sum = ",total)
        break
    total=total+num
    nums.append(num)