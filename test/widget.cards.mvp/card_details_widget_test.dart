import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_flutter/cards/page/cards_details_page.dart';
import 'package:mvp_flutter/cards/provider/card_layout_vo.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/core/request_mock.dart';
import 'package:network_image_mock/network_image_mock.dart';

main() {
  group("Card Details Widget Test", () {
    final mock = MockClientAdapter();
    // setUp(() {
    //   mock
    //     ..addResponse(MockResponse(
    //       "/cards/1029384756id",
    //       body: '''
    //       {
    //         "limit": "1.000,00",
    //         "blockStatus": true
    //       }
    //   ''',
    //     ));
    // });

    testWidgets('check success', (WidgetTester tester) async {
      mock
        ..addResponse(MockResponse(
          "/cards/1029384756id",
          body: '''
          {
            "limit": "1.000,00",
            "blockStatus": true
          }
      ''',
        ));

      CardResponseVO responseCard = CardResponseVO(
        "1029384756id",
        "Detalhes",
        "9371",
        "Descrição",
        "",
        CardLayoutVO("#ff000000", "#ff000000"),
      );

      mockNetworkImagesFor(() async {
        await tester.pumpWidget(MaterialApp(
          home: CardsDetailsPage(
            card: responseCard,
            client: mock.dio,
          ),
        ));

        expect(find.text("Detalhes"), findsOneWidget);

        await tester.pumpAndSettle();
        expect(find.text("**** **** **** 9371"), findsOneWidget);
        expect(find.text("1.000,00"), findsOneWidget);
      });
    });
  });
}
