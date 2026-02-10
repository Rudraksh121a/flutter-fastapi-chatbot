import 'package:chatbot/services/chat_web_services.dart';
import 'package:chatbot/theme/colors.dart';
import 'package:chatbot/widgets/search_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();
  String? response;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    ChatWebServices().onMessage = (msg) {
      setState(() {
        response = msg;
        isLoading = false;
      });
    };
  }

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Where Knowledge begins",
          style: GoogleFonts.ibmPlexMono(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 32),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: "Search for anything...",
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onSubmitted: (value) => _sendQuery(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: "Focus",
                    ),
                    const SizedBox(width: 12),
                    SearchBarButton(
                      icon: Icons.add_circle_outline,
                      text: "Attach",
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _sendQuery,
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color:
                              queryController.text.trim().isEmpty || isLoading
                              ? AppColors.iconGrey
                              : AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.background,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.arrow_forward,
                                color: AppColors.background,
                                size: 16,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (response != null)
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
              width: 700,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                response!,
                style: TextStyle(fontSize: 18, color: AppColors.whiteColor),
              ),
            ),
          ),
      ],
    );
  }

  void _sendQuery() {
    final query = queryController.text.trim();
    if (query.isEmpty || isLoading) return;
    setState(() {
      isLoading = true;
      response = null;
    });
    ChatWebServices().chat(query);
  }
}
