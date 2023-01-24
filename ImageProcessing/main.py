from PIL import Image
from matplotlib import pyplot as plt
import numpy as np

col = Image.open("food.png")
gray_img = col.convert('LA')

# Let numpy do the heavy lifting for converting pixels to pure black or white
bw = np.asarray(gray_img).copy()

with open('gray.txt', 'w') as fh:
    for element in bw:
        el_list = str(element).replace('[', '(').replace(']', ')').split()
        fh.write(','.join(el_list) + '\n')
