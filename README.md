# 3D GAN

Use of a Generative Adversarial Network to produce 3D shapes (in the voxel domain) of the sofas and tables which belong to the ModelNet10 dataset.

# How to Use

1) Download the dataset from https://modelnet.cs.princeton.edu/# ;

2) Select a shape to work on;

3) Convert the all the meshes of the chosen shape into voxel domain using matlab script polygon2voxel/main.m ;

4) Upload the preprocessed dataset into a  Google Drive folder;

5) Run the notebook 3DGAN.ipynb on Colab;

6) Download the results and use the matlab scripts polygon2voxel/visualize.m to look into the results and polygon2voxel/nearest_neighbour.m to look at the nearest neighbour of a certain voxel produced by the network with the shape of the dataset.

For more details see Training_of_a_3D_GAN.pdf

References:

https://github.com/rimchang/3DGAN-Pytorch

https://github.com/liuhyCV/3d-gan-tensorflow
