import 'dart:developer';
import 'package:cityquest/Authentificationpages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class MDPoublie extends StatelessWidget{
String pass1 = "";
  String pass2 = "";

Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Mot de passe oublié"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 4, 16, 146),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
        children: <Widget>[
          _buildheader(),
          const SizedBox(
            height: 15,
          ),
          _buildtitle(),
          const SizedBox(
            height: 15,
          ),
          _buildform(context),
        ],
      ),
      )
    );



//Fonction création Header page Login
  Widget _buildheader() {
    return Image.asset("images/mycity.jpg",
    width: 250,);
  }


//Création du titre
  Widget _buildtitle() {
    return const Center(
      child: Text(
        "Vous avez oublié votre mot de passe, pas de problème !",
        style: TextStyle(
          fontSize: 15,
          color: Colors.red,
          ),
      ),
    );
  }




//Création formulaire
  Widget _buildform(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          child: TextFormField(
            //Récup Email entré par l'utilisateur
            onChanged: (newText) {
              pass1 = newText;
            },
            decoration: const InputDecoration(
              labelText: "Nouveau Mot de passe",
            ),
          ),
        ),
        TextFormField(
          onChanged: (newText) {
            pass2 = newText;
          },
          decoration: const InputDecoration(labelText: "Nouveau Mot de passe X2"),
          obscureText: true,
        ),
        ElevatedButton(
          child: const Text("Valider"),
          onPressed: () {
            // ignore: todo
            //TODO : Fonction de connexion
            if (pass1 == "123" && pass2 == "123") {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/route1', (Route<dynamic> route) => false);
              log("Mince....");
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 128, 13, 5),
            ),
          ),
        ),
      ],
    );
  }

}