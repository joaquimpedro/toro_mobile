# Toro Mobile

Aplicativo Toro para dispositivos móveis

## Requisitos


- [Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio ou VSCode
- Android SDK, API lvl 30
- Dispositivo Android conectado no ADB ou um emulador

## Execução
_Não foi criado build._
Deve ser executado pelo Android Studio, VS Code ou CLI.

##### CLI
Execute ``flutter doctor`` pra verificar sua instalação.
Execute ``flutter run -d deviceID`` onde o _deviceId_ é id do dispotivo, seja web, celular ou emulador.

### Dependências utilizadas

##### Projeto
  - [Dio](https://pub.dev/packages/dio)
    _Utilizado pra fazer requisições HTTP_
  - [flutter_simple_dependency_injection](https://pub.dev/packages/flutter_simple_dependency_injection)
    Utilizado pra fazer a injeção de dependência
  - [NumberPicker](https://pub.dev/packages/numberpicker)
    Componente de seleção numerica em sppiner.
##### Teste
  - [Mockito](https://pub.dev/packages/mockito)
    _Utilizado nos testes_
  - [build_runner]()
    _Utilizado pra gerar arquivos de Mock para entidades mockadas_