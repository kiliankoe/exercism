import re

def is_isogram(word):
    word = word.lower()
    word = re.sub("[^a-zA-Z]", "", word)
    return len(set(word)) == len(word)
