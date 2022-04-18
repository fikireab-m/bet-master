import 'package:animations/animations.dart';
import 'package:betmaster/matchscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tickets = [
    "All Matches",
    "Ticket of the day",
    "Safe Picks",
    "5+ odd ticket",
    "10+ odd ticket",
    "20+ odd ticket",
    "50+ odd ticket",
    "100+ odd ticket",
    "Combo ticket",
    "Single match",
    "Over/under",
    "Both Teams to score"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff090218),
        title: const Text("GoldenBet"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
          ),
        ),
        elevation: 24.0,
        actions: [
          Row(
            children: [
              const Icon(Icons.event),
              Text(
                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
          PopupMenuButton(
              color: const Color(0xff090218),
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
              }),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 140.0,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 4.0, right: 4.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          0.45,
                          1.0,
                        ],
                        colors: [
                          Color(0xff000000),
                          Color(0xffffa726),
                        ],
                      ),
                    ),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      tileColor: Theme.of(context).cardColor,
                      title: Text(
                        tickets.elementAt(index),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      leading: const Icon(
                        Icons.gamepad,
                        color: Color(0xffffa726),
                      ),
                      trailing: CircleAvatar(
                        child: Text(
                          tickets.length.toString(),
                        ),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MatchPage(),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 60,
            child: Placeholder(),
          )
        ],
      ),
    );
  }
}
