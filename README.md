<h2><img align="center" src="img/fp_img.png"> MISS-tool: medical image segmentation synthesis tool</h2>

## Getting Started

### General Information
**`MISS-tool`** is a MATLAB-based package to emulate contours with certain segmentation errors based on a user-specified truth mask. The `MISS-tool` also provides the segmentation evaluation results of 24 segmentation performance metrics (see [ref] for a full list), including the Dice coefficient, Jaccard index (IoU), Medical Similarity Index (MSI), and several distance-based metrics. The tool can be used for:
* **Segmentation performance evaluation**: the user inputs a segmentation result and a reference standard (a.k.a truth) segmentation and the program outputs performance metrics chosen by the user. 
* **Image segmentation synthesis**: the user inputs a truth mask and the program outputs a segmentation contour with segmentation errors controlled by tunable parameters. The synthetic contours can be used, for example, to investigate the response of performance metrics to certain segmentation errors, thus informing the user to choose appropriate metrics for their applications [ref].
  
The tool can be used in two ways: 

* **Graphical User Interface (GUI)**: the GUI allows for visualization of the synthesis results, interactively tuning synthesis parameters, and evaluation results. It includes:
  - Computing Segmentation Metrics
  - Synthesis of Segmentation Contours

* **Command-line Functions**: the command-line mode allows for processing images in batches as well as providing flexible ways for users to integrate the MISS tool with their applications. It includes:
  - Functions for segmentation evaluation metrics
  - Functions for segmentation synthesis

### User's Manual
User's Manual: [Link](https://htmlpreview.github.io/?https://github.com/DIDSR/MISS-tool/blob/main/Medical%20Image%20Segmentation%20Synthesis%20(MISS)%20Tool%20User%20Guide.html)

### Testing Examples

* [An example of segmentation evaluation](https://htmlpreview.github.io/?https://github.com/DIDSR/MISS-tool/blob/main/Medical%20Image%20Segmentation%20Synthesis%20(MISS)%20Tool%20User%20Guide.html#_Toc172809476)
* [An example of segmentation synthesis](https://htmlpreview.github.io/?https://github.com/DIDSR/MISS-tool/blob/main/Medical%20Image%20Segmentation%20Synthesis%20(MISS)%20Tool%20User%20Guide.html#_Toc172809479)

## Installation
This section will help you to install the packages needed for `MISS-tool`.


### Pre-requirements


### Preparation


### Cite this repository

If you find that `MISS-tool` is useful or if you use it in your project, please consider citing the code:

```
https://github.com/didsr/MISS-tool
```

And this paper:
```
@inproceedings{10.1117/12.2653650,
author = {Shuyue Guan and Ravi K. Samala and Arian Arab and Weijie Chen},
title = {{MISS-tool: medical image segmentation synthesis tool to emulate segmentation errors}},
volume = {12465},
booktitle = {Medical Imaging 2023: Computer-Aided Diagnosis},
editor = {Khan M. Iftekharuddin and Weijie Chen},
organization = {International Society for Optics and Photonics},
publisher = {SPIE},
pages = {1246518},
keywords = {Medical Image Segmentation Synthesis, Manual Segmentation Emulation, Segmentation Evaluation, Segmentation Errors},
year = {2023},
doi = {10.1117/12.2653650},
URL = {https://doi.org/10.1117/12.2653650}
}
```

### Auxiliary Files

The sample data are from the LIDC-IDRI dataset, grouped by slices and including fused labels using STAPLE and MV, can be found [here](https://www.kaggle.com/datasets/shuyueg/lidc-idri-byslices).

### Contact
For any questions/suggestions/collaborations regarding this tool, please contact Shuyue Guan (shuyue.guan@fda.hhs.gov) or Weijie Chen (weijie.chen@fda.hhs.gov).

### Acknowledgment 
* This project was supported in part by an appointment to the ORISE Research Participation Program at the Center for Devices and Radiological Health, U.S. Food and Drug Administration, administered by the Oak Ridge Institute for Science and Education through an interagency agreement between the U.S. Department of Energy and FDA/CDRH.

