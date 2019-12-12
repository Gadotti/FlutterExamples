# FlutterExamples
Repositório para projetos simples e didáticos
> https://www.udemy.com/course/curso-completo-flutter-app-android-ios

# QuickStart
Guia para iniciar o ambiente de desenvolvimento em uma nova máquina:

1. Download flutter sdk https://flutter.dev/docs/get-started/install
2. Extrair em uma pasta, 'D:', por exemplo
3. Definir esta pasta no PATH do diretórios do sistema (pasta bin)

4. Download Java JDK https://www.oracle.com/technetwork/java/javase/downloads/index.html
5. Instalar e definir no PATH do sistema se nao for colocado automaticamente
	You must have the environment variable JAVA_HOME set and the java binary in your PATH.
	Default C:\Program Files\Java\jdk-13.0.1\

6. Instalar o Android SDK. Maneira mais fácil e garantida é instalar o Android studio mesmo.

7. Extensions para o VS Code:
    > Extensions > Dart
    > Extensions > Dart-import
    > Extensions > Flutter
    > Extensions > Flutter Widget Snippets

8. Comandos:
    > Console > flutter create helloword

9. Dicas
    > executar "flutter doctor" para ver o que não está funcionando

    > Pressionar 'r' no terminal para fazer o 'hot reload'

## Contador de pessoas
Realiza uma contagem através de um incrementador. Contém os primeiros conceitos de StateFull e desenho de telas:

![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/contadorpessoas/Print1.png "Contador de Pessoas")
![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/contadorpessoas/Print2.png "Contador de Pessoas")

## Calculadora IMC
Apresenta 2 campos de *inputs* para realizar o cálculo de IMC de uma pessoa. Apresenta conceitos de ações e ações em uma barra de ações.

![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/calculadoraimc/Print1.png "Calculadora IMC")

## Conversor de moedas
Obtém externamente, através de uma API, um Json com a cotação atual das moedas para realizar a conversão entre Reais, Dolar e Euro.

Será necessário cadastrar e um obter uma API Key através do serviço https://hgbrasil.com/status/finance

![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/conversormoedas/Print1.png "Conversos de moedas")

## Lista de Tarefas (TODO)
Obtém e grava através de um Json gravado no storage do celular uma lista de tarefas. Podem ser marcadas, excluídas deslizando-as para a direita e desfazer a operação através de snackbar.

![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/listatarefas/Print1.png "Conversos de moedas")

## Buscador de Gifs
Busca através do site Giphy.com uma lista de gifs para ser apresentado. É possível realizar buscas através de termos de pequisa, selecionar gifs e compartilhamento. Apresenta os conceitos de share, carregamento de imagem em FadeIn.

Será necessário cadastrar e obter uma API Key através do serviço https://developers.giphy.com/

![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/buscadorgifs/Print1.png "Buscador de Gifs")
![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/buscadorgifs/Print2.png "Buscador de Gifs")
