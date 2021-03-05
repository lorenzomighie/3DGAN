# 3D GAN

Use of a Generative Adversarial Network to produce 3D shapes (in the voxel domain) of sofas and tables.

# How to Use

1) Convert the dataset of meshes into voxels using matlab script polygon2voxel/main.m 

2) Upload the preprocessed dataset into a  Google Drive folder

3) Run the notebook 3DGAN.ipynb on Colab

4) Use the matlab scripts polygon2voxel/visualize.m to look into the results and polygon2voxel/nearest_neighbour.m to look at the nearest neighbour of a certain voxel produced by the network with the shape of the dataset.

For more details see Training_of_a_3D_GAN.pdf

References:

https://github.com/rimchang/3DGAN-Pytorch

https://github.com/liuhyCV/3d-gan-tensorflow
