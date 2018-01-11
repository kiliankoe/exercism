import re

def is_pangram(sentence):
   letters_only = re.sub('[^a-zA-Z]', '', sentence)
   lower = letters_only.lower()
   return len(set(lower)) == 26
