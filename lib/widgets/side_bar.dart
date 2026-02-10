import 'package:flutter/material.dart';
import 'package:chatbot/theme/colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;

  Widget sideBarItem(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isCollapsed
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(icon, color: AppColors.iconGrey, size: 22),
          ),
          if (!isCollapsed)
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 64 : 180,
      color: AppColors.sideNav,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),

          Center(
            child: Icon(
              Icons.auto_awesome_mosaic,
              color: AppColors.whiteColor,
              size: isCollapsed ? 30 : 50,
            ),
          ),

          const SizedBox(height: 30),

          sideBarItem(Icons.home_outlined, 'Home'),
          sideBarItem(Icons.search, 'Search'),
          sideBarItem(Icons.language, 'Spaces'),
          sideBarItem(Icons.auto_awesome, 'Discover'),
          sideBarItem(Icons.cloud_outlined, 'Library'),

          const Spacer(),

          GestureDetector(
            onTap: () => setState(() => isCollapsed = !isCollapsed),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: isCollapsed
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      isCollapsed
                          ? Icons.keyboard_arrow_right
                          : Icons.keyboard_arrow_left,
                      color: AppColors.iconGrey,
                      size: 22,
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
}
