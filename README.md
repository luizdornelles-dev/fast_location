# FastLocation 🚀

Aplicativo móvel desenvolvido como desafio para a disciplina de Desenvolvimento de Sistemas Móveis e Distribuídos (SENAI). O app permite a consulta de endereços a partir de CEPs, mantendo um histórico local e traçando rotas de entrega via integração com GPS.

## Funcionalidades
- 🔍 **Consulta de CEP:** Integração com a API pública ViaCEP.
- 💾 **Histórico de Buscas:** Armazenamento local offline utilizando o banco de dados Hive.
- 🗺️ **Traçar Rota:** Integração nativa para abrir a rota no aplicativo de mapas do dispositivo usando `map_launcher` e `geocoding`.
- ⚡ **Reatividade:** Gerenciamento de estado complexo utilizando MobX.
- 🏗️ **Arquitetura Modular:** Separação clara de responsabilidades (Pages, Stores, Services, Repositories e Components).

## Como executar o projeto

**Pré-requisitos:**
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
- Emulador Android/iOS configurado ou dispositivo físico conectado.

**Passo a passo:**
1. Clone este repositório.
2. Abra o terminal na pasta raiz do projeto.
3. Instale as dependências executando:
   ```bash
   flutter pub get
   ```
4. Gere os arquivos de estado do MobX executando:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Execute o aplicativo:
   ```bash
   flutter run
   ```