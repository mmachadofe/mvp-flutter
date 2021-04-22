import 'package:mvp_flutter/contract/card_list_contract.dart';
import 'package:mvp_flutter/page/cards_list_page.dart';
import 'package:mvp_flutter/provider/card_layout.dart';
import 'package:mvp_flutter/provider/card_vo.dart';

class CardListPresenterImpl implements CardListPresenter {

  final CardListView _view;

  CardListPresenterImpl(this._view);

  @override
  void getCardList() {
    // faça algo aqui dentro para gerar os cartões
    final colorYellow = "#FFCC32";
    final colorBlack = "#000000";
    final colorGray = "#626567";
    final colorWhite = "#FFFFFF";

    final cards = [
      CardVO("Cartão A", "5555", "Em análise", "https://s3.amazonaws.com/ps-mib-qa/cdn/android/xxxhdpi/mastercard.png", CardLayout(this.colorHelper(colorYellow), this.colorHelper(colorBlack))),
      CardVO("Cartão B", "2222", "Em análise","https://s3.amazonaws.com/ps-mib-qa/cdn/android/xxxhdpi/mastercard.png", CardLayout(this.colorHelper(colorYellow), this.colorHelper(colorBlack))),
      CardVO("Cartão C", "3333", "Cancelado","https://s3.amazonaws.com/ps-mib-qa/cdn/android/xxxhdpi/visa.png", CardLayout(this.colorHelper(colorGray), this.colorHelper(colorWhite))),
      CardVO("Cartão D", "4444", "Em análise", "https://s3.amazonaws.com/ps-mib-qa/cdn/android/xxxhdpi/mastercard.png", CardLayout(this.colorHelper(colorYellow), this.colorHelper(colorBlack)))
    ];

    _view.loadListSuccess(cards);
  }

  colorHelper(String color){
    return color.replaceAll("#", "0xff");
  }

  @override
  void selectCard(String number) {

  }
}