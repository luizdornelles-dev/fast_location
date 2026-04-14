FastLocation 

O FastLocation é um aplicativo móvel desenvolvido em Flutter e Dart para facilitar a consulta rápida de endereços através do CEP. Ele também mantém um histórico de buscas e permite traçar a rota até o local utilizando o GPS do dispositivo.

Este projeto foi desenvolvido como desafio da disciplina de Desenvolvimento de Sistemas Móveis e Distribuídos (SENAI).

Tecnologias Utilizadas

Este projeto foi construído utilizando as seguintes tecnologias e pacotes:
- Flutter & Dart: Framework principal para desenvolvimento mobile.
- MobX (`mobx`, `flutter_mobx`): Para o gerenciamento de estado reativo.
- Hive (`hive`, `hive_flutter`): Banco de dados local rápido e leve para salvar o histórico offline.
- Dio (`dio`): Cliente HTTP para fazer a comunicação com a API do ViaCEP.
- Map Launcher & Geocoding: Integração nativa para abrir o mapa do celular e converter endereços em coordenadas.

Instruções Detalhadas de Execução

Se você deseja rodar este projeto na sua máquina, siga o passo a passo detalhado abaixo:

Passo 1: Pré-requisitos
Antes de começar, certifique-se de que sua máquina possui as seguintes ferramentas instaladas:
1. [Flutter SDK](https://docs.flutter.dev/get-started/install): Instalado e configurado nas variáveis de ambiente.
2. Git: Para clonar o repositório.
3. Uma IDE (como VS Code ou Android Studio).
4. Dispositivo para teste (Emulador ou Físico):
   - Para emulador Android: É necessário instalar o Android Studio. Ele instala automaticamente as ferramentas do Android e permite criar um dispositivo virtual (Emulador).
   - Para simulador iOS (iPhone): É necessário utilizar um computador macOS e instalar o Xcode (disponível na Mac App Store). Você também precisará do CocoaPods instalado no seu Mac (gerenciador de dependências da Apple).
   - Para Smartphone Físico: Deve estar conectado via cabo USB. No Android, ative a "Depuração USB" nas opções de desenvolvedor. No iPhone, aceite a mensagem "Confiar neste computador".

Passo 2: Clonar o Repositório
Abra o terminal do seu computador e digite o seguinte comando para baixar o código para a sua máquina:
```bash
git clone [https://github.com/luizdornelles-dev/fast_location.git](https://github.com/luizdornelles-dev/fast_location.git)
```
Após baixar, entre na pasta do projeto:
```bash
cd fast_location
```

Passo 3: Baixar as Dependências do Projeto
Com o terminal aberto dentro da pasta `fast_location`, execute o comando abaixo. Ele fará o download de todas as bibliotecas de terceiros (como MobX, Hive, Dio, etc.) que o aplicativo precisa para funcionar:
```bash
flutter pub get
```

Passo 4: Configurar o iOS (Apenas para usuários de Mac)
Se você for rodar o aplicativo no simulador do iPhone ou em um iPhone físico, é obrigatório instalar as dependências nativas da Apple. No terminal, execute os comandos em sequência:
```bash
cd ios
pod install
cd ..
```
(Este passo pode ser ignorado se você for rodar apenas no Android).

Passo 5: Geração Automática de Código (Importante!)
Este projeto utiliza ferramentas de geração de código para o banco de dados (Hive) e para a reatividade da tela (MobX). Para que o aplicativo funcione sem erros, é obrigatório rodar o comando abaixo para gerar esses arquivos automaticamente:
```bash
dart run build_runner build --delete-conflicting-outputs
```
(Aguarde alguns segundos até o terminal avisar que o processo foi concluído com sucesso "Succeeded").

Passo 6: Rodar o Aplicativo
Com o seu emulador aberto (ou celular conectado), certifique-se de que o dispositivo foi reconhecido rodando `flutter devices`. 

Se estiver tudo certo, inicie o aplicativo com o comando:
```bash
flutter run
```
(Se preferir, você também pode abrir a pasta do projeto no VS Code e apertar `F5` para rodar o projeto em modo Debug).

Funcionalidades
- Digitar um CEP e obter o endereço completo em formato de Cartão.
- Validação automática informando caso o CEP seja inválido.
- O aplicativo salva automaticamente as buscas válidas. É possível visualizar os CEPs anteriores clicando no ícone de "Histórico" no canto superior direito.
- Ao encontrar um endereço, clicar em "VER NO MAPA" abrirá o aplicativo de GPS nativo do seu celular traçando a rota para o destino.
