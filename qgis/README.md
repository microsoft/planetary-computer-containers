This is built differently than the rest. After authenticating, you'd trigger the build.

```
az acr build -r pcccr -g pcc-westeurope-rg -t planetary-computer/qgis:3.18 -t planetary-computer/qgis:latest . 
```
