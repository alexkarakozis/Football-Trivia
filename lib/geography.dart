import 'package:flutter/material.dart';
import 'package:playerid/answer.dart';
import 'package:playerid/user_tracker.dart';

class Geography extends StatefulWidget {
  @override
  State<Geography> createState() => _GeographyState();
}

class _GeographyState extends State<Geography> {
  late int _questionIndex;
  int selectedIndex = -1;
  bool endOfQuiz = false;

  @override
  void initState() {
    super.initState();
    _questionIndex = UserTracker.getGeographyIndex();
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

    await UserTracker.setGeographyIndex(_questionIndex + 1);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      endOfQuiz = false;
    });

    UserTracker.setGeographyIndex(0);
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

int getGeographyLength() {
  return _questions.length;
}

List<Map<String, dynamic>> _questions = [
  {
    "question":
        "In which city was the UEFA Champions League final held on May 28, 2016, between Real Madrid and Atletico Madrid, with a score of 1-1 (5-3 on penalties)?",
    "answers": ["Milan", "Madrid", "Barcelona", "Rome"],
    "correctIndex": 0
  },
  {
    "question":
        "Which stadium hosted the FIFA World Cup final on July 15, 2018, between France and Croatia, with a score of 4-2?",
    "answers": [
      "Luzhniki Stadium",
      "Maracanã Stadium",
      "Wembley Stadium",
      "Estadio Azteca"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "On May 30, 2019, which city was the venue for the UEFA Europa League final between Chelsea and Arsenal, which ended with a score of 4-1?",
    "answers": ["Baku", "Athens", "Stockholm", "Glasgow"],
    "correctIndex": 0
  },
  {
    "question":
        "In which city did the UEFA Euro 2016 final take place on July 10, 2016, with Portugal defeating France 1-0?",
    "answers": ["Paris", "Lisbon", "Berlin", "London"],
    "correctIndex": 0
  },
  {
    "question":
        "Which stadium hosted the UEFA Champions League final on June 3, 2017, between Juventus and Real Madrid, with a score of 1-4?",
    "answers": [
      "Millennium Stadium",
      "Allianz Arena",
      "Wanda Metropolitano",
      "Olympiastadion"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "On July 13, 2014, which city hosted the FIFA World Cup final between Germany and Argentina, with a score of 1-0 (after extra time)?",
    "answers": ["Rio de Janeiro", "São Paulo", "Brasília", "Buenos Aires"],
    "correctIndex": 0
  },
  {
    "question":
        "In which city was the UEFA Europa League final held on May 26, 2021, between Villarreal and Manchester United, with a score of 1-1 (11-10 on penalties)?",
    "answers": ["Gdańsk", "Seville", "Amsterdam", "Dublin"],
    "correctIndex": 0
  },
  {
    "question":
        "Which stadium hosted the UEFA Euro 2020 final on July 11, 2021, between Italy and England, with a score of 1-1 (3-2 on penalties)?",
    "answers": [
      "Wembley Stadium",
      "Stadio Olimpico",
      "Allianz Arena",
      "Camp Nou"
    ],
    "correctIndex": 0
  },
  {
    "question":
        "On June 26, 2018, which city was the venue for the FIFA World Cup match between Argentina and Nigeria, with a score of 2-1?",
    "answers": ["Saint Petersburg", "Moscow", "Sochi", "Kazan"],
    "correctIndex": 2
  },
  {
    "question":
        "In which city did the UEFA Champions League final take place on May 29, 2010, between Bayern Munich and Inter Milan, with a score of 0-2?",
    "answers": ["Madrid", "Barcelona", "Milan", "London"],
    "correctIndex": 0
  }
];
