import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.height * 1,
          height: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              border: Border.all(
            width: 5,
            color: Colors.blue,
          )),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
