import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvp_flutter/cards/contract/card_details_contract.dart';
import 'package:mvp_flutter/cards/presenter/card_details_presenter.dart';
import 'package:mvp_flutter/cards/provider/card_detail_vo.dart';
import 'package:mvp_flutter/cards/repository/card_details_api.dart';

class MockView extends Mock implements CardDetailsView {
} //implements é o mock de interface (semelhante ao relaxed usado no nativo com o mockk)

class MockApi extends Mock implements CardDetailsApi {}

main() {
  group("Card Details Presenter Test", () {//a classe em si é multi classe e o teste em si é definido no escopo do main
    final view = MockView();
    final api = MockApi();

    final presenter = CardDetailsPresenterImpl(view, api);

    // setUp(() {
    //   when(api.getDetailCard(any)).thenAnswer(
    //       (_) => Future.value(CardDetailVO("limit", false)));
    // });

    test("check getDetailCard success", () async {
      when(api.getDetailCard(any))
          .thenAnswer((_) => Future.value(CardDetailVO("limit", false)));

      presenter.getDetailCard("any");

      await untilCalled(
        view.showDetailsSuccess("limit", false),
      );

      verifyInOrder([
        view.showDetailsSuccess("limit", false),
      ]);
    });

    test("check getDetailCard with error", () async {
      when(api.getDetailCard(any)).thenAnswer((_) => Future.error(Object()));

      presenter.getDetailCard("any");

      await untilCalled(
        view.showDetailsError(),
      );

      verifyInOrder([
        view.showDetailsError(),
      ]);
    });
  });
}
