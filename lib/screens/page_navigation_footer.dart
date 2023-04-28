import 'package:flutter/material.dart';

class PageNavigationFooter extends StatelessWidget {
  final bool isFirstPage;
  final bool isLastPage;
  final VoidCallback goToFirstPage;
  final VoidCallback goToPreviousPage;
  final VoidCallback goToNextPage;
  final VoidCallback goToLastPage;

  const PageNavigationFooter({
    super.key,
    required this.isFirstPage,
    required this.isLastPage,
    required this.goToFirstPage,
    required this.goToPreviousPage,
    required this.goToNextPage,
    required this.goToLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.first_page),
            onPressed: isFirstPage ? null : goToFirstPage,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: isFirstPage ? null : goToPreviousPage,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: isLastPage ? null : goToNextPage,
          ),
          IconButton(
            icon: const Icon(Icons.last_page),
            onPressed: isLastPage ? null : goToLastPage,
          ),
        ],
      ),
    );
  }
}
