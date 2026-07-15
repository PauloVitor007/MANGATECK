import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/neon_button.dart';

/// Tela de Perfil do Usuário.
///
/// Exibe informações do perfil mockado, estatísticas e opções de configuração.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Column(
          children: [
            // ─── Avatar ────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.neonGradient,
                boxShadow: AppTheme.neonGlow(blurRadius: 18, opacity: 0.3),
              ),
              child: const CircleAvatar(
                radius: 48,
                backgroundColor: AppTheme.cardGraphite,
                child: Icon(
                  Icons.person,
                  size: 48,
                  color: AppTheme.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              'Otaku User',
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              'otaku@mangatracker.com',
              style: textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 28),

            // ─── Estatísticas ──────────────────────────────────────
            Row(
              children: [
                _buildStatCard(context, '12', 'Monitorados'),
                const SizedBox(width: 12),
                _buildStatCard(context, '5', 'Alertas'),
                const SizedBox(width: 12),
                _buildStatCard(context, '3', 'Comprados'),
              ],
            ),
            const SizedBox(height: 28),

            // ─── Opções do Menu ────────────────────────────────────
            _buildMenuItem(
              icon: Icons.history_rounded,
              label: 'Histórico de Preços',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.bookmark_outline_rounded,
              label: 'Favoritos',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.notifications_outlined,
              label: 'Configurar Alertas',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.dark_mode_outlined,
              label: 'Tema Escuro',
              trailing: Switch(
                value: true,
                onChanged: (_) {},
                activeThumbColor: AppTheme.neonPink,
              ),
            ),
            _buildMenuItem(
              icon: Icons.info_outline_rounded,
              label: 'Sobre o App',
              onTap: () {},
            ),
            const SizedBox(height: 28),

            // ─── Logout ────────────────────────────────────────────
            NeonButton(
              label: 'SAIR DA CONTA',
              isOutlined: true,
              icon: Icons.logout_rounded,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.cardGraphite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppTheme.dividerColor.withValues(alpha: 0.5),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.neonPink,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.cardGraphite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.dividerColor.withValues(alpha: 0.3),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: Icon(icon, color: AppTheme.textSecondary),
          title: Text(
            label,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: trailing ??
              const Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.textSecondary,
              ),
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
