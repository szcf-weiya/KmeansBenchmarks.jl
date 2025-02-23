# KmeansBenchmarks.jl

[![CI](https://github.com/szcf-weiya/KmeansBenchmarks.jl/actions/workflows/ci.yml/badge.svg)](https://github.com/szcf-weiya/KmeansBenchmarks.jl/actions/workflows/ci.yml)

This project seeks to systematically benchmark and compare k-means implementations across the following aspects:

- **Software ecosystem**: R (e.g., `stats`, `ClusterR`) vs Julia (e.g., `Clustering`)
- **Algorithm variants**: Variants like Lloyd’s, Hartigan-Wong
- **Initialization**: Random seeding, k-means++

We evaluate the performance from three main metrics:

- Clustering accuracy
- Ratio of the Between-sum-of-squares / Total-sum-of-squares
- Computational time

![Image](https://github.com/user-attachments/assets/5cce383c-5fd4-4133-83a4-18c2c2c17900)

> **:dizzy: You can check the interactive Plotly figures at <https://hohoweiya.xyz/KmeansBenchmarks.jl>**

This work aims to provide actionable insights for researchers and practitioners in selecting optimal k-means configurations tailored to their data size, dimensionality, and domain requirements. 