import 'package:betmaster/models/match.dart';
import 'package:betmaster/selected_matches.dart';
import 'package:flutter/material.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  GameMatches matchesToday = GameMatches();
  bool darkMode = false;
  Set<GameMatch> selectedMatches = {};
  double odd = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff090218),
        title: const Text("GoldenBet"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.0),
          ),
        ),
        elevation: 24.0,
        actions: [
          PopupMenuButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const ListTile(
                      title: Text("Share"),
                      leading: Icon(Icons.share),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  PopupMenuItem(
                    child: const ListTile(
                      title: Text("Invite friends"),
                      leading: Icon(Icons.person_add),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ];
              })
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: matchesToday.matches.isEmpty
                ? const SizedBox()
                : Text(
                    "${matchesToday.matches.length} matches",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 172,
            child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: matchesToday.matches.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff000000),
                                Color(0xff090218),
                                Color(0xff000000),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  matchesToday.matches
                                      .elementAt(index)
                                      .gameType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(fontWeight: FontWeight.w300),
                                ),
                                const Divider(
                                  thickness: 2.0,
                                ),
                                Container(
                                  color: Colors.grey.withOpacity(0.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        matchesToday.matches
                                            .elementAt(index)
                                            .homeTeam,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        "Vs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              color: Colors.purpleAccent,
                                            ),
                                      ),
                                      Text(
                                        matchesToday.matches
                                            .elementAt(index)
                                            .awayTeam,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        matchesToday.matches
                                            .elementAt(index)
                                            .result,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                              color: Colors.lightBlueAccent,
                                            ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 2.0,
                                    ),
                                    Text(
                                      matchesToday.matches
                                          .elementAt(index)
                                          .oddAmount
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: const Color(0xff424242),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMatches.add(
                                matchesToday.matches.elementAt(index),
                              );
                              odd *= matchesToday.matches
                                  .elementAt(index)
                                  .oddAmount;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0xff00e676),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 60,
            child: Placeholder(),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectedMatches.isEmpty
          ? const SizedBox()
          : FloatingActionButton(
              backgroundColor: const Color(0xff004d40),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectedMatches(selectedMatches, odd),
                  ),
                );
              },
              child: Text(
                selectedMatches.length.toString(),
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Color(0xffffffff),
                ),
              ),
            ),
    );
  }
}
