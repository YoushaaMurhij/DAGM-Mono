# DAGM-Mono: Deformable Attention-Guided Modeling for Monocular 3D Reconstruction


## Introduction
This repo is the Pytorch Code of  DAGM-Mono: Deformable Attention-Guided Modeling for Monocular 3D Reconstruction.



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

- Download annotation files to fill in `apollo_annot` [[hear](https://drive.google.com/file/d/1qCUdjJEnKS7jyXDVuDBO5wCYZFeo1VsY/view?usp=sharing)].

- Download image files to fill in `images` [[hear](https://apolloscape.auto/car_instance.html)].


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
DAGM-Mono is released under MIT license (see LICENSE). It is developed based on a forked version of BAAM. We also used code from OFMPNet, Swin-Transformer and FMFNet. Note that the used dataset (ApolloCar3D) is subject to their respective licenses and may not grant commercial use.
