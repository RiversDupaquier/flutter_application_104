import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scavenger Hunt App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MyHomePageContent(),
    MapPage(),
    LocationsPage(),
    HelpPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scavenger Hunt'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure labels are always visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple, // Set color for selected item
        unselectedItemColor: const Color.fromARGB(255, 4, 4, 4), // Set color for unselected items
        backgroundColor: Colors.white, // Set background color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Locations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}

class MyHomePageContent extends StatelessWidget {
  const MyHomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF461D7C), // Updated color to #461D7C
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
            child: Center(
              child: Image.asset(
                'assets/fonts/images/LSU logo.png', // LSU logo
                width: 150, // Adjust width as needed
                height: 150, // Adjust height as needed
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                'Patrick F. Taylor Scavenger Hunt',
                style: TextStyle(
                  fontFamily: 'Proxima Nova',
                  fontSize: 20,
                ),
              ),
            ),
          ),
          // Add other widgets below if needed
        ],
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'PFT Map',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/fonts/images/PFT Map.webp',
                fit: BoxFit.contain, // Ensure the entire image is visible
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Location 1'),
            children: [
              ListTile(
                title: const Text('Item 1.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 1.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 1.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 1.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 1.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 1.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 2'),
            children: [
              ListTile(
                title: const Text('Item 2.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 2.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 2.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 2.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 2.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 2.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 3'),
            children: [
              ListTile(
                title: const Text('Item 3.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 3.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 3.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 3.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 3.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 3.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 4'),
            children: [
              ListTile(
                title: const Text('Item 4.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 4.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 4.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 4.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 4.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 4.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 5'),
            children: [
              ListTile(
                title: const Text('Item 5.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 5.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 5.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 5.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 5.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 5.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 6'),
            children: [
              ListTile(
                title: const Text('Item 6.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 6.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 6.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 6.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 6.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 6.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 7'),
            children: [
              ListTile(
                title: const Text('Item 7.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 7.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 7.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 7.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 7.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 7.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 8'),
            children: [
              ListTile(
                title: const Text('Item 8.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 8.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 8.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 8.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 8.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 8.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 9'),
            children: [
              ListTile(
                title: const Text('Item 9.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 9.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 9.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 9.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 9.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 9.3'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Location 10'),
            children: [
              ListTile(
                title: const Text('Item 10.1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 10.1'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 10.2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 10.2'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 10.3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Item 10.3'),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  final String title;

  const ItemPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'This is the page for $title.',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child: Text(
          'This is the Help Page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
