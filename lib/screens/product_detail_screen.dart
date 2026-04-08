import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/product.dart';
import 'payment_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _portion = 2;
  double _spicy = 0.3;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopImage(context, p),
                    _buildDetails(p),
                  ],
                ),
              ),
            ),
            _buildBottomBar(context, p),
          ],
        ),
      ),
    );
  }

  Widget _buildTopImage(BuildContext context, Product p) {
    return Stack(
      children: [
        SizedBox(
          height: 380,
          width: double.infinity,
          child: Image.asset(p.imagePath, fit: BoxFit.cover),
        ),
        Positioned(
          top: 22,
          left: 12,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new,
                size: 28, color: AppColors.dark),
          ),
        ),
        Positioned(
          top: 28,
          right: 19,
          child: const Icon(Icons.search, size: 20, color: AppColors.dark),
        ),
      ],
    );
  }

  Widget _buildDetails(Product p) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            '${p.name} ${p.subtitle}',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.star, size: 16),
              const SizedBox(width: 4),
              Text(
                '${p.rating}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.access_time, color: AppColors.grey, size: 16),
              const SizedBox(width: 4),
              Text(
                '${p.deliveryMins} mins',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            p.description,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.greyDark,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 24),
          _buildSpicySection(),
          const SizedBox(height: 24),
          _buildPortionSection(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSpicySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Spicy',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.background,
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withValues(alpha: 0.2),
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
          ),
          child: Slider(
            value: _spicy,
            onChanged: (v) => setState(() => _spicy = v),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Mild',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    color: AppColors.green)),
            Text('Hot',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    color: AppColors.primary)),
          ],
        ),
      ],
    );
  }

  Widget _buildPortionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Portion',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
          ),
        ),
        Row(
          children: [
            _portionButton(Icons.remove, () {
              if (_portion > 1) setState(() => _portion--);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '$_portion',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.dark,
                ),
              ),
            ),
            _portionButton(Icons.add, () => setState(() => _portion++)),
          ],
        ),
      ],
    );
  }

  Widget _portionButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 18, color: AppColors.white),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, Product p) {
    final total = p.price * _portion;
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 8, 19, 16),
      child: Row(
        children: [
          // Price button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 104,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.4),
                    blurRadius: 30,
                    offset: const Offset(0, 9),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 19),
          // Order Now button
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentScreen(product: p, portion: _portion),
                ),
              ),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.dark,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 30,
                      offset: const Offset(0, 9),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'ORDER NOW',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
