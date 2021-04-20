import 'package:mvp_flutter/contract/card_list_contract.dart';
import 'package:mvp_flutter/page/cards_list_page.dart';
import 'package:mvp_flutter/provider/card_vo.dart';

class CardListPresenterImpl implements CardListPresenter {

  final CardListView _view;

  CardListPresenterImpl(this._view);

  @override
  void getCardList() {
    // faça algo aqui dentro para gerar os cartões
    final cards = [CardVO("ZZZZZZZ", "5555", "Em análise"), CardVO("Cartão B", "2222", "Em análise"), CardVO("Cartão C", "3333", "Em análise"), CardVO("Cartão D", "4444", "Em análise")];
    _view.loadListSuccess(cards);
  }

  @override
  void selectCard(String number) {

  }
}