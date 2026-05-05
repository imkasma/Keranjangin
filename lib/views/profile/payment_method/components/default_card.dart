import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../core/models/card_model.dart';

class DefaultCard extends StatelessWidget {
  final CardModel card;

  const DefaultCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: card.number,
      expiryDate: card.valid,
      cardHolderName: card.name,

      // 🔥 WAJIB ADA (walaupun API tidak punya)
      cvvCode: '***',

      showBackView: false,
      cardType: CardType.visa,
      onCreditCardWidgetChange: (v) {},
      isChipVisible: false,
    );
  }
}
