import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add provider for state management

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SolvedItemsNotifier(),
      child: const MyApp(),
    ),
  );
}

class SolvedItemsNotifier extends ChangeNotifier {
  final Map<String, bool> _solvedItems = {};

  bool isSolved(String item) => _solvedItems[item] ?? false;

  void markAsSolved(String item) {
    _solvedItems[item] = true;
    notifyListeners();
  }
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
      backgroundColor: const Color(0xFF461D7C),
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
    final solvedItemsNotifier = Provider.of<SolvedItemsNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('The Commons'),
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text('Item 1.1'),
                    if (solvedItemsNotifier.isSolved('Item 1.1'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
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
                title: Row(
                  children: [
                    const Text('Item 1.2'),
                    if (solvedItemsNotifier.isSolved('Item 1.2'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
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
                title: Row(
                  children: [
                    const Text('Item 1.3'),
                    if (solvedItemsNotifier.isSolved('Item 1.3'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
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
            title: const Text('Roy O\' Martin Auditorium'),
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
            title: const Text('Capstone Gallery'),
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
            title: const Text('Cambre Atrium'),
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
            title: const Text('Something on 3rd Floor'),
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
    if (title == 'Item 1.1') {
      return const Item1_3Page(); // Redirect to the custom page for Item 1.1
    } else if (title == 'Item 1.2') {
      return const Item1_2Page(); // Redirect to the custom page for Item 1.2
    } else if (title == 'Item 1.3') {
      return const Item1_1Page(); // Redirect to the custom page for Item 1.3
    } else if (title == 'Item 4.1') {
      return const Item4_1Page(); // Redirect to the custom page for Item 4.1
    } else if (title == 'Item 4.2') {
      return const Item4_2Page(); // Redirect to the custom page for Item 4.2
    }
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

class Item1_1Page extends StatefulWidget {
  const Item1_1Page({super.key});

  @override
  State<Item1_1Page> createState() => _Item1_1PageState();
}

class _Item1_1PageState extends State<Item1_1Page> {
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';

  void _checkAnswer() {
    if (_controller.text.trim().toLowerCase() == 'the commons') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Item 1.1');
      setState(() {
        _feedback = 'Correct! You solved the riddle!';
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riddle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riddle:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Freedom calls, and so do I, \n'
              'Behind the stairs, I’m your go-to spot to try. \n'
              'Relax, recharge, or find your team, \n'
              'What’s the space that fulfills your dream?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

class Item1_2Page extends StatefulWidget {
  const Item1_2Page({super.key});

  @override
  State<Item1_2Page> createState() => _Item1_2PageState();
}

class _Item1_2PageState extends State<Item1_2Page> {
  String _feedback = '';

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == 'Choice 3') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Item 1.2');
      setState(() {
        _feedback = 'Correct! You selected the right answer!';
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Choice Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Question:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Which of these items are labeled "In Season" in Panera Bread?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 1'),
              child: const Text('Hearty Fireside Chili'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 2'),
              child: const Text('Cream of Chicken & Wild Rice'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 3'),
              child: const Text('Autumn Squash'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 4'),
              child: const Text('Harvest Sweet Potato Bisque'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

class Item1_3Page extends StatefulWidget {
  const Item1_3Page({super.key});

  @override
  State<Item1_3Page> createState() => _Item1_3PageState();
}

class _Item1_3PageState extends State<Item1_3Page> {
  String _feedback = '';

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == 'Choice 1') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Item 1.3');
      setState(() {
        _feedback = 'Correct! You selected the right answer!';
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Choice Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Question:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'What are the words written on the statue DIRECTLY behind the Capstone Gallery Stairs?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 1'),
              child: const Text('Tau Beta Pi'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 2'),
              child: const Text('Sigma Gamma Pi'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 3'),
              child: const Text('Alpha Beta Sigma'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 4'),
              child: const Text('Beta Phi Gamma'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

class Item4_1Page extends StatefulWidget {
  const Item4_1Page({super.key});

  @override
  State<Item4_1Page> createState() => _Item4_1PageState();
}

class _Item4_1PageState extends State<Item4_1Page> {
  String _feedback = '';

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == 'Choice 4') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Item 4.1');
      setState(() {
        _feedback = 'Correct! You selected the right answer!';
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Choice Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Question:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'How many trashcans and recycle bins (all together) are in the Cambre Atrium?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 1'),
              child: const Text('5'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 2'),
              child: const Text('7'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 3'),
              child: const Text('9'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 4'),
              child: const Text('8'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

class Item4_2Page extends StatefulWidget {
  const Item4_2Page({super.key});

  @override
  State<Item4_2Page> createState() => _Item4_2PageState();
}

class _Item4_2PageState extends State<Item4_2Page> {
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';

  void _checkAnswer() {
    if (_controller.text.trim().toLowerCase() == 'if you can\'t do it better, why do it?') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Item 4.2');
      setState(() {
        _feedback = 'Correct! You solved the question!';
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Short Answer Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Question:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'What famous(?) quote was said by Herbert Henry Dow?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
          ],
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
