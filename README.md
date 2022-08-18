# juphub_hello

### These instructions were tested on a Linux machine. It is preferred. They did not work on my Mac ... 

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

# This docker spawner allows for image to be specifed in in the url
git clone https://github.com/abessiari/dockerspawner.git -b dockstore
cd dockerspawner/
pip3 install -e .

# Generate config file or use the sample jupyterhub_config.py from this repo
# jupyterhub --generate-config -f jupyterhub_config.py 
# You need to configure the hub ip. It needs to be public 
c.JupyterHub.hub_ip = 'XXX.XXX.XXX.XXX'

# GUTHUB OAUTH For this callback to work: use 'ssh -L 8000:131.243.2.50:8000 username@HUB_PUBLIC_IP'
c.GitHubOAuthenticator.oauth_callback_url = 'http://localhost:8000/hub/oauth_callback'
c.GitHubOAuthenticator.client_id = 'XXX'
c.GitHubOAuthenticator.client_secret = 'XXX'


# Default image. 
c.DockerSpawner.image = 'jupyterhub/singleuser:2.3.0'

sudo ~/miniconda3/envs/dockstore-jupyterhub/bin/jupyterhub -f jupyterhub_config.py
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

Using browser acces at http://localhost:8000/user/abessiari/lab/tree/hello.ipynb?image=juphub-hello:main

# Trouble

If any trouble you may want cleanup and then restart jupyterhub 

```sh 
rm -rf jupyterhub.sqlite jupyterhub_cookie_secret 
docker ps -a
docker rm -f jupyter-your-user-name
```
