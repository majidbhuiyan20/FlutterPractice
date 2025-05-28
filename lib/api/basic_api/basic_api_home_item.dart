import 'package:flutter/material.dart';
import 'package:flutter_practice/api/basic_api/basic_api_home_page.dart';
class BasicApiHomeItem extends StatefulWidget {
  final String title;
  final String body;
  const BasicApiHomeItem({super.key, required this.title, required this.body});

  @override
  State<BasicApiHomeItem> createState() => _BasicApiHomeItemState();
}

class _BasicApiHomeItemState extends State<BasicApiHomeItem> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "BASIC API",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            const SizedBox(height: 4),
            const Text(
              "Fetching and displaying data from a simple API",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title, // Use widget.title
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              widget.body, // Use widget.body
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

}
