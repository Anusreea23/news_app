import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: Icon(
          Icons.person,
          color: Colors.white,
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Name'),
            subtitle: Text('John Doe'),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text('johndoe@example.com'),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text('Phone Number'),
            subtitle: Text('+123 456 7890'),
            leading: Icon(Icons.phone),
          ),
          // Add more ListTiles as needed
          ListTile(
            title: Text('Address'),
            subtitle: Text('123 Main St, Anytown, USA'),
            leading: Icon(Icons.location_on),
          ),
          ListTile(
            title: Text('Date of Birth'),
            subtitle: Text('January 1, 1990'),
            leading: Icon(Icons.cake),
          ),
        ],
      ),
    );
  }
}
