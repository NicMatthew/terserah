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
    'Nasi goreng adalah hidangan khas Indonesia berupa nasi yang digoreng dengan bumbu seperti bawang putih, kecap manis, dan cabai, menghasilkan rasa gurih dan sedikit pedas. Biasanya disajikan dengan telur, ayam, atau udang, dan menjadi pilihan populer untuk sarapan atau makan malam.',
    'Sate ayam adalah potongan daging ayam yang dipanggang di atas arang, disajikan dengan saus kacang yang manis dan gurih. Hidangan khas Indonesia ini sering dinikmati sebagai makanan ringan atau lauk, dan terkenal dengan aroma dan rasanya yang menggugah selera.',
    'Spageti adalah pasta khas Italia yang berupa mie panjang dan biasanya disajikan dengan saus seperti bolognese atau carbonara. Hidangan ini terkenal di seluruh dunia karena rasanya yang lezat dan cocok dinikmati sebagai makan siang atau makan malam.',
    // Add more descriptions if needed
  ];

  // List to determine which logo to show (null means no logo)
  List<String?> logos = [
    'assets/love-icon.png',  // Show heart icon
    null,                // No icon
    'assets/fire-icon.png',   // Show fire icon
    // Add more logos if needed
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
    final infiniteLogos = List<String?>.generate(
      100, // Adjust the number as needed
          (index) => logos[index % logos.length],
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
                  allowVerticalSwipe: false,
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
                          logo: infiniteLogos[index],
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
                // Navigate to the result page or perform any action here
              },
            ),
          ],
        );
      },
    );
  }

}

class CardWidget extends StatelessWidget {
  final int index;
  final String image;
  final String category;
  final String name;
  final String description;
  final String? logo;
  final bool isExpanded;
  final VoidCallback onToggleDescription;

  CardWidget({
    required this.index,
    required this.image,
    required this.category,
    required this.name,
    required this.description,
    required this.logo,
    required this.isExpanded,
    required this.onToggleDescription,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggleDescription,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            // Image and overlay
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Content
            Positioned(
              left: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isExpanded)
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Heart or fire logo
            if (logo != null)
              Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    logo!,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
