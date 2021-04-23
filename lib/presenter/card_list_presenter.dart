import 'package:mvp_flutter/contract/card_list_contract.dart';
import 'package:mvp_flutter/page/cards_list_page.dart';
import 'package:mvp_flutter/provider/card_layout_vo.dart';
import 'package:mvp_flutter/provider/card_vo.dart';
import 'package:mvp_flutter/repository/card_list_api.dart';

class CardListPresenterImpl implements CardListPresenter {

  final CardListView _view;
  final CardListApi _api;

  CardListPresenterImpl(this._view, this._api);

  @override
  void getCardList() {
    // faça algo aqui dentro para gerar os cartões
    final colorYellow = "#FFCC32";
    final colorBlack = "#000000";
    final colorGray = "#626567";
    final colorWhite = "#FFFFFF";

    _api.getCardsList().then((response) {
      _view.loadListSuccess(response.list);
    });
  }

  colorHelper(String color){
    return color.replaceAll("#", "0xff");
  }

  @override
  void selectCard(String number) {

  }
}