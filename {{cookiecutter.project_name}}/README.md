# {{cookiecutter.project_name}}

Write here a description of your project.

# Table of contents

1. [Repository structure](#repository-structure)
2. [Configuration](#configuration)
    - [Dependencies](#dependencies)
    - [With MLFlow and Docker (recommended)](#with-mlflow-and-docker-recommended)
    - [Without MLFlow and Docker](#without-mlflow-and-docker)
3. [Sources](#sources)

# Repository structure

It is recommended to use the following file naming convention:

```
00-your-file-name.extension
```

for example:

```
01-my-eda-notebook.ipynb
```

This is the folder structure:

```
.
├── artifacts           : for saving any type of artifacts
├── data                : for saving data files (data files are ignored by .gitignore)
├── Dockerfile          : dockerfile for training / inference
├── mlflow-config       : mlflow-server docker configuration
├── notebooks           : for saving .ipynb files (exploration, designing, etc.)
├── poetry.lock         : poetry file with all the dependencies (do not change this manually!)
├── pyproject.toml      : poetry setup (only change this if really necessary)
├── README.md           : this readme!
├── reports             : any type of reports (html, pdf, pptx, etc.)
└── src                 : your experiments training / inference code
```

# Configuration

## Dependencies

This repository uses [**poetry**](https://python-poetry.org/docs/basic-usage/) as a dependency manager.  
Follow these steps:

1. (recommended) Create an environment for your project using [**miniconda**](https://docs.anaconda.com/free/miniconda/miniconda-install/):

```bash
conda create -n {{cookiecutter.project_name}} python=3.9
conda activate {{cookiecutter.project_name}}
```

2. Install poetry:

```bash
pip install poetry
```

3. Inside this repository's root folder, run:

```bash
poetry install
```

You can add or remove dependencies by running (inside this repository's root folder):

```bash
poetry add library-name
```

or

```bash
poetry remove library-name
```

## With MLFlow and Docker (recommended)

[**MLFlow**](https://mlflow.org/docs/latest/getting-started/intro-quickstart/index.html) is a tool for managing experiment results (including models) for machine learning projects.

[**Docker**](https://docs.docker.com/get-docker/) is a platform that lets you execute code within isolated environments called containers. This promotes better reproducibility and scalability of your code.

In this repository, we use them as follows.

1. MLFlow runs inside an auto-restarting container that persists data.
2. Docker is used to run the training and serving code located inside the ```src``` folder.

To configure the **MLFlow server**, open a terminal inside the folder ```mlflow-config``` and run:

```bash
docker build . -t mlflow-server
```

then:

```bash
docker run --restart always -d -p 5000:5000 -e USER=xxxxx -e PASSWORD=xxxxx mlflow-server
```

replacing ```xxxxx``` with your user's login and password.

Now you can access your MLFlow front-end by visiting ```127.0.0.0:5000``` on your browser.  
The server will run at startup.

Once you've configured your MLFlow server, you can follow [**this tutorial**](https://mlflow.org/docs/latest/getting-started/intro-quickstart/index.html) to log your experiments.

To use Docker to train your model, save your code inside the ```src``` folder, make sure that the ```Dockerfile``` is well configured, open a terminal in this repository roo folder and run:

```bash
docker build . -t ml-train
```

To serve the model as an endpoint, run (after building):

```bash
docker run ml-train
```

## Without MLFlow and Docker

Just code your program inside the ```src``` folder ou create a notebook (```.ipynb```) inside the ```notebooks``` folder!

# Sources

- This template was inspired by the [**data science cookiecutter**](https://github.com/drivendata/cookiecutter-data-science).
- The MLFlow configuration was based on [**this Stack Overflow answer**](https://stackoverflow.com/questions/57816617/not-able-to-dockerize-mlflow).