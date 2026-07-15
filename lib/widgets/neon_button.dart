import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Botão customizado com estética neon rosa.
///
/// Possui brilho (glow) sutil ao redor e pode operar em modo outlined.
/// Aceita [label] para o texto, [onPressed] para ação, [isLoading]
/// para exibir indicador de carregamento e [isOutlined] para variante outline.
class NeonButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;
  final double? width;

  const NeonButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.width,
  });

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _glowAnimation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: widget.isOutlined
                ? null
                : [
                    BoxShadow(
                      color: AppTheme.neonPink
                          .withValues(alpha: _glowAnimation.value),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: widget.isOutlined
              ? _buildOutlinedButton()
              : _buildFilledButton(),
        );
      },
    );
  }

  Widget _buildFilledButton() {
    return ElevatedButton(
      onPressed: widget.isLoading ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.neonPink,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppTheme.neonPink.withValues(alpha: 0.5),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 0,
      ),
      child: _buildContent(),
    );
  }

  Widget _buildOutlinedButton() {
    return OutlinedButton(
      onPressed: widget.isLoading ? null : widget.onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.neonPink,
        side: const BorderSide(color: AppTheme.neonPink, width: 1.5),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (widget.isLoading) {
      return const SizedBox(
        height: 22,
        width: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    if (widget.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 20),
          const SizedBox(width: 10),
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      );
    }

    return Text(
      widget.label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }
}
