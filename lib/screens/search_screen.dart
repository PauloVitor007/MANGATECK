import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Tela de placeholder para Busca.
///
/// Será expandida futuramente com integração de busca via web scraping.
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ─── Barra de pesquisa ─────────────────────────────────
            Container(
              decoration: BoxDecoration(
                color: AppTheme.cardGraphite,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppTheme.dividerColor.withValues(alpha: 0.5),
                ),
              ),
              child: const TextField(
                style: TextStyle(color: AppTheme.textPrimary),
                decoration: InputDecoration(
                  hintText: 'Título, autor ou gênero...',
                  prefixIcon: Icon(Icons.search, color: AppTheme.textSecondary),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // ─── Gêneros populares ─────────────────────────────────
            _buildSectionTitle(context, 'Gêneros Populares'),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildGenreChip('Shounen'),
                _buildGenreChip('Seinen'),
                _buildGenreChip('Shoujo'),
                _buildGenreChip('Ação'),
                _buildGenreChip('Romance'),
                _buildGenreChip('Comédia'),
                _buildGenreChip('Horror'),
                _buildGenreChip('Aventura'),
                _buildGenreChip('Slice of Life'),
                _buildGenreChip('Fantasia'),
              ],
            ),
            const SizedBox(height: 32),

            // ─── Estado vazio ──────────────────────────────────────
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.manage_search_rounded,
                      size: 64,
                      color: AppTheme.textSecondary.withValues(alpha: 0.4),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Pesquise seus mangás favoritos',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary,
                          ),
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildGenreChip(String label) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.dividerColor.withValues(alpha: 0.6),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
