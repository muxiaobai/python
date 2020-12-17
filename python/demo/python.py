# encoding=utf8


#pd.read_csv()
import os
import sys
#print("1")
#print(os.path)
#print(sys.path)
#print(sys.version)

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
def create_img():
	x = np.arange(0,5,0.1)
	y = np.sin(x)
	plt.plot(x,y)
	plt.savefig("xxx.jpg")
	plt.show()


create_img()

