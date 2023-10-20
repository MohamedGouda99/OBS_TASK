import re

def is_valid_email(email):
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email)

def process_user_data(name, email, id):
    name = name.strip()
    email = email.strip()
    id = id.strip()

    try:
        id = int(id)
        id_type = "even" if id % 2 == 0 else "odd"
    except ValueError:
        id_type = None

    return name, email, id_type

users = [
    ("John", "john_j123@domain.com", "325"),
    ("Susan", "", "510"),
    ("Jane", "jane_j121@domain.com", "131"),
    ("Karl", "karl_ka234@domain.com", ""),
    ("Bert", "bert_bb23@localhost", "150")
]

with open("input.txt", "w") as file:
    for name, email, id in users:
        file.write(f"{name}, {email}, {id}\n")

with open("input.txt", "r") as file:
    for line in file:
        name, email, id = line.strip().split(',')
        name, email, id_type = process_user_data(name, email, id)

        if id_type is not None and is_valid_email(email):
            print(f"The ID of {email} is {id_type} number.")
        elif id_type is None:
            print(f"Invalid ID for {name}")
        else:
            print(f"Invalid email for {name}")
