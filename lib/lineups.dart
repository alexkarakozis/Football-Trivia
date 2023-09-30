import 'package:flutter/material.dart';
import 'package:playerid/answer.dart';
import 'package:playerid/user_tracker.dart';

class Lineups extends StatefulWidget {
  @override
  State<Lineups> createState() => _LineupsState();
}

class _LineupsState extends State<Lineups> {
  late int _questionIndex;
  int selectedIndex = -1;
  bool endOfQuiz = false;

  @override
  void initState() {
    super.initState();
    _questionIndex = UserTracker.getLineupsIndex();
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

    await UserTracker.setLineupsIndex(_questionIndex + 1);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      endOfQuiz = false;
    });

    UserTracker.setLineupsIndex(0);
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

int getLineupsLength() {
  return _questions.length;
}

List<Map<String, dynamic>> _questions = [
  {
    "question":
        "In the Premier League match between Manchester United and Manchester City in the 2020-2021 season, which player started as a central midfielder for Manchester United in a 3-3 draw?",
    "answers": ["Bruno Fernandes", "Paul Pogba", "Scott McTominay", "Fred"],
    "correctIndex": 2
  },
  {
    "question":
        "In the Premier League match between Liverpool and Chelsea in the 2019-2020 season, which player started as a left-back for Chelsea in a 2-1 win?",
    "answers": [
      "César Azpilicueta",
      "Marcos Alonso",
      "Emerson Palmieri",
      "Reece James"
    ],
    "correctIndex": 1
  },
  {
    "question":
        "In the Premier League match between Arsenal and Tottenham Hotspur in the 2018-2019 season, which player started as a striker for Arsenal in a 4-2 win?",
    "answers": [
      "Pierre-Emerick Aubameyang",
      "Alexandre Lacazette",
      "Danny Welbeck",
      "Olivier Giroud"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "In the Premier League match between Manchester City and Liverpool in the 2017-2018 season, which player started as a right-back for Liverpool in a 4-3 win?",
    "answers": [
      "Trent Alexander-Arnold",
      "Andrew Robertson",
      "Joe Gomez",
      "Nathaniel Clyne"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "In the Premier League match between Chelsea and Manchester United in the 2016-2017 season, which player started as a defensive midfielder for Manchester United in a 2-0 win?",
    "answers": [
      "Ander Herrera",
      "Paul Pogba",
      "Nemanja Matić",
      "Michael Carrick"
    ],
    "correctIndex": 2
  },
  {
    "question":
        "In the Premier League match between Leicester City and Tottenham Hotspur in the 2015-2016 season, which player started as a central midfielder for Tottenham Hotspur in a 1-1 draw?",
    "answers": ["Mousa Dembélé", "Eric Dier", "Christian Eriksen", "Dele Alli"],
    "correctIndex": 0
  },
  {
    "question":
        "In the Premier League match between Manchester United and Manchester City in the 2014-2015 season, which player started as a left winger for Manchester City in a 1-0 win?",
    "answers": [
      "David Silva",
      "Samir Nasri",
      "Raheem Sterling",
      "James Milner"
    ],
    "correctIndex": 1
  },
  {
    "question":
        "In the Premier League match between Arsenal and Liverpool in the 2013-2014 season, which player started as a central defender for Arsenal in a 2-2 draw?",
    "answers": [
      "Per Mertesacker",
      "Laurent Koscielny",
      "Thomas Vermaelen",
      "Bacary Sagna"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "In the Premier League match between Manchester City and Manchester United in the 2012-2013 season, which player started as a right winger for Manchester City in a 2-3 loss?",
    "answers": ["David Silva", "Samir Nasri", "James Milner", "Adam Johnson"],
    "correctIndex": 2
  },
  {
    "question":
        "In the Premier League match between Chelsea and Tottenham Hotspur in the 2011-2012 season, which player started as a striker for Tottenham Hotspur in a 2-1 win?",
    "answers": [
      "Emmanuel Adebayor",
      "Jermain Defoe",
      "Roman Pavlyuchenko",
      "Peter Crouch"
    ],
    "correctIndex": 3
  }
];
