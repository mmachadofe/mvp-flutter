import 'package:mvp_flutter/provider/card_vo.dart';

abstract class CardListView {

  void loadListSuccess(List<CardVO> cards);

  void listLoading();
}

abstract class CardListPresenter {

  void getCardList();

  void selectCard(String number);
}