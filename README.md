# juphub_hello

### These instructions were tested on a Linux machine. It is preferred. They did not work on my Mac ... 

## Install Jupyter Using Miniconda

```sh
conda create --name dockstore-jupyterhub python=3.10
conda activate dockstore-jupyterhub
conda install -c conda-forge nodejs
conda upgrade -c conda-forge nodejs
npm install -g configurable-http-proxy
pip3 install jupyterhub==2.3.1
pip3 install oauthenticator==15.0.1
pip3 install jupyter-client==7.3.4
pip3 install jupyterlab==3.4.3
pip3 install 'sqlalchemy<1.4'
pip3 install --upgrade docker


# This docker spawner allows for image to be specifed in in the url
git clone https://github.com/abessiari/dockerspawner.git -b dockstore
cd dockerspawner/
pip3 install -e .

# use the sample jupyterhub_config.py from this repo
git clone https://github.com/abessiari/juphub_hello

jupyterhub -f juphub_hello/jupyterhub_config.py
```

## Build image

This is the image that will be passed in the uri. Dockerhub will try to pull it. 
So it needs to be built locally where the hub resides. No need to push it to dockerhub. 

```sh
git clone https://github.com/abessiari/juphub_hello.git

cd juphub_hello
docker build -t juphub-hello:main .
docker image list # make sure you see your image
```

## Access Notebook

Modify SOME_USER with your username

Using browser acces at http://localhost:8000/user/SOME_USER/lab/tree/hello.ipynb?image=juphub-hello:main

# Trouble

If any trouble you may want cleanup and then restart jupyterhub 

```sh 
rm -rf jupyterhub.sqlite jupyterhub_cookie_secret 
docker ps -a
docker rm -f jupyter-your-user-name
```
## Dockstore
See jupyterhub branch at https://github.com/abessiari/dockstore/tree/jupyterhub and https://github.com/abessiari/dockstore-ui2/tree/jupyterhub
