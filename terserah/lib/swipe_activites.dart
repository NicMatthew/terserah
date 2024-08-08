import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'dart:async';
import 'result.dart'; // Import the result page

class SwipeCardDemo extends StatefulWidget {
  @override
  _SwipeCardDemoState createState() => _SwipeCardDemoState();
}

class _SwipeCardDemoState extends State<SwipeCardDemo> {
  List<String> images = [
    'assets/ayam.jpg',
    'assets/sate.jpg',
    'assets/soto.jpeg',
    // Add more images if needed
  ];

  List<String> foodsOrActivities = [
    'Nasi Goreng',
    'Sate Ayam',
    'Spaghetti',
    // Add more food or activity names if needed
  ];

  List<String> categories = [
    'Makanan',
    'Makanan',
    'Makanan',
    // Add more categories if needed
  ];

  List<String> descriptions = [
    'Deskripsi Nasi Goreng. Rating: 4.5/5',
    'Deskripsi Sate Ayam. Rating: 4.7/5',
    'Deskripsi Spaghetti. Rating: 4.6/5',
    // Add more descriptions if needed
  ];

  late Timer _timer;

  // Map to track expanded states
  Map<int, bool> _expandedStates = {};

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 3), () {
      setState(() {
        // Instructions have been removed
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = SwipableStackController();

    // Repeat the lists to simulate infinite scrolling
    final infiniteImages = List<String>.generate(
      100, // Adjust the number as needed
          (index) => images[index % images.length],
    );
    final infiniteFoodsOrActivities = List<String>.generate(
      100, // Adjust the number as needed
          (index) => foodsOrActivities[index % foodsOrActivities.length],
    );
    final infiniteCategories = List<String>.generate(
      100, // Adjust the number as needed
          (index) => categories[index % categories.length],
    );
    final infiniteDescriptions = List<String>.generate(
      100, // Adjust the number as needed
          (index) => descriptions[index % descriptions.length],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 241, 239, 1),
      body: Column(
        children: [
          // Header
          Container(
            color: Color.fromRGBO(236, 241, 239, 1),
            padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color.fromRGBO(65, 139, 140, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Text(
                    'Eksplor',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(65, 139, 140, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 48), // To balance the space taken by the back button
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 350, // Fixed width
                height: 600, // Fixed height
                child: SwipableStack(
                  controller: controller,
                  itemCount: infiniteImages.length,
                  onSwipeCompleted: (index, direction) {
                    // Handle swipe complete action here
                    if (direction == SwipeDirection.right) {
                      _showConfirmationDialog(context);
                    } else if (direction != SwipeDirection.left) {
                      controller.rewind(); // Rewind if not left or right swipe
                    }
                  },
                  builder: (context, properties) {
                    final index = properties.index % infiniteImages.length;

                    return StatefulBuilder(
                      builder: (context, setState) {
                        return CardWidget(
                          index: index,
                          image: infiniteImages[index],
                          category: infiniteCategories[index],
                          name: infiniteFoodsOrActivities[index],
                          description: infiniteDescriptions[index],
                          isExpanded: _expandedStates[index] ?? false,
                          onToggleDescription: () {
                            setState(() {
                              _expandedStates[index] = !(_expandedStates[index] ?? false);
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(236, 241, 239, 1), // Background color similar to the image
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          title: Text(
            'Sudah yakin dengan pilihan kamu?',
            textAlign: TextAlign.center, // Center the title text
            style: TextStyle(
              color: Color.fromRGBO(65, 139, 140, 1), // Text color matching the image
              fontSize: 18.0, // Font size
              fontWeight: FontWeight.bold, // Font weight
            ),
          ),
          actionsAlignment: MainAxisAlignment.center, // Center the actions
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background for "Coba lagi"
                side: BorderSide(
                  color: Color.fromRGBO(65, 139, 140, 1), // Border color matching the image
                  width: 2.0, // Border width
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Button padding
              ),
              child: Text(
                'Coba lagi',
                style: TextStyle(
                  color: Color.fromRGBO(65, 139, 140, 1), // Text color matching the border
                  fontSize: 16.0, // Font size
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 10), // Space between buttons
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(65, 139, 140, 1), // Background color matching the image
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Button padding
              ),
              child: Text(
                'Yakin',
                style: TextStyle(
                  color: Colors.white, // Text color for "Yakin"
                  fontSize: 16.0, // Font size
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

}

class CardWidget extends StatefulWidget {
  final int index;
  final String image;
  final String category;
  final String name;
  final String description;
  final bool isExpanded;
  final VoidCallback onToggleDescription;

  CardWidget({
    required this.index,
    required this.image,
    required this.category,
    required this.name,
    required this.description,
    required this.isExpanded,
    required this.onToggleDescription,
  });

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onToggleDescription,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 8)],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover, // Cover the entire card
              ),
            ),
            // Overlay with gradient background
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Color(0xFF418B8C)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category
                    Text(
                      widget.category,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Name of activity or food
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // Expandable Description with animation
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: widget.isExpanded ? 30 : 0, // Animate height
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: widget.isExpanded
                            ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                            : SizedBox.shrink(),
                      ),
                    ),
                    // Arrow in the center at the bottom
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: widget.onToggleDescription,
                        child: Icon(
                          widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
