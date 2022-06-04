import 'dart:developer';

import 'package:cityquest/Activite.dart';
import 'package:flutter/material.dart';

class InfosPage extends StatefulWidget {
  final Activite activite;
  const InfosPage({
    Key? key,
    required this.activite,
  }) : super(key: key);

  @override
  _InfosPageState createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> {
  int selectedTab = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activite.nom),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildheader(),
            const SizedBox(height: 15),
            _buildInfos(),
            // _buildBtn(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location_alt_outlined),
            label: "Ajouter Infos",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_settings_alt_sharp),
            label: "Paramètres",
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildheader() {
    return Image.asset(
      widget.activite.image,
      width: 150,
    );
  }

  Widget _buildInfos() {
    return Column(children: <Widget>[
      Text(
        widget.activite.nom,
        style: const TextStyle(fontSize: 26),
      ),
      const SizedBox(height: 15),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.activite.description,
          style: const TextStyle(fontSize: 17, color: Colors.blue),
        ),
      ),
      const SizedBox(height: 15),
      const Text("Prix de 20€"),
      const SizedBox(height: 15),
    ]);
  }

  // Widget _buildBtn() {
  //   return ElevatedButton(
  //       onPressed: () {
  //         log("TODO: ACHETER");
  //       },
  //       child: const Text("Clique sur lui CHAKAL ! "));
  // }
}
