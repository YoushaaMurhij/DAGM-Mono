# DAGM-Mono: Deformable Attention-Guided Modeling for Monocular 3D Reconstruction

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Introduction
This repo is the Pytorch Code of  DAGM-Mono: Deformable Attention-Guided Modeling for Monocular 3D Reconstruction.

### DAGM-Mono Overview:
<img src="./assets\DAGM-Mono.png" alt="drawing" width="800"/>


## Qualitative results on ApolloCar3D - Projection on original images:
<img src="./assets\1.png" alt="drawing" width="400"/>
<img src="./assets\2.png" alt="drawing" width="400"/>
<img src="./assets\3.png" alt="drawing" width="400"/>
<img src="./assets\4.png" alt="drawing" width="400"/>
<img src="./assets\5.png" alt="drawing" width="400"/>
<img src="./assets\6.png" alt="drawing" width="400"/>


## Main Results on ApolloCar3D - Car Instance Benchmark:

Main A3DP-Abs metrics on ApolloCar3D - Car Instance Benchmark (Validation Set)

| Experiment | Mean | c0 | c1 | c2 | c3 | c4 | c5 | c6 | c7 | c8 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Baseline          | 0.2363 | 0.4565 | 0.4195 | 0.3686 | 0.3197 | 0.2785 | 0.2204 | 0.155 | 0.099 | 0.0453 |
| Dual Cross-Att.   | 0.2331 | 0.4561 | 0.4169 | 0.3682 | 0.3285 | 0.2642 | 0.2076 | 0.1485 | 0.0931 | 0.0376 |
| Deformable Att.   | 0.2437 | 0.4621 | 0.4296 | 0.3873 | 0.3345 | 0.2801 | 0.2237 | 0.1646 | 0.106 | 0.0474 |
| Chamfer loss      | 0.2349 | 0.4545 | 0.4122 | 0.3702 | 0.3277 | 0.2703 | 0.2122 | 0.1582 | 0.0986 | 0.0394 |
| H. Cham. loss L2  | 0.2454 | 0.4659 | 0.4236 | 0.3905 | 0.3353 | 0.2805 | 0.2273 | 0.1713 | 0.1083 | 0.0474 |
| H. Cham. loss L3  | 0.2476 | 0.4693 | 0.4318 | 0.3918 | 0.342 | 0.2859 | 0.2256 | 0.1661 | 0.1121 | 0.0501 |
| H. Cham. + D-Att  | **0.2548** | **0.4734** | **0.438** | **0.3949** | **0.3494** | **0.2995** | **0.2402** | **0.1758** | **0.1142** | 0.0527 |

Main A3DP-Rel metrics on ApolloCar3D - Car Instance Benchmark (Validation Set)

Sure, here is the converted markdown table:

| Experiment | Mean | c0 | c1 | c2 | c3 | c4 | c5 | c6 | c7 | c8 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Baseline          | 0.2189 | 0.4566 | 0.408 | 0.3627 | 0.2982 | 0.2479 | 0.1913 | 0.1246 | 0.0731 | 0.0237 |
| Dual Cross-Att.   | 0.2134 | 0.4487 | 0.4033 | 0.349 | 0.2957 | 0.2378 | 0.1741 | 0.1179 | 0.0678 | 0.0291 |
| Deformable Att.   | 0.2249 | 0.4593 | 0.4085 | **0.3683** | 0.3157 | 0.2515 | 0.1927 | 0.1376 | 0.0804 | 0.0336 |
| Chamfer loss      | 0.2172 | 0.4443 | 0.4027 | 0.3554 | 0.3062 | 0.2467 | 0.1893 | 0.1254 | 0.0685 | 0.0293 |
| H. Cham. loss L2  | 0.226 | **0.4652** | 0.4158 | 0.3671 | 0.314 | 0.2499 | 0.1955 | 0.1389 | 0.0796 | 0.0288 |
| H. Cham. loss L3  | 0.2279 | 0.4609 | **0.4202** | 0.3657 | **0.3213** | 0.2515 | 0.2006 | **0.1401** | **0.0856** | 0.0304 |
| H. Cham. + D-Att  | **0.2301** | 0.4646 | 0.4152 | 0.3657 | 0.3181 | **0.2631** | **0.2081** | 0.1384 | 0.0809 | **0.0355** |


## Data setting
You need to set directory path as below
```
${CODE Root}
|-- data
    |-- apollo
        |-- train
            |-- apollo_annot
            |-- images
        |-- val
            |-- apollo_annot
            |-- images
```

- Download annotation files to fill in `apollo_annot` [[here](https://drive.google.com/file/d/1qCUdjJEnKS7jyXDVuDBO5wCYZFeo1VsY/view?usp=sharing)].

- Download image files to fill in `images` [[here](https://apolloscape.auto/car_instance.html)].


## Usage:
For Docker container usage, run:
```bash
git clone DAGM-Mono
cd DAGM-Mono

bash docker/build.sh

bash docker/start.sh
bash docker/into.sh
```
From Conda environment usage, run:
```bash
conda create -n dagm_mono python=3.9
conda activate dagm_mono

#pytorch
conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch -c conda-forge

# detectron2
python -m pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu113/torch1.10/index.html


conda install -c fvcore -c iopath -c conda-forge fvcore iopath

conda install -c bottler nvidiacub

conda install pytorch3d -c pytorch3d

pip install -r requirements.txt
pip install open3d==0.14.1

```

## Train
1. To stable model convergence, we follow BAAM method to first train the 2D modules (Box, Keypoint). You can downlod pre-trained 2D module weights from [here](https://drive.google.com/file/d/1aX_-SfHtXAdE-frgrbrlQYuWddhwX3V3/view?usp=drive_link).
2. Replace it the third line of `configs/custom.yaml`.
3. Run the command below.
```bash
    python main.py -t
```

## Inference
To run inference, update the weights path in the yaml config file and run:
```bash
    python main.py
```


## Evaluation
1. Finish either inference process or train process.
2. Move to `evaluation` folder.
3. Run the command below.
```bash
    python eval.py \ 
        --light \
        --test_dir ../outputs/res \
        --gt_dir ../data/apollo/val/apollo_annot \
        --res_file test_results.txt
```
4. You can show A3DP results in `test_results.txt`.

## Visualization
1. Install open3D python library
2. Move to 'vis' folder.
3. Run the command below.

```bash
    python vis_apollo.py \
        --output [path where the results are saved] \
        --file [file name to vis] \
        --save [path to save vis results]
```

## License
DAGM-Mono is released under MIT license (see LICENSE). It is developed based on a forked version of `BAAM`. We also used code from `OFMPNet`, `Swin-Transformer` and `FMFNet`. Note that the used dataset (ApolloCar3D) is subject to their respective licenses and may not grant commercial use.
