
import 'card_layout.dart';

class CardVO {

  final String cardTitle;
  final String lastDigits;
  final String statusMessage;
  final String cardBrand;
  final CardLayout layoutAttrs;

  CardVO(this.cardTitle, this.lastDigits, this.statusMessage, this.cardBrand, this.layoutAttrs);
}