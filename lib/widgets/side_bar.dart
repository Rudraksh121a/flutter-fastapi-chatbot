import 'package:chatbot/theme/colors.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;

  Widget sideBarItem(IconData icon, String? label) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 22),
        ),
        if (!isCollapsed && label != null)
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 64 : 128,
      color: AppColors.sideNav,
      child: Column(
        crossAxisAlignment: isCollapsed
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Icon(
              Icons.auto_awesome_mosaic,
              color: AppColors.whiteColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 24),
          sideBarItem(Icons.add, 'New Chat'),
          sideBarItem(Icons.search, 'Search'),
          sideBarItem(Icons.language, 'Explore GPTs'),
          sideBarItem(Icons.auto_awesome, null),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Icon(
              Icons.cloud_outlined,
              color: AppColors.iconGrey,
              size: 22,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => setState(() => isCollapsed = !isCollapsed),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
