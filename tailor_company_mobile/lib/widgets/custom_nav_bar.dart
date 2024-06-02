import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/utils/providers/navigation_provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  BottomNavigationBarItem _buildNavigationItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      label: label,
      activeIcon: Column(
        children: [
          Icon(
            icon,
            color: ColorConstants.primary,
          ),
          Text(
            label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorConstants.primary),
          )
        ],
      ),
      icon: Column(
        children: [
          Icon(
            icon,
            color: ColorConstants.secondary,
          ),
          Text(
            label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorConstants.secondary),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      onTap: navigationProvider.onIndexChange,
      currentIndex: navigationProvider.currentIndex,
      items: [
        _buildNavigationItem('Home', Icons.home),
        _buildNavigationItem('Add new', Icons.new_label),
        _buildNavigationItem('Chats', Icons.home),
        _buildNavigationItem('Account', Icons.home),
      ],
    );
  }
}
