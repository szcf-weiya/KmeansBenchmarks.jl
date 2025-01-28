# Kmeans Benchmarks

Clustering is a cornerstone of unsupervised machine learning, with the k-means algorithm standing as one of the most widely used methods for partitioning data into coherent groups. Its simplicity, interpretability, and adaptability have made it a staple in fields ranging from customer segmentation to bioinformatics. However, the performance and results of k-means can vary significantly depending on the implementation choices made by practitioners, including the software ecosystem (e.g., R, Julia, Python), the algorithmic variants employed (e.g., Lloyd’s algorithm, Hartigan-Wong, or scalable approximations like Mini-Batch k-means), and the initialization strategies (e.g., random seeding, k-means++, or density-based initialization). These choices impact not only computational efficiency but also the quality and stability of the resulting clusters.

This project seeks to systematically benchmark and compare k-means implementations across the following aspects:

- **Software ecosystem**: R (e.g., `stats`, `ClusterR`) vs Julia (e.g., `Clustering`)
- **Algorithm variants**: Variants like Lloyd’s, Hartigan-Wong
- **Initialization**: Random seeding, k-means++

We evaluate the performance from three main metrics:

- Clustering accuracy
- Ratio of the Between-sum-of-squares / Total-sum-of-squares
- Computational time

This work aims to provide actionable insights for researchers and practitioners in selecting optimal k-means configurations tailored to their data size, dimensionality, and domain requirements. 