abstract class CardDetailsView {

  void showDetailsSuccess(String limit, bool blockStatus);

  void showDetailsError();

  void detailsLoading();
}

abstract class CardDetailsPresenter {

  void getDetailCard(String walletId);
}