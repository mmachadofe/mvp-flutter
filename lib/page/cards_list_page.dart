import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_flutter/api_client.dart';
import 'package:flutter/services.dart';
import 'package:mvp_flutter/contract/card_list_contract.dart';
import 'package:mvp_flutter/core/strings/strings_resource.dart';
import 'package:mvp_flutter/core/utilities.dart';
import 'package:mvp_flutter/presenter/card_list_presenter.dart';
import 'package:mvp_flutter/provider/card_response_vo.dart';
import 'package:mvp_flutter/repository/card_list_api.dart';

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
          title: Text(
              ResourceStrings.title_main
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
                itemCount: this._loaded ? _cards.length : 0,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: HexColor.fromHex(_cards[index].layoutAttrs.bgColor),
                                  ),
                                  width: 100,
                                  height: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _cards[index].lastDigits,
                                        style: TextStyle(color: HexColor.fromHex(_cards[index].layoutAttrs.titleColor)),
                                      ),
                                      Image.network(_cards[index].cardBrand,width: 30,
                                        height: 20)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                                  child: Column(
                                    children: [
                                      Text(
                                          _cards[index].title,
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                      Text(
                                          _cards[index].description
                                      ),
                                    ],
                                  )
                                )
                              ])
                      )
                  );
                });
          },
        )
    );
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
  void loadListError() {
  }
}