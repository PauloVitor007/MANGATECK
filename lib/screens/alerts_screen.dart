import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/mock_data.dart';

/// Tela de Alertas / Wishlist.
///
/// Exibe uma lista vertical dos mangás monitorados pelo usuário,
/// com informações de preço e status de alerta.
class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = MockData.wishlist;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Alertas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: wishlist.isEmpty
          ? _buildEmptyState(context)
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final manga = wishlist[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: AppTheme.cardGraphite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: manga.isOnSale
                          ? AppTheme.neonPink.withValues(alpha: 0.4)
                          : AppTheme.dividerColor.withValues(alpha: 0.5),
                      width: manga.isOnSale ? 1.5 : 1,
                    ),
                    boxShadow: manga.isOnSale
                        ? AppTheme.neonGlow(blurRadius: 10, opacity: 0.12)
                        : null,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          manga.coverUrl,
                          width: 55,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            width: 55,
                            height: 80,
                            color: AppTheme.surfaceDark,
                            child: const Icon(
                              Icons.image_not_supported_outlined,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        manga.title,
                        style: textTheme.titleSmall?.copyWith(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            manga.author,
                            style: textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'R\$ ${manga.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: manga.isOnSale
                                      ? AppTheme.neonPink
                                      : AppTheme.textPrimary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              if (manga.isOnSale) ...[
                                const SizedBox(width: 8),
                                Text(
                                  'R\$ ${manga.oldPrice!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppTheme.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.neonPink.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '-${manga.discountPercent!.toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                      color: AppTheme.neonPink,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            manga.isOnSale
                                ? Icons.trending_down_rounded
                                : Icons.notifications_active_outlined,
                            color: manga.isOnSale
                                ? AppTheme.neonPink
                                : AppTheme.textSecondary,
                            size: 22,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            manga.isOnSale ? 'Baixou!' : 'Ativo',
                            style: TextStyle(
                              color: manga.isOnSale
                                  ? AppTheme.neonPink
                                  : AppTheme.textSecondary,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 64,
            color: AppTheme.textSecondary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Nenhum alerta ativo',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Adicione mangás à sua wishlist\npara monitorar preços.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary.withValues(alpha: 0.7),
                ),
          ),
        ],
      ),
    );
  }
}
