import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ui_machine_test/view/pages/chat_page.dart';
import 'package:ui_machine_test/view/widgets/card_content_widget.dart';

class FlashCardPage extends StatefulWidget {
  const FlashCardPage({super.key});

  @override
  State<FlashCardPage> createState() => _FlashCardPageState();
}

class _FlashCardPageState extends State<FlashCardPage> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  final List<String> flashcards = [
    'Obvio',
    'Por Favor',
    'Gracias',
    'De Nada',
    'Hola',
    'Adiós',
    'Perdón',
    'Salud',
    'Bienvenido',
    'Amor',
    'Paz',
    'Amigo',
    'Familia',
    'Trabajo',
    'Fiesta'
  ];

  final List<String> phrasesMeaning = [
    "Obvious; something that is clear or easily understood.",
    "Por Favor: Please; a polite way to ask for something.",
    "Gracias: Thank you; an expression of gratitude.",
    "De Nada: You're welcome; a response to 'gracias'.",
    "Hola: Hello; a greeting used to say hi.",
    "Adiós: Goodbye; a way to bid farewell.",
    "Perdón: Sorry; an expression of regret.",
    "Salud: Cheers; a toast to good health.",
    "Bienvenido: Welcome; a greeting used to welcome someone.",
    "Amor: Love; a strong feeling of affection.",
    "Paz: Peace; a state of tranquility and calmness.",
    "Amigo: Friend; a person with whom one has a strong bond.",
    "Familia: Family; a group of people related by blood or marriage.",
    "Trabajo: Work; an activity that earns a living.",
    "Fiesta: Party; a social gathering with music and dancing.",
  ];

  void nextCard() {
    if (currentIndex < flashcards.length - 1) {
      setState(() {
        currentIndex++;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return const ChatPage();
        },
      ));
    }
  }

  void previousCard() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header with curved background
          Stack(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(300),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      const Text(
                        'Flash Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Progress and category text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Everyday Phrases",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 8.0,
                percent: (currentIndex + 1) / flashcards.length,
                center: Text('${currentIndex + 1}/${flashcards.length}'),
                progressColor: Colors.purple,
                backgroundColor: Colors.grey,
              ),
            ],
          ),

          Expanded(
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: flashcards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 100),
                    child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: CardContentWidget(
                          side: "Front", text: flashcards[currentIndex]),
                      back: CardContentWidget(
                          side: "Back", text: phrasesMeaning[currentIndex]),
                    ),
                  );
                }),
          ),
          // Navigation buttons

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: previousCard,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  side: const BorderSide(color: Colors.purple),
                ),
                child: const Text('Previous'),
              ),
              OutlinedButton(
                onPressed: nextCard,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  side: const BorderSide(color: Colors.purple),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
