Welcome to the GitHub repository for the following publication: [The effects of PDZ domain extensions on energies, energetic couplings and allostery (Hidalgo-Carcedo C &amp; Faure AJ et al., 2023)]()

Here you'll find an R package with all scripts to reproduce the figures and results from the computational analyses described in the paper.

# Table Of Contents

* **1. [Required Software](#required-software)**
* **2. [Installation Instructions](#installation-instructions)**
* **3. [Required Data](#required-data)**
* **4. [Pipeline Modes](#pipeline-modes)**
* **5. [Pipeline Stages](#pipeline-stages)**

# Required Software

To run the pdzextms pipeline you will need the following software and associated packages:

* **[_R_](https://www.r-project.org/) >=v3.6.1** (bio3d, Biostrings, coin, Cairo, data.table, ggplot2, GGally, hexbin, plot3D, reshape2, RColorBrewer, ROCR, stringr, ggrepel)

The following software is optional:

* **[MoCHI](https://github.com/lehner-lab/MoCHI)** (pipeline for pre-processing deep mutational scanning data i.e. FASTQ to counts)
* **[DiMSum](https://github.com/lehner-lab/DiMSum) v1.2.8** (pipeline for pre-processing deep mutational scanning data i.e. FASTQ to counts)

# Installation

We recommend using [this yaml file](pdzextms.yaml) to create a dedicated Conda environment with all necessary dependencies (as explained below).

1. Install the [Conda](https://docs.conda.io/) package/environment management system (if you already have Conda skip to step 2):

   On MacOS, run:
   ```
   $ curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
   $ sh Miniconda3-latest-MacOSX-x86_64.sh
   ```
   On Linux, run:
   ```
   $ curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
   $ sh Miniconda3-latest-Linux-x86_64.sh
   ```

   **IMPORTANT:** If in doubt, respond with "yes" to the following question during installation: "Do you wish the installer to initialize Miniconda3 by running conda init?". In this case Conda will modify your shell scripts (*~/.bashrc* or *~/.bash_profile*) to initialize Miniconda3 on startup. Ensure that any future modifications to your *$PATH* variable in your shell scripts occur **before** this code to initialize Miniconda3.

2. Clone the pdzextms GitHub repository:
   ```
   $ git clone https://github.com/lehner-lab/pdzextms.git
   ```

3. Create and activate the pdzextms Conda environment:
   ```
   $ conda env create -f pdzextms/pdzextms.yml
   $ conda activate pdzextms
   ```

4. Open R and install pdzextms:
   ```
   # Install
   if(!require(devtools)) install.packages("devtools")
   devtools::install("pdzextms")

   # Load
   library(pdzextms)

   # Help
   ?pdzextms
   ```

# Required Data

Fitness scores, thermodynamic models, pre-processed data and required miscellaneous files should be downloaded from [here]() and unzipped in your project directory (see '_base_dir_' option) i.e. where output files should be written.

# Pipeline Modes

There are a number of options available for running the pdzextms pipeline depending on user requirements.

* ## Basic (default)

Default pipeline functionality ('_startStage_' = 1) uses prefit thermodynamic models and fitness scores from DMS experiments (already processed with MoCHI and DiMSum respectively; see [Required Data](#required-data)) to reproduce all figures in the publication.

* ## Thermodynamic model inference with MoCHI

Pipeline stage 0 ('pdzextms_fit_thermo_model') fits thermodynamic models to DMS data. 

* ## Raw read processing

Raw read processing is not handled by the pdzextms pipeline. FastQ files from paired-end sequencing of replicate deep mutational scanning (DMS) libraries before ('input') and after selection ('output') were processed using **[DiMSum](https://github.com/lehner-lab/DiMSum)** (Faure and Schmiedel et al., 2020).

DiMSum command-line arguments and Experimental design files required to obtain variant counts from FastQ files are available [here]().

# Pipeline Stages

The top-level function **pdzextms()** is the recommended entry point to the pipeline and by default reproduces the figures and results from the computational analyses described in the following publication: [The effects of PDZ domain extensions on energies, energetic couplings and allostery (Hidalgo-Carcedo C &amp; Faure AJ et al., 2023)](). See [Required Data](#required-data) for instructions on how to obtain all required data and miscellaneous files before running the pipeline.

## Stage 0: Fit thermodynamic models with MoCHI

This stage ('pdzextms_fit_thermo_model') fits thermodynamic models to variant fitness data from (_ddPCA_) DMS.

## Stage 1: Evaluate thermodynamic model results

This stage ('pdzextms_thermo_model_results') evaluates thermodynamic model results and performance including comparing to literature _in vitro_ measurements (related to Figure 2).

## Stage 2: Add 3D structure metrics

This stage ('pdzextms_structure_metrics') annotates single mutant inferred free energies with PDB structure-derived metrics.

## Stage 3: Fitness plots

This stage ('pdzextms_fitness_plots') plots fitness distributions and scatterplots.

## Stage 4: Plot fitness heatmaps

This stage ('pdzextms_fitness_heatmaps') plots single mutant fitness heatmaps.

## Stage 5: Plot free energy scatterplots

This stage ('pdzextms_free_energy_scatterplots') plots single mutant free energy scatterplots).

## Stage 6: Plot free energy heatmaps

This stage ('pdzextms_free_energy_heatmaps') plots single mutant free energy heatmaps.

