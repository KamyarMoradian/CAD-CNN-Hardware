from PIL import Image
import numpy as np

col = Image.open("food.png")
gray_img = col.convert('L')

# Let numpy do the heavy lifting for converting pixels to pure black or white
bw = np.asarray(gray_img).copy()

with open('gray.txt', 'w') as fh:
    i = 0
    fh.write('(')
    for element in bw:
        el_list = str(element).replace('[', '').replace(']', ')').split()
        fh.write(str(i) + ' => ' + '(' + ', '.join(el_list) + ',' + '\n')
        i += 1
    fh.write(');')
