# juphub_hello

## Install Jupyter Using Miniconda

```sh
conda create --name dockstore-jupyterhub python=3.10
conda install -c conda-forge nodejs
conda upgrade -c conda-forge nodejs
npm install -g configurable-http-proxy
pip3 install jupyterhub==2.3.1
pip3 install oauthenticator==15.0.1
pip3 install jupyter-client==7.3.4
pip3 install jupyterlab==3.4.3
git clone https://github.com/abessiari/dockerspawner.git -b dockstore
cd dockerspawner/
pip3 install -e .

jupyterhub --generate-config -f jupyterhub_config.py
# configure oauth, spawner 
sudo ~/miniconda3/envs/dockstore-jupyterhub/bin/jupyterhub -f jupyterhub_config.py
```

## Build image

```sh
git clone https://github.com/abessiari/juphub_hello.git

cd juphub_hello
docker build -t juphub-hello:main .
```

## Access Notebook

Using browser acces at http://localhost:8000/user/abessiari/lab/tree/hello.ipynb?image=juphub-hello:main
