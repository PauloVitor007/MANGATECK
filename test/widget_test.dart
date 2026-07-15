import 'package:flutter_test/flutter_test.dart';

import 'package:manga_tracker/main.dart';

void main() {
  testWidgets('App loads AuthScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MangaTrackerApp());

    // Verifica que a tela de autenticação carrega com o título correto
    expect(find.text('MangaTracker'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Cadastro'), findsOneWidget);
  });
}
