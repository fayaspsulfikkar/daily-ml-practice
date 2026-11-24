def is_even(number):
    return number % 2 == 0


def clamp(value, minimum, maximum):
    return max(minimum, min(value, maximum))
