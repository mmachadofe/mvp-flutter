import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvp_flutter/cards/ui_components/card_list_item.dart';
import 'package:mvp_flutter/core/api_client.dart';
import 'package:mvp_flutter/core/strings/strings_resource.dart';
import 'package:mvp_flutter/cards/contract/card_list_contract.dart';
import 'package:mvp_flutter/cards/presenter/card_list_presenter.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/cards/repository/card_list_api.dart';

class CardListPage extends StatefulWidget {
  CardListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CardListPage createState() => _CardListPage();
}

class _CardListPage extends State<CardListPage> implements CardListView {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _loaded = false;
  List<CardResponseVO> _cards = [];

  CardListPresenter _presenter;

  @override
  void initState() {
    super.initState();

    _presenter = CardListPresenterImpl(this, CardListApi(ApiClient.getDio()));

    _presenter.getCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(ResourceStrings.title_main),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ResourceStrings.bottom_navigation_item1,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: ResourceStrings.bottom_navigation_item2,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront),
              label: ResourceStrings.bottom_navigation_item3,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: ResourceStrings.bottom_navigation_item4,
            ),
          ],
          iconSize: 28,
          selectedItemColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey.shade700,
          showUnselectedLabels: true
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
                itemCount: this._loaded ? _cards.length : 0,
                itemBuilder: (context, index) {
                  return CardListItem(_cards[index]);
                });
          },
        ));
  }

  @override
  void loadListSuccess(List<CardResponseVO> cards) {
    setState(() {
      this._cards = cards;
      _loaded = true;
    });
  }

  @override
  void listLoading() {
    setState(() {
      _loaded = false;
    });
  }

  @override
  void loadListError() {}
}
