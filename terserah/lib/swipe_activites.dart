import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'dart:async';

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
      appBar: AppBar(
        title: Text('Eksplor'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SizedBox(
          width: 350, // Fixed width
          height: 600, // Fixed height
          child: SwipableStack(
            controller: controller,
            itemCount: infiniteImages.length,
            onSwipeCompleted: (index, direction) {
              // Handle swipe complete action here
              if (direction != SwipeDirection.left && direction != SwipeDirection.right) {
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
                    SizedBox(height: 8),
                    // Expandable Description
                    if (widget.isExpanded)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Expand/Collapse Arrow
            Positioned(
              bottom: 8,
              right: 8,
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
    );
  }
}
