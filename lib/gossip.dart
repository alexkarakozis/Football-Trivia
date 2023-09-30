import 'package:flutter/material.dart';
import 'package:playerid/answer.dart';
import 'package:playerid/user_tracker.dart';

class Gossip extends StatefulWidget {
  @override
  State<Gossip> createState() => _GossipState();
}

class _GossipState extends State<Gossip> {
  late int _questionIndex;
  int selectedIndex = -1;
  bool endOfQuiz = false;

  @override
  void initState() {
    super.initState();
    _questionIndex = UserTracker.getGossipIndex();
    if (_questionIndex == _questions.length) {
      _questionIndex = _questions.length - 1;
    }
  }

  void questionAnswered() async {
    setState(() {
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });

    await UserTracker.setGossipIndex(_questionIndex + 1);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      endOfQuiz = false;
    });

    UserTracker.setGossipIndex(0);
  }

  void nextQuestion() {
    setState(() {
      _questionIndex++;
      selectedIndex = -1;
    });

    if (_questionIndex >= _questions.length) {
      resetQuiz();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question: ${_questionIndex + 1}/${_questions.length}',
          style: TextStyle(
              fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(14, 30, 91, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 180.0,
              margin: EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
              child: Center(
                  child: Text(
                _questions[_questionIndex]['question'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ))),
          ...(_questions[_questionIndex]['answers'] as List<String>).map(
              (answer) => Answer(
                  answerText: answer,
                  answerTap: () {
                    if (selectedIndex != -1) {
                      return;
                    }
                    selectedIndex =
                        (_questions[_questionIndex]['answers'] as List<String>)
                            .indexOf(answer);
                    questionAnswered();
                  },
                  boxColor: selectedIndex != -1 &&
                          _questions[_questionIndex]['correctIndex'] ==
                              (_questions[_questionIndex]['answers']
                                      as List<String>)
                                  .indexOf(answer)
                      ? Colors.green
                      : selectedIndex ==
                                  (_questions[_questionIndex]['answers']
                                          as List<String>)
                                      .indexOf(answer) &&
                              _questions[_questionIndex]['correctIndex'] !=
                                  (_questions[_questionIndex]['answers']
                                          as List<String>)
                                      .indexOf(answer)
                          ? Colors.red
                          : Color.fromRGBO(53, 98, 166, 1))),
          const SizedBox(height: 50.0),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (selectedIndex == -1) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Please select an answer before going to next question')));
                              return;
                            }
                            nextQuestion();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(101, 148, 192, 0.8)),
                          child: Text(
                              endOfQuiz ? 'Restart Quiz' : 'Next Question',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white))))))
        ],
      )),
    );
  }
}

int getGossipLength() {
  return _questions.length;
}

List<Map<String, dynamic>> _questions = [
  {
    "question":
        "Which Premier League player is commonly known by the nickname 'The Beast'?",
    "answers": [
      "Adebayo Akinfenwa",
      "Troy Deeney",
      "Romelu Lukaku",
      "Christian Benteke"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Which Premier League player is often referred to as 'The Magician'?",
    "answers": [
      "David Silva",
      "Mesut Ozil",
      "Bernardo Silva",
      "Philippe Coutinho"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Which Premier League player is commonly called 'The Flying Dutchman'?",
    "answers": [
      "Virgil van Dijk",
      "Georginio Wijnaldum",
      "Memphis Depay",
      "Robin van Persie"
    ],
    "correctIndex": 3
  },
  {
    "question":
        "Which Premier League player is known by the nickname 'The King of Egypt'?",
    "answers": [
      "Mohamed Salah",
      "Sadio Mane",
      "Pierre-Emerick Aubameyang",
      "Riyad Mahrez"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Which Premier League player is often referred to as 'The Spider'?",
    "answers": ["Hugo Lloris", "David de Gea", "Ederson", "Alisson Becker"],
    "correctIndex": 3
  },
  {
    "question":
        "Which Premier League player is commonly known as 'The Baby-Faced Assassin'?",
    "answers": [
      "Marcus Rashford",
      "Anthony Martial",
      "Mason Greenwood",
      "Ole Gunnar Solskjaer"
    ],
    "correctIndex": 3
  },
  {
    "question":
        "Which Premier League player is often called 'The Fox in the Box'?",
    "answers": [
      "Jamie Vardy",
      "Harry Kane",
      "Sergio Aguero",
      "Roberto Firmino"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Which Premier League player is commonly known by the nickname 'The Iceman'?",
    "answers": [
      "Gylfi Sigurdsson",
      "Son Heung-min",
      "Wilfried Zaha",
      "Harry Maguire"
    ],
    "correctIndex": 1
  },
  {
    "question":
        "Which Premier League player is often referred to as 'The Belgian Maestro'?",
    "answers": [
      "Eden Hazard",
      "Kevin De Bruyne",
      "Dries Mertens",
      "Axel Witsel"
    ],
    "correctIndex": 1
  },
  {
    "question":
        "Which Premier League player is commonly called 'The Baby-Faced Genius'?",
    "answers": [
      "Phil Foden",
      "Jack Grealish",
      "James Maddison",
      "Raheem Sterling"
    ],
    "correctIndex": 0
  }
];
