import 'package:flutter/material.dart';
import 'package:flash_card/flash_cardsql.dart';
import 'package:flash_card/flash_card_main.dart';



mixin FlashcardDialogMixin<T extends StatefulWidget> on State<T> {

  void _showAddFlashcardDialog(List<Flashcard> carDs, int i) {
    TextEditingController questionController = TextEditingController();
    TextEditingController answerController = TextEditingController();
    SqliteService sqliteService = SqliteService();
    print(i);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Flashcard"),
          content: SizedBox(
            width: 300.0,
            height: 200.0,
            child: Column(
              children: [
                TextField(
                  controller: questionController,
                  decoration: const InputDecoration(labelText: "Question"),
                ),
                TextField(
                  controller: answerController,
                  decoration: const InputDecoration(labelText: "Answer"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  carDs.add(
                    Flashcard(
                      id: i,
                      question: '<h3>${questionController.text}</h3>',
                      answer: '<h3>${answerController.text}</h3>',
                    ),
                  );
                  sqliteService.createFlashcard(Flashcard(
                      id: i,
                      question: '<h3>${questionController.text}</h3>',
                      answer: r"""<h3>${answerController.text}</h3>"""));
                });
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  int calculateNewId(String j, int i) {
    int newId = i + 1;
    String newIdstring = "$j$newId";

    int y = int.parse(newIdstring);

    return y;
  }





}

class Chemistry extends StatefulWidget {
  final SqliteService sqliteService = SqliteService();
  final List<Flashcard> carDs = [
    Flashcard(
      id: 11,
      question: r"""<h3>Choose the correct mathematical form of Bohr's Radius.</h3>""", // added to show the latex functionality
      answer: r""" <h2> \( a_0 = \frac{{\hbar ^2 }}{{m_e ke^2 }} \)</h2>""", // added to show the latex functionality
    ),
    Flashcard(
      id: 12,
      question: r"""<h3>What is the formula for the rate of a chemical reaction?</h3>""", // added to show the latex functionality
      answer: r"""<h2> Rate of Reaction: \(rate = k[A]^m[B]^n\)</h2>""",), // added to show the latex functionality

  ];

  Chemistry({super.key});

  @override
  _ChemistryState createState() => _ChemistryState();
}

class _ChemistryState extends State<Chemistry>
    with FlashcardDialogMixin<Chemistry> {

  @override
  void initState() {
    super.initState();
    loadFlashcards();
  }

  Future<void> loadFlashcards() async {
    List<Flashcard> allFlashcards = await widget.sqliteService.getFlashcards(1);
    List<Flashcard> mathFlashcards = allFlashcards;


    setState(() {
      widget.carDs.addAll(mathFlashcards);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.carDs.isNotEmpty)
              Expanded(
                child: FlashcardPage(flashcards: widget.carDs),
              ),
            ElevatedButton.icon(
              onPressed: () {
                int newId = calculateNewId("1", widget.carDs.length);
                _showAddFlashcardDialog(widget.carDs, newId);
              },
              icon: const Icon(Icons.add,),
              label: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

class Cs extends StatefulWidget {
  final SqliteService sqliteService = SqliteService();
  final List<Flashcard> carDs = [
    Flashcard(
      id: 21,
      question: r"""<h3>Explain the Binary Search Algorithm.</h3>""",  // added to show the latex functionality
      answer: r"""<h2>Binary Search: \(T(n) = T\left(\frac{n}{2}\right) + 1\)</h2>""", // added to show the latex functionality
    ),
    Flashcard(
      id: 22,
      question: r"""<h3>Define a Node structure for a Linked List in C++.</h3>""", // added to show the latex functionality
      answer: r"""<h2>Node Structure: <code>struct Node { int data; Node* next; }</code></h2>""", // added to show the latex functionality
    ),
  ];

  @override
  _CsState createState() => _CsState();
}

class _CsState extends State<Cs> with FlashcardDialogMixin<Cs> {

  @override
  void initState() {
    super.initState();
    loadFlashcards();
  }

  Future<void> loadFlashcards() async {
    List<Flashcard> allFlashcards = await widget.sqliteService.getFlashcards(2);
    List<Flashcard> mathFlashcards = allFlashcards;


    setState(() {
      widget.carDs.addAll(mathFlashcards);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.carDs.isNotEmpty)
              Expanded(
                child: FlashcardPage(flashcards: widget.carDs),
              ),
            ElevatedButton.icon(
              onPressed: () {
                int newId = calculateNewId("2", widget.carDs.length);
                _showAddFlashcardDialog(widget.carDs, newId);
              },
              icon: const Icon(Icons.add,),
              label: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

class Eee extends StatefulWidget {
  final SqliteService sqliteService = SqliteService();
  final List<Flashcard> carDs = [
    Flashcard(
      id: 31,
      question: r"""<h3>What is the transfer function of a first-order low-pass filter?</h3>""", // added to show the latex functionality
      answer: r"""<h2> \(H(s) = \frac{1}{1 + sT}\)</h2>""", // added to show the latex functionality
    ),
    Flashcard(
      id: 32,
      question: r"""<h3>Define the time constant (\(\tau\)) for an RC circuit.</h3>""", // added to show the latex functionality
      answer: r"""<h2> \(\tau = R \cdot C\)</h2>""", // added to show the latex functionality
    )


  ];

  @override
  _EeeState createState() => _EeeState();
}

class _EeeState extends State<Eee> with FlashcardDialogMixin<Eee> {

  @override
  void initState() {
    super.initState();
    loadFlashcards();
  }

  Future<void> loadFlashcards() async {
    List<Flashcard> allFlashcards = await widget.sqliteService.getFlashcards(3);
    List<Flashcard> mathFlashcards = allFlashcards;


    setState(() {
      widget.carDs.addAll(mathFlashcards);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.carDs.isNotEmpty)
              Expanded(
                child: FlashcardPage(flashcards: widget.carDs),
              ),
            ElevatedButton.icon(
              onPressed: () {
                int newId = calculateNewId("3", widget.carDs.length);
                _showAddFlashcardDialog(widget.carDs, newId);
              },
              icon: const Icon(Icons.add,),
              label: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

class Math extends StatefulWidget {
  final SqliteService sqliteService = SqliteService();
  final List<Flashcard> carDs = [
    Flashcard(
      id:41 ,
      question: r"""<h3>What is the correct form of quadratic formula?</h3>""", // added to show the latex functionality
      answer:  r""" <h2> \(x = {-b \pm \sqrt{b^2-4ac} \over 2a}\)</h2>""", // added to show the latex functionality
    ),
    Flashcard(
      id: 42,
      question: r"""<h3>What is Taylor's Series Expansion Formula?</h3>""", // added to show the latex functionality
      answer: r"""<h4>\( f(x) = f(a) + f'(a)(x - a) + \frac{f''(a)(x - a)^2}{2!} + \frac{f'''(a)(x - a)^3}{3!} + \ldots \)</h4>""", // added to show the latex functionality
    ),
  ];

  @override
  _MathState createState() => _MathState();
}

class _MathState extends State<Math> with FlashcardDialogMixin<Math> {
  @override
  void initState() {
    super.initState();
    loadFlashcards();
  }

  Future<void> loadFlashcards() async {
    List<Flashcard> allFlashcards = await widget.sqliteService.getFlashcards(4);
    List<Flashcard> mathFlashcards = allFlashcards;


    setState(() {
      widget.carDs.addAll(mathFlashcards);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.carDs.isNotEmpty)
              Expanded(
                child: FlashcardPage(flashcards: widget.carDs),
              ),
            ElevatedButton.icon(
              onPressed: () {
                int newId = calculateNewId("4", widget.carDs.length);
                _showAddFlashcardDialog(widget.carDs, newId);
              },
              icon: const Icon(Icons.add,),
              label: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}


class Physics extends StatefulWidget {
  final SqliteService sqliteService = SqliteService();
  final List<Flashcard> carDs = [
    Flashcard(
      id: 51,
      question: r"""<h3>What is the equation for energy in quantum mechanics?</h3>""", // added to show the latex functionality
      answer: r"""<h2>\( E = hf \)</h2>""", // added to show the latex functionality
    ),
    Flashcard(
      id: 52,
      question: r"""<h3>What is the formula for the speed of light in a vacuum?</h3>""", // added to show the latex functionality
      answer: r"""<h2>\( c = \frac{1}{{\sqrt{\varepsilon_0 \mu_0}}} \)</h2>""", // added to show the latex functionality
    ),
  ];

  @override
  _PhysicsState createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> with FlashcardDialogMixin<Physics> {
  @override
  void initState() {
    super.initState();
    loadFlashcards();
  }

  Future<void> loadFlashcards() async {
    List<Flashcard> allFlashcards = await widget.sqliteService.getFlashcards(5);
    List<Flashcard> mathFlashcards = allFlashcards;


    setState(() {
      widget.carDs.addAll(mathFlashcards);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.carDs.isNotEmpty)
              Expanded(
                child: FlashcardPage(flashcards: widget.carDs),
              ),
            ElevatedButton.icon(
              onPressed: () {
                int newId = calculateNewId("5", widget.carDs.length);
                _showAddFlashcardDialog(widget.carDs, newId);
              },
              icon: const Icon(Icons.add,),
              label: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
