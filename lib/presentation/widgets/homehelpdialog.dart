import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeHelpScreen extends StatefulWidget {
  const HomeHelpScreen({super.key});

  @override
  State<HomeHelpScreen> createState() => _HomeHelpScreenState();
}

class _HomeHelpScreenState extends State<HomeHelpScreen> {
  int _currentPage = 0;

  final _screens = const <Widget>[
    Text('Page 1'),
    Text('Page 2'),
    Text('Page 3'),
    Text('Page 4'),
  ];

  final _pages = [
    HelpPage(
        title: 'Browse',
        subtitle: '',
        description:
            'The home page shows the list of PAPs you have access to. They are grouped by PIPS/PIPOL Status which can be navigated from the left side panel. Tapping on each of the PAP in the list will open quick view for the PAP and show the menu.',
        icon: Icons.list),
    HelpPage(
        title: 'Search',
        subtitle: 'Search for PAP',
        description:
            'To search for a PAP, on the top right side of the page, click on the search button. Type in your query and press enter.',
        icon: Icons.search),
    HelpPage(
        title: 'Filter',
        subtitle:
            'The filter menu allows to filter PAPs based on certain categories',
        description: '',
        icon: Icons.tune),
    HelpPage(
        title: 'View',
        subtitle: '',
        description:
            'Tap on the PAP for a quick glance on the PAP information.',
        icon: Icons.visibility),
  ];

  void _previousPage() {
    // do nothing if already on the last screen
    if (_currentPage == 0) return;

    setState(() {
      _currentPage--;
    });
  }

  void _nextPage() {
    // if last page is already reached, stop
    if (_currentPage == _screens.length - 1) return;

    setState(() {
      _currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activePage = _pages[_currentPage];

    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: Text(activePage.title)),
      body: Row(
        children: [
          Center(
            child: IconButton(
                icon: const Icon(Icons.chevron_left), onPressed: _previousPage),
          ),
          Expanded(
              child: Center(
                  child: Column(
            children: [
              Text(activePage.subtitle),
              Icon(
                activePage.icon,
                size: height / 3,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              Text(activePage.description),
            ],
          ))),
          Center(
            child: IconButton(
                icon: const Icon(Icons.chevron_right), onPressed: _nextPage),
          ),
        ],
      ),
    );
  }
}

class HelpPage {
  String title;

  String subtitle;

  String description;

  IconData icon;

  HelpPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
  });
}
