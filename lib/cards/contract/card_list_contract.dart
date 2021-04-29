import 'package:mvp_flutter/cards/provider/card_response_vo.dart';

abstract class CardListView {

  void loadListSuccess(List<CardResponseVO> cards);

  void loadListError();

  void listLoading();
}

abstract class CardListPresenter {

  void getCardList();
}