import 'package:mvp_flutter/cards/contract/card_list_contract.dart';
import 'package:mvp_flutter/cards/repository/card_list_api.dart';

class CardListPresenterImpl implements CardListPresenter {

  final CardListView _view;
  final CardListApi _api;

  CardListPresenterImpl(this._view, this._api);

  @override
  void getCardList() {
    _view.listLoading(false);
    _api.getCardsList().then((response) {
      _view.loadListSuccess(response.cards);
      _view.listLoading(true);
    }).catchError((onError) {
      _view.loadListError();
      _view.listLoading(true);
    });
  }
}