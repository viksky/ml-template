# Machine Learning Repository Template (cookiecutter)

This is a template to work on machine learning projects, especially if you want to use tools such as Docker and MLFlow to create and organize code and experiments more suitable for deployment.

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

More information about how to use the tools can be found inside the template.

To use this for your project, you must install ```cookiecutter``` via ```pip``` and then run the following:

```bash
cookiecutter 
```