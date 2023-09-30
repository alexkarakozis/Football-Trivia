import 'package:flutter/material.dart';
import 'package:playerid/answer.dart';
import 'package:playerid/user_tracker.dart';

class Stats extends StatefulWidget {
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  late int _questionIndex;
  int selectedIndex = -1;
  bool endOfQuiz = false;

  @override
  void initState() {
    super.initState();
    _questionIndex = UserTracker.getStatsIndex();
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

    await UserTracker.setStatsIndex(_questionIndex + 1);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      endOfQuiz = false;
    });

    UserTracker.setStatsIndex(0);
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

int getStatsLength() {
  return _questions.length;
}

List<Map<String, dynamic>> _questions = [
  {
    "question":
        "Who holds the record for the most goals scored in a single season across Europe's top five leagues?",
    "answers": [
      "Lionel Messi",
      "Cristiano Ronaldo",
      "Gerd Muller",
      "Robert Lewandowski"
    ],
    "correctIndex": 3
  },
  {
    "question":
        "Which player has the most assists in the history of the UEFA Champions League?",
    "answers": [
      "Cristiano Ronaldo",
      "Lionel Messi",
      "Andrés Iniesta",
      "Ryan Giggs"
    ],
    "correctIndex": 1
  },
  {
    "question":
        "Who is the all-time leading goalscorer for the Brazil national football team?",
    "answers": ["Ronaldo", "Pelé", "Romário", "Neymar"],
    "correctIndex": 3
  },
  {
    "question": "Which country has won the most FIFA World Cup titles?",
    "answers": ["Brazil", "Germany", "Italy", "Argentina"],
    "correctIndex": 0
  },
  {
    "question":
        "Who holds the record for the most goals scored in a single World Cup tournament?",
    "answers": ["Just Fontaine", "Gerd Muller", "Ronaldo", "Miroslav Klose"],
    "correctIndex": 3
  },
  {
    "question": "Which player has the most Ballon d'Or awards?",
    "answers": [
      "Lionel Messi",
      "Cristiano Ronaldo",
      "Michel Platini",
      "Johan Cruyff"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "Who is the all-time leading goalscorer in the history of the English Premier League?",
    "answers": ["Alan Shearer", "Wayne Rooney", "Thierry Henry", "Andy Cole"],
    "correctIndex": 0
  },
  {
    "question": "Which team has won the most UEFA Champions League titles?",
    "answers": ["Real Madrid", "Barcelona", "Bayern Munich", "Liverpool"],
    "correctIndex": 0
  },
  {
    "question":
        "Who holds the record for the most clean sheets in the history of the Premier League?",
    "answers": ["Petr Čech", "David James", "Edwin van der Sar", "Joe Hart"],
    "correctIndex": 0
  },
  {
    "question":
        "Which player has scored the most goals in a single UEFA Champions League season?",
    "answers": [
      "Cristiano Ronaldo",
      "Lionel Messi",
      "Robert Lewandowski",
      "Ruud van Nistelrooy"
    ],
    "correctIndex": 2
  }
];
