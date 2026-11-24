nums = []
total = 0
temp = 0

while True:
    num = int(input("Enter Number: "))
    large = nums[0]
    small = nums[0]
    if num == 0:
        
        print("Your List: ",nums)
        print("Sum is : ",total)
        print("Largest: ",large)
        print("Smallest: ",small)
        break
    total = total+num
    nums.append(num)
    if num > large:
        large=num
    if num <small:
        small=num
        