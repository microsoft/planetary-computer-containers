# QGIS Environment

This environment includes QGIS 3.18.3.

It uses [jupyter-remote-desktop-proxy](https://github.com/jupyterhub/jupyter-remote-desktop-proxy) to proxy a Desktop environment to your browser. QGIS is launched automatically.

## Building

This is built differently than the rest. After authenticating, you'd trigger the build.

```
az acr build -r pcccr -g pcc-westeurope-rg -t planetary-computer/qgis:3.18 -t planetary-computer/qgis:latest . 
```
