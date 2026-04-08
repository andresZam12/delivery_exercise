import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/product.dart';
import 'popup_success_screen.dart';

class PaymentScreen extends StatelessWidget {
  final Product product;
  final int portion;

  const PaymentScreen({super.key, required this.product, required this.portion});

  @override
  Widget build(BuildContext context) {
    final order = product.price * portion;
    const delivery = 1.5;
    const taxes = 0.3;
    final total = order + delivery + taxes;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Order summary',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _summaryRow('Order', '\$${order.toStringAsFixed(2)}', bold: false),
                    const SizedBox(height: 16),
                    _summaryRow('Delivery fees', '\$$delivery', bold: false),
                    const SizedBox(height: 16),
                    _summaryRow('Taxes', '\$$taxes', bold: false),
                    const Divider(color: Color(0xFFF0F0F0), height: 32),
                    _summaryRow('Total:', '\$${total.toStringAsFixed(2)}', bold: true),
                    const SizedBox(height: 8),
                    _summaryRow(
                      'Estimated delivery time:',
                      '15 - 30mins',
                      bold: true,
                      small: true,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Payment methods',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildCardTile(
                      image: 'assets/images/card_credit.png',
                      type: 'Credit card',
                      number: '5105 **** **** 0505',
                      selected: true,
                    ),
                    const SizedBox(height: 12),
                    _buildCardTile(
                      image: 'assets/images/card_debit.png',
                      type: 'Debit card',
                      number: '3566 **** **** 0505',
                      selected: false,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check,
                              size: 12, color: AppColors.white),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Save card details for future payments',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            _buildPayButton(context, total),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 22, 19, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new,
                size: 28, color: AppColors.dark),
          ),
          const Icon(Icons.search, size: 20, color: AppColors.dark),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value,
      {bool bold = false, bool small = false}) {
    final style = TextStyle(
      fontFamily: 'Roboto',
      fontSize: small ? 14 : 18,
      fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
      color: bold ? AppColors.dark : AppColors.greyLight,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }

  Widget _buildCardTile({
    required String image,
    required String type,
    required String number,
    required bool selected,
  }) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: selected ? AppColors.dark : AppColors.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: selected ? 0.25 : 0.1),
            blurRadius: selected ? 13 : 10,
            offset: Offset(0, selected ? 7 : 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(image, width: 70, height: 44, fit: BoxFit.contain),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: selected ? AppColors.white : AppColors.dark,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                number,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.white : AppColors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton(BuildContext context, double total) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 8, 19, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total price',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: AppColors.grey,
                ),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PopupSuccessScreen()),
            ),
            child: Container(
              width: 209,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Pay Now',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
