import '../models/manga.dart';

/// Dados mockados para desenvolvimento e testes.
///
/// Substitui requisições de API enquanto o backend e web scraping
/// não estão implementados.
class MockData {
  MockData._();

  // ─── Mangás em Destaque / Lançamentos ────────────────────────────
  static const List<Manga> newReleases = [
    Manga(
      id: '1',
      title: 'Jujutsu Kaisen',
      author: 'Gege Akutami',
      coverUrl: 'https://m.media-amazon.com/images/I/81TmHlBCsNL._AC_UF894,1000_QL80_.jpg',
      price: 29.90,
      rating: 4.8,
      description: 'Yuji Itadori é um estudante do ensino médio com habilidades físicas excepcionais.',
      genres: ['Ação', 'Sobrenatural', 'Shounen'],
    ),
    Manga(
      id: '2',
      title: 'Chainsaw Man',
      author: 'Tatsuki Fujimoto',
      coverUrl: 'https://m.media-amazon.com/images/I/71lqMxCjFbL._AC_UF894,1000_QL80_.jpg',
      price: 27.90,
      rating: 4.7,
      description: 'Denji é um jovem pobre que se une a um demônio motosserra.',
      genres: ['Ação', 'Horror', 'Shounen'],
    ),
    Manga(
      id: '3',
      title: 'Spy x Family',
      author: 'Tatsuya Endo',
      coverUrl: 'https://m.media-amazon.com/images/I/81bXpHKOwnL._AC_UF894,1000_QL80_.jpg',
      price: 24.90,
      rating: 4.9,
      description: 'Um espião precisa montar uma família falsa para se infiltrar em uma escola de elite.',
      genres: ['Comédia', 'Ação', 'Slice of Life'],
    ),
    Manga(
      id: '4',
      title: 'One Piece',
      author: 'Eiichiro Oda',
      coverUrl: 'https://m.media-amazon.com/images/I/61fep8FpYxL._AC_UF894,1000_QL80_.jpg',
      price: 32.90,
      rating: 4.9,
      description: 'Monkey D. Luffy quer se tornar o Rei dos Piratas!',
      genres: ['Aventura', 'Ação', 'Shounen'],
    ),
    Manga(
      id: '5',
      title: 'Demon Slayer',
      author: 'Koyoharu Gotouge',
      coverUrl: 'https://m.media-amazon.com/images/I/81dXwMz2GyL._AC_UF894,1000_QL80_.jpg',
      price: 26.90,
      rating: 4.8,
      description: 'Tanjiro busca uma cura para sua irmã transformada em demônio.',
      genres: ['Ação', 'Sobrenatural', 'Shounen'],
    ),
  ];

  // ─── Mangás com Queda de Preço ───────────────────────────────────
  static const List<Manga> priceDrops = [
    Manga(
      id: '6',
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      coverUrl: 'https://m.media-amazon.com/images/I/91M9VaZWxOL._AC_UF894,1000_QL80_.jpg',
      price: 19.90,
      oldPrice: 34.90,
      rating: 4.7,
      genres: ['Ação', 'Drama', 'Shounen'],
    ),
    Manga(
      id: '7',
      title: 'My Hero Academia',
      author: 'Kohei Horikoshi',
      coverUrl: 'https://m.media-amazon.com/images/I/81a3jUPfmzL._AC_UF894,1000_QL80_.jpg',
      price: 17.90,
      oldPrice: 29.90,
      rating: 4.6,
      genres: ['Ação', 'Super-heróis', 'Shounen'],
    ),
    Manga(
      id: '8',
      title: 'Tokyo Ghoul',
      author: 'Sui Ishida',
      coverUrl: 'https://m.media-amazon.com/images/I/81chn+-QNYL._AC_UF894,1000_QL80_.jpg',
      price: 15.90,
      oldPrice: 27.90,
      rating: 4.5,
      genres: ['Horror', 'Drama', 'Seinen'],
    ),
    Manga(
      id: '9',
      title: 'Death Note',
      author: 'Tsugumi Ohba',
      coverUrl: 'https://m.media-amazon.com/images/I/81bsw6fnUiL._AC_UF894,1000_QL80_.jpg',
      price: 14.90,
      oldPrice: 24.90,
      rating: 4.9,
      genres: ['Suspense', 'Mistério', 'Shounen'],
    ),
    Manga(
      id: '10',
      title: 'Naruto',
      author: 'Masashi Kishimoto',
      coverUrl: 'https://m.media-amazon.com/images/I/91FPoNOEPUL._AC_UF894,1000_QL80_.jpg',
      price: 16.90,
      oldPrice: 28.90,
      rating: 4.7,
      genres: ['Ação', 'Aventura', 'Shounen'],
    ),
  ];

  // ─── Mangás na Wishlist / Alertas ────────────────────────────────
  static const List<Manga> wishlist = [
    Manga(
      id: '1',
      title: 'Jujutsu Kaisen',
      author: 'Gege Akutami',
      coverUrl: 'https://m.media-amazon.com/images/I/81TmHlBCsNL._AC_UF894,1000_QL80_.jpg',
      price: 29.90,
      rating: 4.8,
      genres: ['Ação', 'Sobrenatural', 'Shounen'],
    ),
    Manga(
      id: '6',
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      coverUrl: 'https://m.media-amazon.com/images/I/91M9VaZWxOL._AC_UF894,1000_QL80_.jpg',
      price: 19.90,
      oldPrice: 34.90,
      rating: 4.7,
      genres: ['Ação', 'Drama', 'Shounen'],
    ),
    Manga(
      id: '9',
      title: 'Death Note',
      author: 'Tsugumi Ohba',
      coverUrl: 'https://m.media-amazon.com/images/I/81bsw6fnUiL._AC_UF894,1000_QL80_.jpg',
      price: 14.90,
      oldPrice: 24.90,
      rating: 4.9,
      genres: ['Suspense', 'Mistério', 'Shounen'],
    ),
  ];

  // ─── Mangá em Destaque (Hero Banner) ──────────────────────────────
  static const Manga heroBanner = Manga(
    id: '4',
    title: 'One Piece',
    author: 'Eiichiro Oda',
    coverUrl: 'https://m.media-amazon.com/images/I/61fep8FpYxL._AC_UF894,1000_QL80_.jpg',
    price: 32.90,
    rating: 4.9,
    description:
        'O mangá mais vendido da história! Acompanhe Luffy e os Chapéus de Palha em busca do One Piece.',
    genres: ['Aventura', 'Ação', 'Shounen'],
  );
}
