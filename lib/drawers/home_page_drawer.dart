import 'package:flutter/material.dart';

class HomePageDrawer extends StatefulWidget {
  const HomePageDrawer({super.key});

  @override
  State<HomePageDrawer> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 64,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                tileColor: const Color.fromARGB(255, 177, 180, 207),
                splashColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                leading: Icon(
                  Icons.error,
                  size: 40,
                  color: Colors.blueGrey[900],
                ),
                title: const Text(
                  "About App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/intro");
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    "Dark Mode",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Switch(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value;
                      });
                    },
                    activeColor: Colors.blueGrey[900],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
