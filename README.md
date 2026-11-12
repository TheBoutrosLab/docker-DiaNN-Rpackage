# docker-DiaNN-Rpackage

Docker image for the [DIA-NN R package](https://github.com/vdemichev/diann-rpackage),
which provides report-processing functions and MaxLFQ protein quantitation.

This image is maintained by the Boutros Lab. It builds the DIA-NN R package
from a pinned upstream commit on the versioned `rocker/r-ver` image. The build
removes Windows binaries included in the upstream source archive before
compiling the package for Linux, then checks that `diann_maxlfq()` is available.
The image contains R without RStudio or Conda.

## Version

| Component | Version |
|-----------|---------|
| DIA-NN R package | 1.0.1 (commit `af538f6e2cd5ab715e1381632e17cb8f234ebf53`) |
| R (`rocker/r-ver`) | 4.5.2 |
| R dependencies | `data.table`, `Rcpp`, and `RcppEigen` from Rocker's fixed CRAN snapshot |

## Discussions

- [Issue tracker](https://github.com/TheBoutrosLab/docker-DiaNN-Rpackage/issues) to report errors and enhancement ideas.
- Discussions can take place in [docker-DiaNN-Rpackage Discussions](https://github.com/TheBoutrosLab/docker-DiaNN-Rpackage/discussions).
- [docker-DiaNN-Rpackage pull requests](https://github.com/TheBoutrosLab/docker-DiaNN-Rpackage/pulls) are also open for discussion.

## Contributors

Please see the list of [Contributors](https://github.com/TheBoutrosLab/docker-DiaNN-Rpackage/graphs/contributors) at GitHub.

## References

1. [DIA-NN R package](https://github.com/vdemichev/diann-rpackage).
2. [Rocker versioned R images](https://github.com/rocker-org/rocker-versioned2).
3. Cox J, Hein MY, Luber CA, Paron I, Nagaraj N, Mann M. Accurate proteome-wide label-free quantification by delayed normalization and maximal peptide ratio extraction, termed MaxLFQ. *Molecular & Cellular Proteomics*. 2014;13(9):2513–2526. doi: [10.1074/mcp.M113.031591](https://doi.org/10.1074/mcp.M113.031591).

## License

Author: Chenghao Zhu

docker-DiaNN-Rpackage is licensed under the GNU General Public License version 2. See the file [LICENSE](LICENSE) for the terms of the GNU GPL license.

docker-DiaNN-Rpackage provides a containerized R environment for DIA-NN report quantitation. Bundled software retains its respective upstream license; the DIA-NN R package is licensed under CC BY 4.0.

Copyright (C) 2026 Sanford Burnham Prebys Medical Discovery Institute ("Boutros Lab") All rights reserved.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
