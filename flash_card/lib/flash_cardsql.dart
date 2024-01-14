import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Flashcard {
  final int id;
  final String question;
  final String answer;

  Flashcard({required this.id, required this.question, required this.answer});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'question': question,
      'answer': answer,
    };
  }

  Flashcard.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        question = map['question'],
        answer = map['answer'];
}

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    print(path);
    print("\n");
    print("\n");
    print("\n");
    return openDatabase(
      join(path, 'flashcards.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Flashcards(id INTEGER PRIMARY KEY NOT NULL, question TEXT NOT NULL, answer TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> createFlashcard(Flashcard flashcard) async {
    final Database db = await initializeDB();
    return await db.insert(
      'Flashcards',
      flashcard.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Flashcard>> getFlashcards(int startDigit) async {
    final db = await initializeDB();

    final List<Map<String, dynamic>> queryResult = await db.query(
      'Flashcards',
      where: 'id LIKE ?',
      whereArgs: ['$startDigit%'],
      orderBy: 'id',
    );

    return queryResult.map((map) => Flashcard.fromMap(map)).toList();
  }


  Future<void> deleteFlashcard(int id) async {
    final db = await initializeDB();
    try {
      print("\n");
      print("\n");
      print("\n");
      print(id);
      print("its in the delete option");
      print("\n");
      print("\n");
      print("\n");
      print("\n");
      print("\n");
      print("\n");
      await db.delete("Flashcards", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting a flashcard: $err");
    }
  }
}
