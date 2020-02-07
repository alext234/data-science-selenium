![Build and Publish](https://github.com/alext234/data-science-selenium/workflows/Build%20and%20Publish/badge.svg?branch=master)

This repo builds a docker image that has Python3, Jupyter notebooks and related libraries. It also has Selenium, Chrome, and Firefox browers which are useful for web scraping.


## Built image

The built docker image is avaible at Dockerhub

```
alext234/datascience:latest
```


Below are some sample usage.


## Run Jupyter notebook

Enter the container's shell

```
docker run  -p 8888:8888 -it -v $PWD:/stats -w /stats alext234/datascience:latest  bash 
```

Start Jupyter notebook 

```
jupyter notebook --allow-root --ip=0.0.0.0
```

## Web scraping with Selenium

TODO
