# Megadados Ciência da Computação

Bem-vindo ao repositório da disciplina **Megadados**!

Este espaço contém os materiais, códigos e instruções para o acompanhamento e desenvolvimento dos projetos da disciplina.

---

## 📥 Como clonar o repositório

Para clonar este repositório em sua máquina local, execute o seguinte comando no terminal:

```
git clone https://github.com/Insper/md-bcc.git
cd md-bcc
```


## Estrutura do Repositório

```
md-bcc/
├── aulas/             # Material das aulas, notebooks e slides
├── projetos/          # Enunciados e arquivos base dos projetos
```

## 📦 Ambiente de Desenvolvimento

### 🐍 Criando um Ambiente Virtual com Conda

Instale o [Anaconda ou Miniconda](https://www.anaconda.com/download) (caso ainda não tenha).

Crie o ambiente virtual:

```
conda create -n megadados python=3.10
```

Ative o ambiente:

```
conda activate megadados
```

Instale as dependências:

```
python -m pip install -r requirements.txt
```

### 💻 Configurando Ambiente Virtual com Python (venv)

Crie um ambiente virtual:

```
python -m venv venv
```

Ative o ambiente:

```
# No Windows
venv\Scripts\activate

# No Linux/MacOS
source venv/bin/activate
```

Instale as dependências:

```
python -m pip install -r requirements.txt
```

## ✅ Critérios de Aprovação

Os critérios de aprovação estão disponíveis nos slides da [**aula 01**](aulas/01-intro/aula_01_bcc.pdf).

## 🚀 Contribuições

- Até 2022: [Fábio Ayres](https://github.com/FabioAyresInsper) criou o material da disciplina (ementa, slides, notebooks, etc.). Pensa em um trabalho difícil, nosso eterno agradecimento!
- 2023-atualmente: [Maciel Vidal](https://github.com/macielcalebe) criou algumas aulas adicionais e uma ferramenta ([Insper Autograding](https://github.com/macielcalebe/insperautograding) e API REST) para suportar Autograding nos Jupyter Notebooks do curso.
- 2023/2: [Marcio Stabile](https://github.com/mfstabile) trabalhou com o Maciel na Disciplina. Fez autograding de algumas aulas e implementou autograding para Spark.