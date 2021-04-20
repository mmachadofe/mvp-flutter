import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_flutter/contract/card_list_contract.dart';
import 'package:mvp_flutter/presenter/card_list_presenter.dart';
import 'package:mvp_flutter/provider/card_vo.dart';

class CardListPage extends StatefulWidget {

  CardListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CardListPage createState() => _CardListPage();
}

class _CardListPage extends State<CardListPage> implements CardListView {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _loaded = false;
  List<CardVO> _cards = [];

  CardListPresenter _presenter;

  @override
  void initState() {
    super.initState();

    _presenter = CardListPresenterImpl(this);

    _presenter.getCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              "Cartões"
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
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.yellow,
                                  ),
                                  width: 60,
                                  height: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _cards[index].lastDigits
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                                  child: Column(
                                    children: [
                                      Text(
                                          _cards[index].cardTitle
                                    ),
                                      Text(
                                          _cards[index].statusMessage
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
  void loadListSuccess(List<CardVO> cards) {
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
}