/// Modelo de dados para representar um Mangá no aplicativo.
///
/// Contém as informações essenciais para listagem, cards e detalhamento.
class Manga {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final double price;
  final double? oldPrice;
  final double? rating;
  final String? description;
  final List<String> genres;

  const Manga({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.price,
    this.oldPrice,
    this.rating,
    this.description,
    this.genres = const [],
  });

  /// Calcula a porcentagem de desconto quando há preço anterior.
  double? get discountPercent {
    if (oldPrice == null || oldPrice! <= price) return null;
    return ((oldPrice! - price) / oldPrice! * 100);
  }

  /// Verifica se o mangá está em promoção.
  bool get isOnSale => oldPrice != null && oldPrice! > price;
}
