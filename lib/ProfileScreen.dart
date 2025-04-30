import 'package:flutter/material.dart';

class ProfileChange extends StatefulWidget {
  final Map<String, String>? data;
  const ProfileChange({super.key, this.data});

  @override
  State<ProfileChange> createState() => _ProfileChangeState();
}

class _ProfileChangeState extends State<ProfileChange> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    String email = widget.data?['email'] ?? 'tidak ada email';

    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 37, 37, 37) : Colors.white,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        leading: const SizedBox.shrink(),
        backgroundColor: Colors.blue,
        actions: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Switch(value: isDarkMode, onChanged: (bool value) {
              setState(() {
                isDarkMode = value;
              });
            }, 
            activeColor: Colors.white,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const CircleAvatar(
                  radius: 100,
                  backgroundColor: Color.fromARGB(255, 69, 165, 255),
                  child: CircleAvatar(
                    radius: 95,
                    backgroundColor: Color.fromARGB(255, 160, 160, 160),
                    backgroundImage: AssetImage('assets/images/image.png'),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 24,
                        color: isDarkMode ? Colors.white : Color.fromARGB(255, 60, 60, 60),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Programmer',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white : Color.fromARGB(255, 60, 60, 60),
                  ),
                ),
                Text(
                  'Surakarta, Indonesia',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white : Color.fromARGB(255, 60, 60, 60),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}