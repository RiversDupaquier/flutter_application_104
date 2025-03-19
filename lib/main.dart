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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scavenger Hunt'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Map'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Locations'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocationsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HelpPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Scavenger Hunt App!',
          style: TextStyle(fontSize: 20),
        ),
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
      body: const Center(
        child: Text(
          'This is the Map Page.',
          style: TextStyle(fontSize: 20),
        ),
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
