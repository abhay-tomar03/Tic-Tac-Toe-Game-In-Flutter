import 'package:flutter/material.dart';

import 'game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String X = 'X';
  String O = 'O';

  bool changeButton1 = false;
  bool changeButton2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFff4b4b),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/image.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Arial',
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Center(
              child: Text(
                'Select Your Symbol',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Arial',
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  setState(() {
                    changeButton1 = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                        settings: RouteSettings(arguments: X),
                      ),
                    );
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: changeButton1 ? 50 : 150,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(changeButton1 ? 50 : 8),
                  ),
                  child: changeButton1
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : const Text(
                          "Symbol X",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Arial',
                          ),
                        ),
                ),
              )
            ),
            const SizedBox(
              height: 30,
              width: 20,
            ),
             Center(
                child: InkWell(
              onTap: () async {
                setState(() {
                  changeButton2 = true;
                });
                await Future.delayed(const Duration(seconds: 2));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GamePage(),
                    settings: RouteSettings(arguments: X),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: changeButton2 ? 50 : 150,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(changeButton2 ? 50 : 8),
                ),
                child: changeButton2
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : const Text(
                        "Symbol O",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Arial',
                        ),
                      ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
