import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_flutter/cards/contract/card_details_contract.dart';
import 'package:mvp_flutter/cards/presenter/card_details_presenter.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/cards/repository/card_details_api.dart';
import 'package:mvp_flutter/core/api_client.dart';
import 'package:mvp_flutter/core/strings/strings_resource.dart';
import 'package:mvp_flutter/core/utilities.dart';

class CardsDetailsPage extends StatefulWidget {
  final CardResponseVO card;
  final Dio client;

  CardsDetailsPage({this.card, this.client});

  @override
  _CardsDetailsPageState createState() => _CardsDetailsPageState();
}

class _CardsDetailsPageState extends State<CardsDetailsPage>
    implements CardDetailsView {
  bool _loaded = false;
  String _limit = "";
  bool _blockStatus = false;

  CardDetailsPresenter _presenter;

  @override
  void initState() {
    super.initState();

    if(widget.client==null){
      _presenter =
          CardDetailsPresenterImpl(this, CardDetailsApi(ApiClient.getDio()));
    }else{
      _presenter =
          CardDetailsPresenterImpl(this, CardDetailsApi(widget.client));
    }

    _presenter.getDetailCard(widget.card.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.card.title),
      ),
      body: Visibility(
        visible: _loaded,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(14, 70, 14, 11),
                decoration: BoxDecoration(
                  color: HexColor.fromHex(widget.card.layoutAttrs.bgColor),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${ResourceStrings.CARD_NUMBER} ${widget.card.lastDigits}",
                      style: TextStyle(
                        fontSize: 24,
                        color:
                            HexColor.fromHex(widget.card.layoutAttrs.titleColor),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.network(widget.card.cardBrand,
                          width: 90, height: 65),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Text(
                    ResourceStrings.label_situation,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.card.description,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    ResourceStrings.label_limit,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _limit,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(ResourceStrings.title_switch_block),
                  Switch(
                    value: _blockStatus,
                    onChanged: (value) {
                      setState(() {
                        _blockStatus = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreen[200],
                    activeColor: Colors.green,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void showDetailsSuccess(String limit, bool blockStatus) => setState(() {
        _limit = limit;
        _blockStatus = blockStatus;
        _loaded = true;
      });

  @override
  void detailsLoading() {
    setState(() {
      _loaded = false;
    });
  }

  @override
  void showDetailsError() {
    // implement showDetailsError
  }
}
