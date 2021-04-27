import 'package:flutter/material.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/core/utilities.dart';

class CardListItem extends StatelessWidget {
  final CardResponseVO card;

  CardListItem(this.card);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            height: 88,
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4.0),
                  color: HexColor.fromHex(
                      card.layoutAttrs.bgColor),
                ),
                width: 60,
                height: 40,
                padding: EdgeInsets.symmetric(
                    horizontal: 2, vertical: 4),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      card.lastDigits,
                      style: TextStyle(
                          color: HexColor.fromHex(card
                              .layoutAttrs
                              .titleColor)),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.network(
                          card.cardBrand,
                          width: 22,
                          height: 10),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: HexColor.fromHex("#616672"),
                        ),
                      ),
                      Text(
                        card.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: HexColor.fromHex("#616672"),
                        ),
                      ),
                    ],
                  ))
            ])));
  }
}
