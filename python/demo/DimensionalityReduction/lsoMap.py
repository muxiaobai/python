# encoding=utf8

##https://www.imooc.com/article/44214
import numpy as np
import operator 
import matplotlib.pyplot as plt
from sklearn import datasets,decomposition,manifold
from itertools import cycle 
from mpl_toolkits.mplot3d import Axes3D

def load_data():
	swiss_roll =datasets.make_swiss_roll(n_samples=1000)
	return swiss_roll[0],np.floor(swiss_roll[1])

#MDS和Isomap都是保留全局特征的非线性数据降维算法，且出发点都是基于距离保持。不同的是MDS是基于欧式距离，Isomap则是测地线距离。
def isomap_components(*data):
	X,Y=data 
	for n in [3,2,1]:
		mds=manifold.MDS(n_components=n)
		mds.fit(X)
		isomap=manifold.Isomap(n_components=n)
		isomap.fit(X)
		print("n = %d 重建误差：" %n,isomap.reconstruction_error()," 距离误差：",mds.stress_)
def isomap_neighbors(*data):
	X,Y=data
	Neighbors=[1,3,5,10,25,50,100,Y.size-1]
	fig=plt.figure("isomap",figsize=(9, 9))
	for i in range(1):
		mds=manifold.MDS(n_components=2)
		X_r=mds.fit_transform(X)
		ax=fig.add_subplot(3,3,1)
		ax.scatter(X_r[:,0],X_r[:,1],marker='o',c=Y,alpha=0.5)
		ax.set_title("mds")
		plt.xticks(fontsize=10, color="darkorange")
		plt.yticks(fontsize=10, color="darkorange")
		for i,k in enumerate(Neighbors):
			isomap=manifold.Isomap(n_components=2,n_neighbors=k)
			X_r=isomap.fit_transform(X)
			ax=fig.add_subplot(3,3,i+2)
			ax.scatter(X_r[:,0],X_r[:,1],marker='o',c=Y,alpha=0.5)
			ax.set_title("k = %d" %k)
			plt.xticks(fontsize=10, color="darkorange")
			plt.yticks(fontsize=10, color="darkorange")
			plt.suptitle("isomap")
		plt.show()

X,Y=load_data()
fig = plt.figure('data')
ax = Axes3D(fig)
ax.scatter(X[:, 0], X[:, 1], X[:, 2],marker='o',c=Y)
#isomap_components(X,Y)
isomap_neighbors(X,Y)

