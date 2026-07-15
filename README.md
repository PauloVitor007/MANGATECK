# MangaTracker

O MangaTracker é um aplicativo focado no rastreamento de precos e e-commerce de mangas. Este projeto foi desenvolvido com foco em componentizacao, padroes de arquitetura limpos e uma estetica premium baseada em Dark Mode. 

## Sobre o Projeto

O objetivo principal do MangaTracker e oferecer uma interface fluida para que os usuarios possam visualizar lancamentos, gerenciar sua lista de desejos (wishlist) e receber alertas quando houver queda de precos em suas obras favoritas. No momento, o aplicativo conta com dados simulados para estruturacao do frontend, com a arquitetura preparada para integracao futura de APIs e web scraping.

## Principais Funcionalidades

- Autenticacao: Fluxos de login e cadastro integrados na mesma tela atraves de abas.
- Dashboard Principal (Home): Destaque principal rotativo (Hero Banner) e carrosseis independentes para ultimos lancamentos e promocoes.
- Sistema de Alertas: Gerenciamento da lista de desejos, onde o usuario e notificado sobre descontos nos mangas monitorados, exibindo visualmente a queda de preco.
- Perfil do Usuario: Exibicao de estatisticas de uso, historico e opcoes de configuracao como toggle de tema.
- Navegacao Otimizada: Utilizacao de IndexedStack com BottomNavigationBar para preservar o estado das telas durante a navegacao do usuario.

## Tecnologias e Bibliotecas

O projeto foi construído utilizando Flutter e a linguagem Dart. Algumas dependencias notaveis incluem:
- flutter/material: Componentes base de interface.
- google_fonts: Utilizacao da fonte Poppins para uma tipografia moderna.
- carousel_slider: Implementacao das listas horizontais interativas na tela inicial.
- provider: Base estabelecida para o gerenciamento de estado.

## Padroes de Interface (UI/UX)

A interface foi desenhada estritamente em Dark Mode.
- Fundo: Preto solido (#000000)
- Superficies e Cards: Cinza grafite escuro (#121212)
- Cores de Destaque: Rosa Neon (#FF1493) com efeitos de brilho (glow) animados em botoes e marcadores.

## Como Executar o Projeto

1. Certifique-se de ter o Flutter SDK (versao 3.0 ou superior) instalado e configurado em seu ambiente.
2. Clone este repositorio em sua maquina local.
3. No diretorio raiz do projeto, execute o comando para instalar as dependencias:
   flutter pub get
4. Inicie o aplicativo em um emulador ou dispositivo conectado executando:
   flutter run

Para executar a versao web localmente:
   flutter run -d chrome

## Estrutura de Diretorios

- lib/models: Contem as estruturas de dados e a classe de mock_data.
- lib/screens: Todas as telas do aplicativo (auth, home, alerts, search, profile, navigator).
- lib/theme: Centralizacao das definicoes de cores, fontes e estilos (app_theme.dart).
- lib/widgets: Componentes reutilizaveis, como o botao neon e o card de manga.
