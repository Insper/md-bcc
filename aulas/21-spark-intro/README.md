# Spark

Acesse, no terminal, a pasta `aulas` do repositório e execute o comando abaixo para iniciar o Spark:

**Atenção**: Estar na pasta `aulas` é importante para que o Jupyter Notebook consiga acessar o arquivo `.env` e os notebooks das aulas!

- Linux e MacOS:

```bash
docker run \
    -it \
    --rm \
    -p 8888:8888 \
    -p 4040:4040 \
    -v "`pwd`":/home/jovyan/work \
    jupyter/pyspark-notebook

```

- Se estiver no Windows estes comandos, utilize:

    - No Powershell: `docker run -it --rm -p 8888:8888 -p 4040:4040 -v ${PWD}:/home/jovyan/work jupyter/pyspark-notebook`

    - No Prompt de comando: `docker run -it --rm -p 8888:8888 -p 4040:4040 -v %cd%:/home/jovyan/work jupyter/pyspark-notebook`