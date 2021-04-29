import 'package:mvp_flutter/cards/contract/card_details_contract.dart';
import 'package:mvp_flutter/cards/repository/card_details_api.dart';

class CardDetailsPresenterImpl implements CardDetailsPresenter {

  final CardDetailsView _view;
  final CardDetailsApi _api;

  CardDetailsPresenterImpl(this._view, this._api);

  @override
  void getDetailCard(String walletId) {
    _api.getDetailCard(walletId).then((response) {
      _view.showDetailsSuccess(response.limit, response.blockStatus);
    });
  }

}