import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:playerid/geography.dart';
import 'package:playerid/history.dart';
import 'package:playerid/lineups.dart';
import 'package:playerid/user_tracker.dart';
import 'package:playerid/stats.dart';
import 'package:playerid/transfers.dart';
import 'package:playerid/gossip.dart';

class Categoriesc extends StatefulWidget {
  const Categoriesc({super.key});

  @override
  State<Categoriesc> createState() => _CategoriescState();
}

class _CategoriescState extends State<Categoriesc> {
  late int _geographyIndex;
  late int _historyIndex;
  late int _statsIndex;
  late int _transfersIndex;
  late int _gossipIndex;
  late int _lineupsIndex;

  @override
  void initState() {
    super.initState();
    _geographyIndex = UserTracker.getGeographyIndex();
    _historyIndex = UserTracker.getHistoryIndex();
    _statsIndex = UserTracker.getStatsIndex();
    _transfersIndex = UserTracker.getTransfersIndex();
    _gossipIndex = UserTracker.getGossipIndex();
    _lineupsIndex = UserTracker.getLineupsIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(14, 30, 91, 1),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Image.asset(
                    'images/geography.png',
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  title: Text('Geography'),
                  subtitle: Text(
                      'Questions: $_geographyIndex/${getGeographyLength()}'),
                  trailing: CircularPercentIndicator(
                      radius: 20,
                      percent: _geographyIndex / getGeographyLength(),
                      progressColor: Color.fromRGBO(8, 128, 240, 0.8),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "${(_geographyIndex / getGeographyLength() * 100).toStringAsFixed(0)}%",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      animation: true,
                      animationDuration: 1000),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Geography()),
                    );

                    setState(() {
                      _geographyIndex = UserTracker.getGeographyIndex();
                    });
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    'images/history.png',
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  title: Text('History'),
                  subtitle:
                      Text('Questions: $_historyIndex/${getHistoryLength()}'),
                  trailing: CircularPercentIndicator(
                      radius: 20,
                      percent: _historyIndex / getHistoryLength(),
                      progressColor: Color.fromRGBO(8, 128, 240, 0.8),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "${(_historyIndex / getHistoryLength() * 100).toStringAsFixed(0)}",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      animation: true,
                      animationDuration: 1000),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => History()),
                    );

                    setState(() {
                      _historyIndex = UserTracker.getHistoryIndex();
                    });
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    'images/stats.png',
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  title: Text('Stats'),
                  subtitle: Text('Questions: $_statsIndex/${getStatsLength()}'),
                  trailing: CircularPercentIndicator(
                      radius: 20,
                      percent: _statsIndex / getStatsLength(),
                      progressColor: Color.fromRGBO(8, 128, 240, 0.8),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "${(_statsIndex / getStatsLength() * 100).toStringAsFixed(0)}%",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      animation: true,
                      animationDuration: 1000),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Stats()),
                    );

                    setState(() {
                      _statsIndex = UserTracker.getStatsIndex();
                    });
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    'images/transfers.png',
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  title: Text('Transfers'),
                  subtitle: Text(
                      'Questions: $_transfersIndex/${getTransfersLength()}'),
                  trailing: CircularPercentIndicator(
                      radius: 20,
                      percent: _transfersIndex / getTransfersLength(),
                      progressColor: Color.fromRGBO(8, 128, 240, 0.8),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "${(_transfersIndex / getTransfersLength() * 100).toStringAsFixed(0)}%",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      animation: true,
                      animationDuration: 1000),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transfers()),
                    );

                    setState(() {
                      _transfersIndex = UserTracker.getTransfersIndex();
                    });
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    'images/gossip.png',
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  title: Text('Gossip'),
                  subtitle:
                      Text('Questions: $_gossipIndex/${getGossipLength()}'),
                  trailing: CircularPercentIndicator(
                      radius: 20,
                      percent: _gossipIndex / getGossipLength(),
                      progressColor: Color.fromRGBO(8, 128, 240, 0.8),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "${(_gossipIndex / getGossipLength() * 100).toStringAsFixed(0)}%",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      animation: true,
                      animationDuration: 1000),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Gossip()),
                    );

                    setState(() {
                      _gossipIndex = UserTracker.getGossipIndex();
                    });
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    'images/lineups.png',
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  title: Text('Lineups'),
                  subtitle:
                      Text('Questions: $_lineupsIndex/${getLineupsLength()}'),
                  trailing: CircularPercentIndicator(
                      radius: 20,
                      percent: _lineupsIndex / getLineupsLength(),
                      progressColor: Color.fromRGBO(8, 128, 240, 0.8),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "${(_lineupsIndex / getLineupsLength() * 100).toStringAsFixed(0)}%",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      animation: true,
                      animationDuration: 1000),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Lineups()),
                    );

                    setState(() {
                      _lineupsIndex = UserTracker.getLineupsIndex();
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
