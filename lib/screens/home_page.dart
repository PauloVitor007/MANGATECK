import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/manga.dart';
import '../models/mock_data.dart';
import '../widgets/manga_card.dart';
import '../widgets/neon_button.dart';

/// Tela principal (Home) exibindo banner hero, lançamentos e quedas de preço.
///
/// Contém:
/// - AppBar com barra de pesquisa embutida
/// - Hero Banner com destaque de mangá popular
/// - Carrossel horizontal de lançamentos
/// - Carrossel horizontal de quedas de preço
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ─── AppBar com Pesquisa ──────────────────────────────────
          _buildSliverAppBar(context),

          // ─── Hero Banner ──────────────────────────────────────────
          SliverToBoxAdapter(child: _buildHeroBanner(context)),

          // ─── Seção: Lançamentos ───────────────────────────────────
          SliverToBoxAdapter(
            child: _buildSection(
              context,
              title: '🔥 Lançamentos',
              mangas: MockData.newReleases,
            ),
          ),

          // ─── Seção: Quedas de Preço ───────────────────────────────
          SliverToBoxAdapter(
            child: _buildSection(
              context,
              title: '💰 Quedas de Preço',
              mangas: MockData.priceDrops,
            ),
          ),

          // Espaçamento inferior
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: AppTheme.backgroundBlack,
      toolbarHeight: 70,
      title: Row(
        children: [
          // Logo
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: AppTheme.neonGradient,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppTheme.neonGlow(blurRadius: 10, opacity: 0.3),
            ),
            child: const Icon(Icons.auto_stories_rounded, size: 22, color: Colors.white),
          ),
          const SizedBox(width: 12),
          // Search bar
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: AppTheme.cardGraphite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.dividerColor.withValues(alpha: 0.5),
                ),
              ),
              child: const TextField(
                style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Buscar mangás...',
                  hintStyle: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: AppTheme.textSecondary, size: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_rounded, color: AppTheme.textPrimary),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    final hero = MockData.heroBanner;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.neonPink.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: AppTheme.neonGlow(blurRadius: 20, opacity: 0.15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagem de fundo
            Image.network(
              hero.coverUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: AppTheme.cardGraphite,
              ),
            ),
            // Gradiente escurecido na base
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
            // Gradiente lateral
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
            // Conteúdo
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.neonPink,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '⭐ DESTAQUE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hero.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hero.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 36,
                    width: 140,
                    child: NeonButton(
                      label: 'VER DETALHES',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Constrói uma seção com título + lista horizontal de [MangaCard].
  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Manga> mangas,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ver mais',
                  style: TextStyle(color: AppTheme.neonPink, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        // Lista horizontal
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: mangas.length,
            itemBuilder: (context, index) {
              return MangaCard(manga: mangas[index]);
            },
          ),
        ),
      ],
    );
  }
}
