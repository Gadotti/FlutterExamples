# FlutterTube

Projeto que imita o app do Youtube para apresentar conceitos importantes de programação que podem ser aplicados ao Flutter, como Bloc Pattern com Streams. Dessa forma é possível assinar listners que eliminam a possibilidade de classes do tipo Statefull.

## Premissas
* Necessário criar uma credencial de acesso com a API do Youtube para executar a aplicação. O código fonte não conterá esta Key, para executar será necessário obter uma nova Key e incluir na classe 'Api' do projeto.

## Funcionalidades

* Desenvolvimento de Scroll inifito. Ao final de cada 10 itens, mais 10 são requistados na listagem.
* Aplicação de Bloc Pattern + RxDart
* Aplicação de Dependecy Injection
* Integração com Youtube API do Google: https://console.developers.google.com/
* Utilização de SharedPreferences. Um repositorio basico e simples do device que pode ser utilizado para armazenar os favoritos do App, por exemplo.

## Prints

![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/fluttertube/print1.png "FlutterTube")
![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/fluttertube/print2.png "FlutterTube")
![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/fluttertube/print3.png "FlutterTube")
![alt text](https://github.com/Gadotti/FlutterExamples/blob/master/fluttertube/print4.png "FlutterTube")