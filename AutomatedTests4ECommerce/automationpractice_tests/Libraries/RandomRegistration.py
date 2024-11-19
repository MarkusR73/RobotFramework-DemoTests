import random
import string

def generate_random_string():
    random_name = ''.join(random.choices(string.ascii_letters, k=20))
    return random_name

def generate_random_email():
    random_string = ''.join(random.choices(string.ascii_letters, k=20))
    return random_string + "@reindeer.fi"