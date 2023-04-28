import 'package:conversions_pro/screens/altura_wii.dart';
import 'package:conversions_pro/screens/imc_calculator.dart';
import 'package:conversions_pro/screens/page_navigation_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Altura Wii',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController();
  int _currentPageIndex = 0;
  int totalPages = 1;

  final List<Widget> _pages = [
    const AlturaWiiPageView(),
    const IMCCalculatorPage(),
  ];

  final List<String> _pageTitles = [
    'Sua Altura no Wii',
    'Calculadora do IMC',
  ];

  void _goToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_currentPageIndex]),
      ),
      body: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          }),
      bottomNavigationBar: kIsWeb
          ? PageNavigationFooter(
              isFirstPage: _currentPageIndex == 0,
              isLastPage: _currentPageIndex == totalPages,
              goToFirstPage: () => _goToPage(0),
              goToPreviousPage: () => {
                if (_currentPageIndex > 0) {_goToPage(_currentPageIndex - 1)}
              },
              goToNextPage: () => {
                if (_currentPageIndex < 1) {_goToPage(_currentPageIndex + 1)}
              },
              goToLastPage: () => _goToPage(1),
            )
          : null,
    );
  }
}
