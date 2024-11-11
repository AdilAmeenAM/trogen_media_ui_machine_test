import 'package:flutter/material.dart';
import 'package:ui_machine_test/view/pages/subscription_page.dart';
import 'package:ui_machine_test/view/widgets/home_page_card_widget.dart';

class FlashCardHomePage extends StatelessWidget {
  const FlashCardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Flash Card',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const SubscriptionPage();
                },
              ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Flash Card Categories
            Expanded(
              child: ListView(
                children: const [
                  HomePageCardWidget(
                    title: 'Everyday Phrases',
                    subtitle:
                        'Master Common Expressions Used In Daily Conversations.',
                  ),
                  SizedBox(height: 16),
                  HomePageCardWidget(
                    title: 'Travel Vocabulary',
                    subtitle: 'Essential Words And Phrases For Your Next Trip.',
                  ),
                  SizedBox(height: 16),
                  HomePageCardWidget(
                    title: 'Business English',
                    subtitle:
                        'Key Terms And Dialogues For Professional Settings.',
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
