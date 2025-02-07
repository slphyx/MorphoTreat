# MorphoTreat

### Morphology-Based Treatment Identification

**MorphoTreat** is an R package for identifying antimalarial drug treatments based on the blood stage morphology of *Plasmodium falciparum*. It leverages **YOLO Object Detection** to analyze input images and predict the presence of malaria stages including AST, QN, Rings, Trophs, and Schizs.

------------------------------------------------------------------------

## 📌 Prerequisites

Since **MorphoTreat** relies on **YOLO CLI**, you need to install `ultralytics` and ensure YOLO CLI is accessible.

Please follow this link for detailed installation instructions.

🔗 [Official YOLO Installation Guide](https://docs.ultralytics.com/quickstart/)

## 🔹 Installation

### 1. Install from Source (GitHub)

You can install **MorphoTreat** directly from GitHub using either of the commands below:

``` r
devtools::install_github("slphyx/MorphoTreat")
```

or

``` r
remotes::install_github("slphyx/MorphoTreat")
```

### 2. Install from a Local Package File

If you have the package as a **.tar.gz** file, install it using:

``` r
install.packages("MorphoTreat_0.1.0.tar.gz", repos = NULL, type = "source")
```

------------------------------------------------------------------------

## 🔹 Usage

After installation, load the package:

``` r
library(MorphoTreat)
```

### Running a Prediction

To perform detection on an image, simply use the `MorphoPredict()` function. By default, it will run YOLO detection, display the processed image, and return a data frame with the detection results (e.g., detected object class, coordinates, bounding box dimensions, and confidence scores).

**Example:**

``` r
MorphoPredict(img.path = "inst/pics/malaria_sample.png")
```

This command will:

-   **Display the Detected Image:** The processed image with the detected objects is plotted.

-   **Return Detection Data:** A data frame containing details (class, x_center, y_center, width, height, confidence) for each detected object.

#### Disabling Image Display

If you prefer not to display the image and only need the detection results, you can disable the image display by setting `show.image` to `FALSE`:

``` r
MorphoPredict(img.path = "inst/pics/malaria_sample.png", show.image = FALSE)
```

Using this option, the function will simply return the data frame with the detection results without plotting the image.

![](inst/pics/Example.png)

------------------------------------------------------------------------
