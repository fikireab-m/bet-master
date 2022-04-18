import 'package:betmaster/models/match.dart';
import 'package:flutter/material.dart';

class SelectedMatches extends StatefulWidget {
  SelectedMatches(this.selected, this.totalOdds, {Key? key}) : super(key: key);
  final Set<GameMatch> selected;
  late double totalOdds;
  @override
  _SelectedMatchesState createState() => _SelectedMatchesState();
}

class _SelectedMatchesState extends State<SelectedMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.selected.length} matches"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            size: 32.0,
            color: Color(0xffe91e63),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.share,
                size: 32.0,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 140,
            child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: widget.selected.length,
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
                                  widget.selected.elementAt(index).gameType,
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
                                        widget.selected
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
                                        widget.selected
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
                                        widget.selected.elementAt(index).result,
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
                                      widget.selected
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.totalOdds /=
                                widget.selected.elementAt(index).oddAmount;
                            widget.selected.remove(
                              widget.selected.elementAt(index),
                            );
                          });
                        },
                        child: const Icon(
                          Icons.minimize,
                          size: 32.0,
                          color: Color(0xffe91e63),
                        ),
                      )
                    ],
                  );
                }),
          ),
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              color: Color(0xff090218),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Total odd:",
                  ),
                  Text(
                    widget.totalOdds.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
