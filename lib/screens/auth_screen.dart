import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/neon_button.dart';
import 'main_navigator.dart';

/// Tela de autenticação com alternância entre Login e Cadastro.
///
/// Utiliza [TabBar] para alternar entre os dois formulários.
/// O login fictício navega diretamente para o [MainNavigator].
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Controllers de Login
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  // Controllers de Cadastro
  final _signupNameController = TextEditingController();
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _obscureLoginPassword = true;
  bool _obscureSignupPassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _signupNameController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    super.dispose();
  }

  /// Simula autenticação e navega para a tela principal.
  Future<void> _handleAuth() async {
    setState(() => _isLoading = true);
    // Simula delay de rede
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainNavigator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 50),

              // ─── Logo / Título ────────────────────────────────────
              _buildHeader(),
              const SizedBox(height: 40),

              // ─── TabBar ───────────────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.cardGraphite,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: AppTheme.neonPink,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: AppTheme.textSecondary,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: 'Login'),
                    Tab(text: 'Cadastro'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // ─── Formulários ──────────────────────────────────────
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildLoginForm(),
                    _buildSignupForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Ícone estilizado
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppTheme.neonGradient,
            boxShadow: AppTheme.neonGlow(blurRadius: 24, opacity: 0.35),
          ),
          child: const Icon(
            Icons.auto_stories_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'MangaTracker',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
        ),
        const SizedBox(height: 6),
        Text(
          'Rastreie preços. Descubra ofertas.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // E-mail
          TextField(
            controller: _loginEmailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: AppTheme.textPrimary),
            decoration: const InputDecoration(
              hintText: 'E-mail',
              prefixIcon: Icon(Icons.email_outlined, color: AppTheme.textSecondary),
            ),
          ),
          const SizedBox(height: 16),

          // Senha
          TextField(
            controller: _loginPasswordController,
            obscureText: _obscureLoginPassword,
            style: const TextStyle(color: AppTheme.textPrimary),
            decoration: InputDecoration(
              hintText: 'Senha',
              prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.textSecondary),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureLoginPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppTheme.textSecondary,
                ),
                onPressed: () =>
                    setState(() => _obscureLoginPassword = !_obscureLoginPassword),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Esqueci a senha
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Esqueci minha senha',
                style: TextStyle(color: AppTheme.neonPink, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Botão Login
          NeonButton(
            label: 'ENTRAR',
            isLoading: _isLoading,
            icon: Icons.login_rounded,
            onPressed: _handleAuth,
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Nome
          TextField(
            controller: _signupNameController,
            style: const TextStyle(color: AppTheme.textPrimary),
            decoration: const InputDecoration(
              hintText: 'Nome completo',
              prefixIcon: Icon(Icons.person_outline, color: AppTheme.textSecondary),
            ),
          ),
          const SizedBox(height: 16),

          // E-mail
          TextField(
            controller: _signupEmailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: AppTheme.textPrimary),
            decoration: const InputDecoration(
              hintText: 'E-mail',
              prefixIcon: Icon(Icons.email_outlined, color: AppTheme.textSecondary),
            ),
          ),
          const SizedBox(height: 16),

          // Senha
          TextField(
            controller: _signupPasswordController,
            obscureText: _obscureSignupPassword,
            style: const TextStyle(color: AppTheme.textPrimary),
            decoration: InputDecoration(
              hintText: 'Senha',
              prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.textSecondary),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureSignupPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppTheme.textSecondary,
                ),
                onPressed: () => setState(
                    () => _obscureSignupPassword = !_obscureSignupPassword),
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Botão Cadastrar
          NeonButton(
            label: 'CRIAR CONTA',
            isLoading: _isLoading,
            icon: Icons.person_add_alt_1_rounded,
            onPressed: _handleAuth,
          ),
        ],
      ),
    );
  }
}
