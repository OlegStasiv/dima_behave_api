import json

import os

import requests

url = "http://84.22.105.2:8000/article/"

payload = {'tag': 'tes', 'view_counter': '1', 'author_title': 'test', 'published': 'true', 'author_name': 'testttttttt', 'author_avatar': '', 'summary': 'asdasda', 'title': 'asdas', 'name': 'asds', 'magazine': '1', 'date': '2018-12-12'}
files = {'image': open('rat.jpg', 'rb')}

r = requests.post(url, files=files, data=payload)
print(r.content)