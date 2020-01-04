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

## Comandos e dicas importantes

**Ver o que não está funcionando na configuração e instalação do ambiente:** 
> flutter doctor

**Criar um app inicial:** 
> flutter create helloword

**Criar um app para integração com FireBase:** 
> flutter create --org br.com.*seu nome.projeto* -a java -i objc --androidx *nome do projeto*

**Hot reload e restart:**
> Pressionar 'r' no terminal para fazer o 'hot reload'

> Pressionar SHIT+'r' no terminal para fazer o 'hot restart'

## Ferramentas e sites úteis
* FireBase: firebase.google.com/
* Rive: https://rive.app/
* Pexel: https://www.pexels.com/
* FlatIcon: https://www.flaticon.com/
* Material UI Colors: https://material-ui.com/pt/customization/color/
* Material Pallete: https://material.io/design/color/the-color-system.html#tools-for-picking-colors
* Material Design composição de cores: https://material.io/resources/color
   
## Erros e soluções

* Exceção ao subir o app relacionado ao multDex após adicionar o módulo do cloud firebase.    
**Solução:** No arquivo ./android/app/build.gradle, verifique se existe a propriedade *multiDexEnabled true*    
Fonte: https://developer.android.com/studio/build/multidex

    Dentro da **defaultConfig** tag

        applicationId "br.com.seunome.seuprojeto"        
        minSdkVersion 16
        targetSdkVersion 28
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
        multiDexEnabled true    
    