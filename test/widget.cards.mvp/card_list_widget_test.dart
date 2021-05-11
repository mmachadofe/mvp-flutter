import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_flutter/cards/page/cards_list_page.dart';
import 'package:mvp_flutter/core/request_mock.dart';
import 'package:network_image_mock/network_image_mock.dart';

main() {
  group("Card List Widget Test", () {
    final mock = MockClientAdapter();

    testWidgets("check success", (WidgetTester tester) async {
      mock
        ..addResponse(MockResponse(
          "/cards",
          body: '''
          {
            "cards": [
                {
                    "id": "1",
                    "title": "Cartão Pré-Pago",
                    "description": "Ativo",
                    "lastDigits": "9999",
                    "cardBrand": "https://",
                    "layoutAttrs": {
                        "bgColor": "#FFCC32",
                        "titleColor": "#000000"
                    }
                }
            ]
        }
      ''',
        ));

      mockNetworkImagesFor(() async {
        await tester.pumpWidget(MaterialApp(
          home: CardListPage(title: "Title", client: mock.dio),
        ));

        final RenderBox box = tester.renderObject(find.byType(BottomNavigationBar));
        expect(box.size.height, kBottomNavigationBarHeight);

        await tester.pumpAndSettle();
        expect(find.text("9999"), findsOneWidget);
      });
    });
  });
}
