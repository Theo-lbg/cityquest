import 'dart:developer';
import 'package:cityquest/Authentificationpages/MDPoublie.dart';
import 'package:cityquest/Authentificationpages/inscription.dart';
import 'package:cityquest/Pages/MapScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class LoginPage extends StatelessWidget {
  String mail = "";
  String pass = "";

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
   
      appBar: AppBar(
        title: const Text("Ma page de Login"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 4, 16, 146),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: 
        Column(
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
      ),
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
        "Bienvenue, Veuillez vous connectez ! ",
        style: TextStyle(
          fontSize: 20,
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
              mail = newText;
            },
            decoration: const InputDecoration(
              labelText: "Votre Email",
            ),
          ),
        ),
        TextFormField(
          onChanged: (newText) {
            pass = newText;
          },
          decoration: const InputDecoration(labelText: "Votre mot de passe"),
          obscureText: true,
        ),
        ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            // ignore: todo
            //TODO : Fonction de connexion
            if (mail == "123" /* && pass == "123"*/) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const MapScreen()));
            } else {
              log("Erreur identifiants....");
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 128, 13, 5),
            ),
          ),
        ),
        TextButton(
          child: const Text("Mot de passe oublié"),
          onPressed: () {
            log("Mot de passe oublié");
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MDPoublie()));
          },
        ),
        TextButton(
          child: const Text("Toujours pas inscrit ?"),
          onPressed: (){
            log("Le bouton fonctionne");
            Navigator.push(context, MaterialPageRoute(builder: (context) => inscription()));
          },
         )
      ],
    );
  }
}
