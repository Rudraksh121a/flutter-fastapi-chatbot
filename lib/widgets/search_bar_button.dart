import 'package:chatbot/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchBarButton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SearchBarButton({super.key, required this.icon, required this.text});

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            color: isHovering ? AppColors.proButton : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: AppColors.iconGrey, size: 20),
              const SizedBox(width: 6),
              Text(
                widget.text,
                style: TextStyle(color: AppColors.textGrey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
