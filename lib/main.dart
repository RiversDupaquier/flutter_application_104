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

  bool isSectionCompleted(List<String> items) {
    return items.every((item) => isSolved(item));
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
      child: Stack(
        alignment: Alignment.center, // Center all children
        children: [
          Image.asset(
            'assets/fonts/images/patrick-f-taylor-hall.webp', // Patrick F. Taylor Hall image
            width: 1200.0, // Make the image span the width of the screen
            height: 500.0, // Make the image span the height of the screen
            fit: BoxFit.cover, // Cover the entire screen
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align the text at the top
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, bottom: 10.0),
                child: Image.asset(
                  'assets/fonts/images/LSU logo.png', // LSU logo
                  width: 150, // Adjust width as needed
                  height: 150, // Adjust height as needed
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'Patrick F. Taylor Scavenger Hunt',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova', // Updated font family
                    fontSize: 20,
                    color: Colors.white, // Ensure text is visible on the image
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _currentMapIndex = 0;

  final List<String> _mapImages = [
    'assets/fonts/images/PFT Map 1st Floor.png',
    'assets/fonts/images/PFT Map 2nd Floor.png',
    'assets/fonts/images/PFT Map 3rd Floor.png',
  ];

  final List<String> _mapLabels = [
    '1st Floor Map',
    '2nd Floor Map',
    '3rd Floor Map',
  ];

  void _nextMap() {
    setState(() {
      _currentMapIndex = (_currentMapIndex + 1) % _mapImages.length;
    });
  }

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
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                _mapImages[_currentMapIndex],
                fit: BoxFit.contain, // Ensure the entire image is visible
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _nextMap,
              child: Text('Switch to ${_mapLabels[(_currentMapIndex + 1) % _mapImages.length]}'),
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
      backgroundColor: const Color(0xFF461D7C), // Match the purple color from MapPage
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Row(
              children: [
                const Text(
                  'The Commons',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova', // Updated font family
                    color: Color(0xFFD29F13), // Updated text color to #D29F13
                  ),
                ),
                if (solvedItemsNotifier.isSectionCompleted(['Landmarks', 'Food', 'Riddle']))
                  const Icon(Icons.check, color: Colors.green), // Section checkmark
              ],
            ),
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text(
                      'Landmarks',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('Riddle'))
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
                    const Text(
                      'Food',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('Food'))
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
                    const Text(
                      'Riddle',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('Landmarks'))
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
            title: Row(
              children: [
                const Text(
                  'Roy O\' Martin Auditorium',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova', // Updated font family
                    color: Color(0xFFD29F13), // Updated text color
                  ),
                ),
                if (solvedItemsNotifier.isSectionCompleted(['Riddle #2']))
                  const Icon(Icons.check, color: Colors.green), // Section checkmark
              ],
            ),
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text(
                      'Riddle #2',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('Riddle #2'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Riddle #2'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Row(
              children: [
                const Text(
                  '2nd Floor',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova', // Updated font family
                    color: Color(0xFFD29F13), // Updated text color
                  ),
                ),
                if (solvedItemsNotifier.isSectionCompleted(['Find the area', 'What day again?']))
                  const Icon(Icons.check, color: Colors.green), // Section checkmark
              ],
            ),
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text(
                      'Find the area',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('Find the area'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Find the area'),
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    const Text(
                      'What day again?',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('What day again?'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'What day again?'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Row(
              children: [
                const Text(
                  'Cambre Atrium',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova', // Updated font family
                    color: Color(0xFFD29F13), // Updated text color
                  ),
                ),
                if (solvedItemsNotifier.isSectionCompleted(['How many?', 'Famous quotes']))
                  const Icon(Icons.check, color: Colors.green), // Section checkmark
              ],
            ),
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text(
                      'How many?',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('How many?'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'How many?'),
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    const Text(
                      'Famous quotes',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('Famous quotes'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Famous quotes'),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Row(
              children: [
                const Text(
                  '3rd Floor',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova', // Updated font family
                    color: Color(0xFFD29F13), // Updated text color
                  ),
                ),
                if (solvedItemsNotifier.isSectionCompleted(['Who are they?']))
                  const Icon(Icons.check, color: Colors.green), // Section checkmark
              ],
            ),
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text(
                      'Who are they?',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova', // Updated font family
                        color: Color(0xFFF1EEDB), // Updated text color
                      ),
                    ),
                    if (solvedItemsNotifier.isSolved('Who are they?'))
                      const Icon(Icons.check, color: Colors.green),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPage(title: 'Who are they?'),
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
    if (title == 'Item 1.1' || title == 'Landmarks') { // Ensure "Landmarks" redirects to Item1_1Page
      return const Item1_3Page(); // Redirect to the custom page for Item 1.1
    } else if (title == 'Item 1.2' || title == 'Food') {
      return const Item1_2Page(); // Redirect to the custom page for Item 1.2
    } else if (title == 'Item 1.3' || title == 'Riddle') {
      return const Item1_1Page(); // Redirect to the custom page for Item 1.3
    } else if (title == 'Item 4.1' || title == 'How many?') {
      return const Item4_1Page(); // Redirect to the custom page for Item 4.1
    } else if (title == 'Item 4.2' || title == 'Famous quotes') {
      return const Item4_2Page(); // Redirect to the custom page for Item 4.2
    } else if (title == 'Item 2.1' || title == 'Riddle #2') {
      return const Item2_1Page(); // Redirect to the custom page for Item 2.1
    } else if (title == 'Item 3.1' || title == 'Find the area') {
      return const Item3_1Page(); // Redirect to the custom page for Item 3.1
    } else if (title == 'Item 3.2' || title == 'What day again?') {
      return const Item3_2Page(); // Redirect to the custom page for Item 3.2
    } else if (title == 'Item 5.1' || title == 'Who are they?') {
      return const Item5_1Page(); // Redirect to the custom page for Item 5.1
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          'This item does not have a custom page.',
          style: TextStyle(fontSize: 20),
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
  int _attempts = 0;
  bool _showHint = false;

  void _checkAnswer() {
    if (_controller.text.trim().toLowerCase() == 'the commons') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Landmarks'); // Mark as solved
      setState(() {
        _feedback = 'Correct! You solved the riddle!';
        _attempts = 0; // Reset attempts
        _showHint = false; // Hide hint
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again!';
        _attempts++;
        if (_attempts >= 3) {
          _showHint = true; // Show hint after 3 incorrect attempts
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Freedom calls, and so do I, \n'
              'Behind the stairs, I’m your go-to spot to try. \n'
              'Relax, recharge, or find your team, \n'
              'What’s the space that fulfills your dream?',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                labelStyle: TextStyle(color: Color(0xFFF1EEDB)), // Updated label color
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Color(0xFFF1EEDB)), // Updated input text color
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
            ),
            if (_showHint) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _feedback = 'Hint: It\'s where you are!';
                  });
                },
                child: const Text('Show Hint'),
              ),
            ],
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
          .markAsSolved('Food'); // Mark as solved
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
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Which of these items are labeled "In Season" in Panera Bread?',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
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
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
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
          .markAsSolved('Riddle'); // Mark as solved
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
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'What are the words written on the statue DIRECTLY behind the Capstone Gallery Stairs?',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
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
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
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
          .markAsSolved('How many?'); // Mark as solved
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
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'How many trashcans and recycle bins (all together) are in the Cambre Atrium?',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
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
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
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
          .markAsSolved('Famous quotes'); // Mark as solved
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
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'What famous(?) quote was said by Herbert Henry Dow?',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                labelStyle: TextStyle(color: Color(0xFFF1EEDB)), // Updated label color
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Color(0xFFF1EEDB)), // Updated input text color
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
            ),
          ],
        ),
      ),
    );
  }
}

class Item2_1Page extends StatefulWidget {
  const Item2_1Page({super.key});

  @override
  State<Item2_1Page> createState() => _Item2_1PageState();
}

class _Item2_1PageState extends State<Item2_1Page> {
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';
  int _attempts = 0;
  bool _showHint = false;

  void _checkAnswer() {
    if (_controller.text.trim().toLowerCase() == 'improving lives. transforming louisiana. changing the world.') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Riddle #2'); // Mark as solved
      setState(() {
        _feedback = 'Correct! You solved the question!';
        _attempts = 0; // Reset attempts
        _showHint = false; // Hide hint
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again!';
        _attempts++;
        if (_attempts >= 3) {
          _showHint = true; // Show hint after 3 incorrect attempts
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C), // Updated background color
      appBar: AppBar(
        title: const Text('Short Answer Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riddle:',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Right across from where ideas ignite, \n'
              'I honor the names that made it right, \n'
              'their impact is big, their message is clear: \n'
              'a better world starts right here. \n'
              'What motto do I hold dear?'
              ,
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                labelStyle: TextStyle(color: Color(0xFFF1EEDB)), // Updated label color
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Color(0xFFF1EEDB)), // Updated input text color
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)),
            ),
            if (_showHint) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _feedback = 'Hint: Examine the Donor Wall closely. There is something there that isn\'t like the others...';
                  });
                },
                child: const Text('Show Hint'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Item3_1Page extends StatefulWidget {
  const Item3_1Page({super.key});

  @override
  State<Item3_1Page> createState() => _Item3_1PageState();
}

class _Item3_1PageState extends State<Item3_1Page> {
  String _feedback = '';

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == 'Choice 2') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Find the area'); // Mark as solved
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
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'There is a car somewhere in PFT. Where can that car be found?',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 1'),
              child: const Text('2219'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 2'),
              child: const Text('2215'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 3'),
              child: const Text('2240'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _checkAnswer('Choice 4'),
              child: const Text('You\'re lying, there is no car in PFT!'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
            ),
          ],
        ),
      ),
    );
  }
}

class Item3_2Page extends StatefulWidget {
  const Item3_2Page({super.key});

  @override
  State<Item3_2Page> createState() => _Item3_2PageState();
}

class _Item3_2PageState extends State<Item3_2Page> {
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';

  void _checkAnswer() {
    if (_controller.text.trim().toLowerCase() == 'friday') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('What day again?'); // Mark as solved
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
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The 2326 Lab is only open on a certain day. What day is that?',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                labelStyle: TextStyle(color: Color(0xFFF1EEDB)), // Updated label color
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Color(0xFFF1EEDB)), // Updated input text color
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
            ),
          ],
        ),
      ),
    );
  }
}

class Item5_1Page extends StatefulWidget {
  const Item5_1Page({super.key});

  @override
  State<Item5_1Page> createState() => _Item5_1PageState();
}

class _Item5_1PageState extends State<Item5_1Page> {
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';

  void _checkAnswer() {
    if (_controller.text.trim().toLowerCase() == 'benjamin c. craft and murray f. hawkins, jr.') {
      Provider.of<SolvedItemsNotifier>(context, listen: false)
          .markAsSolved('Who are they?'); // Mark as solved
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
      backgroundColor: const Color(0xFF461D7C), // Updated background color
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
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'There are two distinct individuals who have busts on them showcased on the 3rd floor. Who are these individuals? (write their names exactly as written, use "and" to separate their names)',
              style: TextStyle(
                fontFamily: 'Proxima Nova', // Updated font family
                fontSize: 18,
                color: Color(0xFFF1EEDB),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                labelStyle: TextStyle(color: Color(0xFFF1EEDB)), // Updated label color
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Color(0xFFF1EEDB)), // Updated input text color
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Color(0xFFF1EEDB)), // Updated color
            ),
          ],
        ),
      ),
    );
  }
}