import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background top
          Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.16),
                radius: 1.0,
                colors: [Color(0xFFFF2A9D), Color(0xFFEF2A39)],
              ),
            ),
          ),
          // White card bottom
          Positioned(
            top: 161,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildTopBar(context),
                const SizedBox(height: 8),
                _buildAvatar(),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Column(
                      children: [
                        _buildField('Name', 'Sophia Patel'),
                        _buildField('Email', 'sophiapatel@gmail.com'),
                        _buildField(
                            'Delivery address', '123 Main St Apartment 4A, New York, NY'),
                        _buildField('Password', '••••••••••'),
                        const SizedBox(height: 8),
                        const Divider(color: Color(0xFFE8E8E8)),
                        const SizedBox(height: 8),
                        _buildMenuRow('Payment Details'),
                        _buildMenuRow('Order history'),
                        const SizedBox(height: 24),
                        _buildActionButtons(context),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new,
                size: 28, color: AppColors.white),
          ),
          const Icon(Icons.settings, color: AppColors.white, size: 24),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 139,
      height: 139,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 4),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 21,
            offset: const Offset(0, 11),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
    );
  }

  Widget _buildField(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFE1E1E1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuRow(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(29, 0, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.dark, size: 24),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 9),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.edit, color: AppColors.white, size: 20),
              ],
            ),
          ),
        ),
        const SizedBox(width: 17),
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary, width: 3),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 30,
                offset: const Offset(0, 9),
              ),
            ],
          ),
          child: Row(
            children: [
              const Text(
                'Log out',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.logout, color: AppColors.primary, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
