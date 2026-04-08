import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'payment_screen.dart';
import '../models/product.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  double _spicy = 0.3;
  int _portion = 2;

  final List<_Item> _toppings = [
    _Item('Tomato', '🍅'),
    _Item('Onions', '🧅'),
    _Item('Pickles', '🥒'),
    _Item('Bacons', '🥓'),
    _Item('Cheese', '🧀'),
  ];

  final List<_Item> _sides = [
    _Item('Fries', '🍟'),
    _Item('Coleslaw', '🥗'),
    _Item('Salad', '🥬'),
    _Item('Onion', '🧅'),
    _Item('Soda', '🥤'),
  ];

  double get _total => 8.24 + (_toppings.where((t) => t.selected).length * 0.75) +
      (_sides.where((s) => s.selected).length * 1.0) +
      (_portion - 1) * 8.24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroSection(),
                    _buildSpicySection(),
                    _buildPortionSection(),
                    const SizedBox(height: 24),
                    _buildItemsSection('Toppings', _toppings),
                    const SizedBox(height: 24),
                    _buildItemsSection('Side options', _sides),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 19, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new,
                size: 26, color: AppColors.dark),
          ),
          const Icon(Icons.search, size: 22, color: AppColors.dark),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return SizedBox(
      height: 220,
      child: Row(
        children: [
          // Burger image — takes left half
          Expanded(
            child: Image.asset(
              'assets/images/splash_food1.png',
              fit: BoxFit.contain,
            ),
          ),
          // Text + controls — right half
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Customize\nYour Burger',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.dark,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'to Your Tastes. Ultimate Experience',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpicySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spicy',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w600,
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
      ),
    );
  }

  Widget _buildPortionSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 16, 19, 0),
      child: Row(
        children: [
          const Text(
            'Portion',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(width: 24),
          _portionBtn(Icons.remove, () {
            if (_portion > 1) setState(() => _portion--);
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '$_portion',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.dark,
              ),
            ),
          ),
          _portionBtn(Icons.add, () => setState(() => _portion++)),
        ],
      ),
    );
  }

  Widget _portionBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: 18),
      ),
    );
  }

  Widget _buildItemsSection(String title, List<_Item> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 19),
            itemCount: items.length,
            itemBuilder: (context, i) => _buildItemCard(items[i]),
          ),
        ),
      ],
    );
  }

  Widget _buildItemCard(_Item item) {
    return GestureDetector(
      onTap: () => setState(() => item.selected = !item.selected),
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: item.selected
              ? AppColors.primary.withValues(alpha: 0.08)
              : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: item.selected
              ? Border.all(color: AppColors.primary, width: 1.5)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(item.emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 4),
            Text(
              item.name,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.dark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: item.selected ? AppColors.dark : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.selected ? Icons.check : Icons.add,
                color: AppColors.white,
                size: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(19, 12, 19, 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              Text(
                '\$${_total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentScreen(
                    product: Product.all[0],
                    portion: _portion,
                  ),
                ),
              ),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'ORDER NOW',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
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

class _Item {
  final String name;
  final String emoji;
  bool selected = false;
  _Item(this.name, this.emoji);
}
