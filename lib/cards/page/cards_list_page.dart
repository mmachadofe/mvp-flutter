import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_flutter/cards/ui_components/card_list_item.dart';
import 'package:mvp_flutter/core/api_client.dart';
import 'package:mvp_flutter/core/strings/strings_resource.dart';
import 'package:mvp_flutter/cards/contract/card_list_contract.dart';
import 'package:mvp_flutter/cards/presenter/card_list_presenter.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/cards/repository/card_list_api.dart';

class CardListPage extends StatefulWidget {
  final Dio client;

  CardListPage({Key key, this.title, this.client}) : super(key: key);

  final String title;

  @override
  _CardListPage createState() => _CardListPage();
}

class _CardListPage extends State<CardListPage> implements CardListView {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 3;
  bool _loaded = false;
  List<CardResponseVO> _cards = [];
  CardListPresenter _presenter;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<String> _titleOptions = <String>[
    ResourceStrings.title_main,
    ResourceStrings.title_extract,
    ResourceStrings.bottom_navigation_item3,
    ResourceStrings.title_cards
  ];

  Widget _widgetOptions(_text) => Center(
        child: Text(
          _text,
          style: optionStyle,
        ),
      );

  @override
  void initState() {
    super.initState();

    if(widget.client==null){
      _presenter = CardListPresenterImpl(this, CardListApi(ApiClient.getDio()));
    }else{
      _presenter = CardListPresenterImpl(this, CardListApi(widget.client));
    }

    _presenter.getCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titleOptions[_selectedIndex]),
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
        currentIndex: _selectedIndex,
        iconSize: 28,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.shade700,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          switch (_selectedIndex) {
            case 0:
              return _widgetOptions(ResourceStrings.bottom_navigation_item1);
            case 1:
              return _widgetOptions(ResourceStrings.bottom_navigation_item2);
            case 2:
              return _widgetOptions(ResourceStrings.bottom_navigation_item3);
            default:
              return Visibility(
                visible: _loaded,
                child: _cards.length > 0
                    ? ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: _cards.length,
                        itemBuilder: (context, index) {
                          return CardListItem(_cards[index]);
                        })
                    : Center(child: const Text('No items')),
              );
          }
        },
      ),
    );
  }

  @override
  void loadListSuccess(List<CardResponseVO> cards) {
    setState(() {
      this._cards = cards;
    });
  }

  @override
  void listLoading(bool status) {
    setState(() {
      _loaded = status;
    });
  }

  @override
  void loadListError() {
    log('Error!');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
