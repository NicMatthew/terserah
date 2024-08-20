import 'package:flutter/material.dart';
import 'package:terserah/edit_profile.dart';
import 'package:terserah/home.dart';

class MyAppProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(65, 139, 140, 1)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAppHome()),
            );
          },
        ),
        title: Center(
          child: Container(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              "Profil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(65, 139, 140, 1), // Adjust color as needed
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false, // Add this to prevent the title from being pushed to the left
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 16),
            Text(
              "Cocok Sebelumnya",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(65, 139, 140, 1),
              ),
            ),
            SizedBox(height: 16),
            CategorySelector(),
            SizedBox(height: 16),
            Expanded(child: RecommendationList()),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Color.fromRGBO(179, 211, 200, 1),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mitiuw Salim",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(65, 139, 140, 1),
              ),
            ),
            // Add some space between the icon and text
            Text(
              "Jakarta, Indonesia",
              style: TextStyle(
                color: Color.fromRGBO(65, 139, 140, 1),
              ),
            ),
            Text(
              "Jomblo",
              style: TextStyle(
                color: Color.fromRGBO(179, 211, 200, 1),
              ),
            ),
          ],
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UbahProfilPage(),
              ),
            );
          },
          child: Icon(Icons.edit, color: Color.fromRGBO(65, 139, 140, 1)),
        ),
      ],
    );
  }
}

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(text: "Semua"),
          SizedBox(width: 8), // Adjust the width as needed
          CategoryButton(text: "Makan"),
          SizedBox(width: 8),
          CategoryButton(text: "Olahraga"),
          SizedBox(width: 8),
          CategoryButton(text: "Rekreasi"),
          SizedBox(width: 8),
          // Add more buttons if needed
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;

  CategoryButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(65, 139, 140, 1), // background
        foregroundColor: Colors.white, // foreground
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

class RecommendationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Number of items in the list
      itemBuilder: (context, index) {
        return RecommendationCard();
      },
    );
  }
}

class RecommendationCard extends StatefulWidget {
  @override
  _RecommendationCardState createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(15), // Adjust the radius to your needs
          child: Image.asset(
            'assets/images/marugame.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover, // Ensures the image covers the rounded area
          ),
        ),
        title: Text(
          "Marugame Udon",
          style: TextStyle(
            color: Color.fromRGBO(65, 139, 140, 1),
          ),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Color.fromRGBO(65, 139, 140, 1),
              size: 16,
            ),
            SizedBox(width: 8),
            Text(
              "Central Park Mall, Lt. LG",
              style: TextStyle(
                color: Color.fromRGBO(65, 139, 140, 1),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            _isFavorited ? Icons.favorite : Icons.favorite_border,
            color: Color.fromRGBO(65, 139, 140, 1),
          ),
          onPressed: _toggleFavorite,
        ),
      ),
    );
  }
}
