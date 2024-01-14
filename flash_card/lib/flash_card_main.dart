import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flash_card/flash_cardsql.dart';
import 'package:flash_card/card_view.dart';



class FlashcardPage extends StatefulWidget {
  final List<Flashcard> flashcards;

  FlashcardPage({required this.flashcards});

  @override
  _FlashcardPageState createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  int _currIndex = 0;


  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.flashcards.isNotEmpty)
              SizedBox(
                width: 300,
                height: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: FlipCard(
                        key: cardKey,
                        front: FlashCardView(text: widget.flashcards[_currIndex].question),
                        back: FlashCardView(text: widget.flashcards[_currIndex].answer),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          dltCard(widget.flashcards, widget.flashcards[_currIndex].id);
                        },
                        icon: Icon(Icons.delete),
                        label: Text('Delete Card'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (widget.flashcards.isNotEmpty)
                    OutlinedButton(
                      onPressed: prevCard,
                      child: const Icon(Icons.chevron_left),
                    ),
                  if (widget.flashcards.isNotEmpty)
                    OutlinedButton(
                      onPressed: nextCard,
                      child: const Icon(Icons.chevron_right),
                    ),

                ],
              )
            ],
          ),
        ),
      ),

    );
  }

  void dltCard(List<Flashcard> carDs, int selectedId) {
    SqliteService sqliteService = SqliteService();
    setState(() {
      carDs.removeWhere((flashcard) => flashcard.id == selectedId);
      sqliteService.deleteFlashcard(selectedId);
    });
  }

  Future<void> prevCard() async {
    if (!cardKey.currentState!.isFront) {
      await cardKey.currentState!.toggleCard();
    }

    setState(() {
      _currIndex = (_currIndex - 1 >= 0) ? _currIndex - 1 : widget.flashcards.length - 1;
    });
  }

  Future<void> nextCard() async {
    if (!cardKey.currentState!.isFront) {
      await cardKey.currentState!.toggleCard();
    }

    setState(() {
      _currIndex = (_currIndex + 1 < widget.flashcards.length) ? _currIndex + 1 : 0;
    });
  }

}
