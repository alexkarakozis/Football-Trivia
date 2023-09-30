import 'package:flutter/material.dart';
import 'package:playerid/answer.dart';
import 'package:playerid/user_tracker.dart';

class Transfers extends StatefulWidget {
  @override
  State<Transfers> createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  late int _questionIndex;
  int selectedIndex = -1;
  bool endOfQuiz = false;

  @override
  void initState() {
    super.initState();
    _questionIndex = UserTracker.getTransfersIndex();
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

    await UserTracker.setTransfersIndex(_questionIndex + 1);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      endOfQuiz = false;
    });

    UserTracker.setTransfersIndex(0);
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
              margin: EdgeInsets.only(
                  top: 20, bottom: 20.0, left: 20.0, right: 20.0),
              child: Image.asset(
                'images/test.png',
              )),
          // Container(
          //     width: double.infinity,
          //     height: 180.0,
          //     margin: EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
          //     child: Center(
          //         child: Text(
          //       _questions[_questionIndex]['question'],
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 18.0,
          //           fontWeight: FontWeight.bold),
          //     ))),
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

int getTransfersLength() {
  return _questions.length;
}

List<Map<String, dynamic>> _questions = [
  {
    "question":
        "Which Premier League player started his professional career at Southampton FC in 2006, then joined Liverpool FC in 2011, and currently plays for Barcelona since 2014?",
    "answers": [
      "Adam Lallana",
      "Alex Oxlade-Chamberlain",
      "Jordan Henderson",
      "Philippe Coutinho"
    ],
    "correctIndex": 3
  },
  {
    "question":
        "Who began his career at Ajax in 2001, moved to Tottenham Hotspur in 2010, and then transferred to Real Madrid in 2012, where he currently plays?",
    "answers": [
      "Gareth Bale",
      "Toby Alderweireld",
      "Christian Eriksen",
      "Jan Vertonghen"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Which Premier League player joined Manchester United in 2004, moved to Real Madrid in 2009, returned to Manchester United in 2016, and now plays for Everton?",
    "answers": [
      "Cristiano Ronaldo",
      "David Beckham",
      "Wayne Rooney",
      "Robin van Persie"
    ],
    "correctIndex": 2
  },
  {
    "question":
        "Who started his career at Marseille in 2009, transferred to Newcastle United in 2013, then moved to Paris Saint-Germain in 2016, and currently plays for Crystal Palace?",
    "answers": [
      "Florian Thauvin",
      "Moussa Sissoko",
      "Yohan Cabaye",
      "Andros Townsend"
    ],
    "correctIndex": 3
  },
  {
    "question":
        "Which Premier League player began his professional career at West Ham United in 2003, joined Liverpool in 2011, then moved to Barcelona in 2014, and currently plays for Bayern Munich?",
    "answers": [
      "Andy Carroll",
      "Daniel Sturridge",
      "Luis Suarez",
      "Philippe Coutinho"
    ],
    "correctIndex": 2
  },
  {
    "question":
        "Who started his career at Anderlecht in 2009, joined Chelsea in 2011, then moved to Wolfsburg in 2014, and currently plays for Manchester City?",
    "answers": [
      "Kevin De Bruyne",
      "Romelu Lukaku",
      "Eden Hazard",
      "Thibaut Courtois"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Which Premier League player joined Arsenal in 2004, moved to Barcelona in 2011, then transferred to Chelsea in 2014, and currently plays for AS Monaco?",
    "answers": [
      "Thierry Henry",
      "Cesc Fabregas",
      "Alexis Sanchez",
      "Lukas Podolski"
    ],
    "correctIndex": 1
  },
  {
    "question":
        "Who began his career at Inter Milan in 2010, joined Manchester City in 2015, then moved to Paris Saint-Germain in 2016, and currently plays for Chelsea?",
    "answers": [
      "Romelu Lukaku",
      "Edin Dzeko",
      "Mario Balotelli",
      "Ezequiel Lavezzi"
    ],
    "correctIndex": 3
  },
  {
    "question":
        "Which Premier League player joined Arsenal in 2012, moved to Manchester United in 2014, then transferred to Chelsea in 2017, and currently plays for Inter Milan?",
    "answers": [
      "Alexis Sanchez",
      "Mesut Ozil",
      "Henrikh Mkhitaryan",
      "Nemanja Matic"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Who started his career at Everton in 2002, joined Manchester United in 2004, then transferred to D.C. United in 2018, and currently plays for Inter Miami CF?",
    "answers": [
      "Phil Jagielka",
      "Tim Cahill",
      "Wayne Rooney",
      "Leighton Baines"
    ],
    "correctIndex": 2
  }
];
