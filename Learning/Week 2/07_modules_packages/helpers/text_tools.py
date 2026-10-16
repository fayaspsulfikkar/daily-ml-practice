def normalize_name(name):
    return " ".join(part.capitalize() for part in name.split())


def initials(name):
    return "".join(part[0].upper() for part in name.split() if part)
