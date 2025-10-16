# Ambiente isolado para compilar projetos LaTeX com Tectonic (via Docker)

Este repositório fornece um ambiente pré-configurado para compilar projetos LaTeX usando o **Tectonic**, dentro de um container Docker.


## Requisitos

Antes de começar, verifique se você tem os seguintes softwares instalados:

* [**Visual Studio Code**](https://code.visualstudio.com/)
* [**Docker Desktop**](https://www.docker.com/)
* Extensão do VS Code: [**Dev Containers**](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)


## Adicionando seu projeto LaTeX

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/seu-repo.git
   cd seu-repo
   ```

2. Coloque seu projeto LaTeX (por exemplo, o exportado do Overleaf) na raiz do repositório clonado.
   A estrutura deve ser semelhante a:

   ```
   .
   ├── main.tex
   ├── sections/
   ├── images/
   └── references.bib
   ```



## Iniciando o ambiente Docker

No VS Code:

1. Pressione `F1`
2. Procure e selecione **“Dev Containers: Rebuild and Reopen in Container”**

O VS Code reconstruirá e abrirá o ambiente dentro do container Linux configurado.

## Compilando seu projeto

Com o container aberto, abra o **terminal integrado** do VS Code e execute:

```bash
tectonic caminho/para/seu/main.tex
```

Por exemplo:

```bash
tectonic main.tex
```

O arquivo PDF será gerado automaticamente no mesmo diretório do arquivo `.tex`.



## Útil

Se você usa a estrutura padrão do **Overleaf**, basta copiar tudo para a raiz deste projeto — o ambiente já está configurado para reconhecer dependências e compilar corretamente.


## Créditos / Referências

Este projeto utiliza o **Tectonic**, um compilador moderno de LaTeX.
Repositório oficial: [tectonic-typesetting/tectonic](https://github.com/tectonic-typesetting/tectonic) ([GitHub][1])

