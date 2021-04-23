import 'package:mvp_flutter/provider/card_response_vo.dart';

abstract class CardListView {

  void loadListSuccess(List<CardResponseVO> cards);

  void loadListError();

  void listLoading();
}

abstract class CardListPresenter {

  void getCardList();

  void selectCard(String number);
}