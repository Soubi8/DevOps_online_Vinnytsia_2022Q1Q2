# pip install bs4
from bs4 import BeautifulSoup

html_file = open(input("Please enter the name of an .html file: "))
soup = BeautifulSoup(html_file, 'html.parser')
title = soup.title.text
print("Title is: ", title)
