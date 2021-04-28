import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';
import 'package:mvp_flutter/core/strings/strings_resource.dart';
import 'package:mvp_flutter/core/utilities.dart';

class CardDetailsItem extends StatefulWidget {
  final CardResponseVO card;

  CardDetailsItem(this.card);

  @override
  _CardDetailsItem createState() => _CardDetailsItem();
}

class _CardDetailsItem extends State<CardDetailsItem> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {

    return Container(
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
                    color: HexColor.fromHex(widget.card.layoutAttrs.titleColor),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.network(widget.card.cardBrand, width: 90, height: 65),
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
                "R\$ 1.000,00",
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
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeTrackColor: Colors.lightGreen[200],
                activeColor: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}
