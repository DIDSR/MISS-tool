<h2><img align="center" src="img/fp_img.png"> MISS-tool: medical image segmentation synthesis tool</h2>

## Getting Started

### General Information
**`MISS-tool`** is a MATLAB-based package for developers and scientists to emulate segmentations by adjusting the (truth) masks input by users. The MISS-tool also provides the segmentation evaluation results of 24 metrics, including the Dice coefficient, Jaccard index (IoU), Medical Similarity Index (MSI), and several distance-based metrics to show the change between the truth and synthesis segmentations. The main goal of developing this tool is to help stakeholders, graduate students, and scientists to speed up their projects by acquiring synthetic segmentations with known ground truth. For more information please contact: **[shuyue.guan@fda.hhs.gov](mailto:shuyue.guan@fda.hhs.gov)**.

### Modules


### Information for Developers
User Guide Documentation: [Link](https://htmlpreview.github.io/?https://github.com/DIDSR/MISS-tool/blob/main/User%20Guide.htm)
Please refer to the User Guide Documentation or email  **[shuyue.guan@fda.hhs.gov](mailto:shuyue.guan@fda.hhs.gov)** if you have any questions.

### Testing Examples


## Installation
This section will help you to install the packages needed for ValidPath.


### Pre-requirements


### Preparation


### Cite this repository

If you find that MISS-tool is useful or if you use it in your project, please consider citing the code:

```
https://github.com/didsr/MISS-tool
```

And this pape:
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
For any questions/suggestions/collaborations, please contact Shuyue Guan either via this GitHub repo or via email (shuyue.guan@fda.hhs.gov).

### Acknowledgment 
* This project was supported in part by an appointment to the ORISE Research Participation Program at the Center for Devices and Radiological Health, U.S. Food and Drug Administration, administered by the Oak Ridge Institute for Science and Education through an interagency agreement between the U.S. Department of Energy and FDA/CDRH.
* The template of this README is from [Seyed Kahaki](https://github.com/mousavikahaki).
