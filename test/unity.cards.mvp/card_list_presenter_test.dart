import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvp_flutter/cards/contract/card_list_contract.dart';
import 'package:mvp_flutter/cards/presenter/card_list_presenter.dart';
import 'package:mvp_flutter/cards/provider/card_layout_vo.dart';
import 'package:mvp_flutter/cards/provider/card_list_response.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/cards/repository/card_list_api.dart';

class MockView extends Mock implements CardListView {}

class MockApi extends Mock implements CardListApi {}

main() {
  group("Card List Presenter Test", () {
    final view = MockView();
    final api = MockApi();

    final presenter = CardListPresenterImpl(view, api);

    test("check getCardList success", () async {
      when(api.getCardsList())
          .thenAnswer((_) => Future.value(CardListResponseVO([
                CardResponseVO("1", "Cartão Pré-Pago", "Ativo", "9999",
                    "https://", CardLayoutVO("#FFCC32", "#000000"))
              ])));

      presenter.getCardList();

      await untilCalled(
        view.loadListSuccess(any),
      );

      verifyInOrder([
        view.listLoading(false),
        view.loadListSuccess(any),
        view.listLoading(true),
      ]);
    });

    test("check getCardList with error", () async {
      when(api.getCardsList()).thenAnswer((_) => Future.error(Object()));

      presenter.getCardList();

      await untilCalled(
        view.loadListError(),
      );

      verifyInOrder([
        view.listLoading(false),
        view.loadListError(),
        view.listLoading(true),
      ]);
    });
  });
}
