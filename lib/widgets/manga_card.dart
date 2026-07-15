import 'package:flutter/material.dart';
import '../models/manga.dart';
import '../theme/app_theme.dart';

/// Card vertical para exibição de mangá em listas horizontais.
///
/// Mostra a capa do mangá, título, preço atual e, opcionalmente,
/// o preço antigo riscado com badge de desconto.
class MangaCard extends StatelessWidget {
  final Manga manga;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const MangaCard({
    super.key,
    required this.manga,
    this.onTap,
    this.width = 150,
    this.height = 280,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          color: AppTheme.cardGraphite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.dividerColor.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Capa do Mangá ────────────────────────────────────
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      manga.coverUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        color: AppTheme.surfaceDark,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppTheme.textSecondary,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Badge de desconto
                  if (manga.isOnSale)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.neonPink,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: AppTheme.neonGlow(
                            blurRadius: 8,
                            opacity: 0.4,
                          ),
                        ),
                        child: Text(
                          '-${manga.discountPercent!.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // ─── Informações ──────────────────────────────────────
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título
                    Text(
                      manga.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Autor
                    Text(
                      manga.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                    const Spacer(),
                    // Preços
                    Row(
                      children: [
                        Text(
                          'R\$ ${manga.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: manga.isOnSale
                                ? AppTheme.neonPink
                                : AppTheme.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (manga.isOnSale) ...[
                          const SizedBox(width: 6),
                          Text(
                            'R\$ ${manga.oldPrice!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
