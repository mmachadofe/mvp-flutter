import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/cards/ui_components/card_details_item.dart';
import 'package:mvp_flutter/core/strings/strings_resource.dart';
import 'package:mvp_flutter/core/utilities.dart';

class CardsDetailsPage extends StatelessWidget {
  final CardResponseVO card;

  CardsDetailsPage({this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(card.title),
      ),
      body: CardDetailsItem(card),
    );
  }
}
