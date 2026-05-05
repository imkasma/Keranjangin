import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_defaults.dart';
import '../../../core/components/app_back_button.dart';

import '../../../core/viewmodels/card_viewmodel.dart';
import 'components/new_card_row.dart';
import 'components/default_card.dart';
import 'components/payment_option_tile.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("FETCH CARD DIPANGGIL");
      context.read<CardViewModel>().fetchCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Payment Option'),
      ),
      body: Consumer<CardViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: AppDefaults.padding),

                const AddNewCardRow(),

                const SizedBox(height: 10),

                vm.card == null
                    ? const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Belum ada kartu",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : Column(
                        children: [
                          DefaultCard(card: vm.card!),

                          const SizedBox(height: 10),

                          Text(
                            "Number: ${vm.card!.number}\n"
                            "Name: ${vm.card!.name}\n"
                            "Valid: ${vm.card!.valid}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(AppDefaults.padding),
                    child: Text(
                      'Other Payment Option',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                PaymentOptionTile(
                  icon: 'https://i.imgur.com/7pI5714.png',
                  label: 'Paypal',
                  accountName: 'mypaypal@gmail.com',
                  onTap: () {},
                ),
                PaymentOptionTile(
                  icon: 'https://i.imgur.com/aRJj3iU.png',
                  label: 'Cash on Delivery',
                  accountName: 'Pay in Cash',
                  onTap: () {},
                ),
                PaymentOptionTile(
                  icon: 'https://i.imgur.com/lLUcMC1.png',
                  label: 'Apple Pay',
                  accountName: 'applepay.com',
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
