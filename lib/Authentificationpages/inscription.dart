import 'dart:developer';
import 'package:cityquest/Authentificationpages/LoginPage.dart';
import 'package:flutter/material.dart';


class inscription extends StatelessWidget {
  String mail = "";
  String pass = "";
  String pass2= "";

  inscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
   
      appBar: AppBar(
        title: const Text("Ma page d'inscription"),
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
        "Bienvenue, Inscrivez-vous !",
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
        TextFormField(
          onChanged: (newText) {
            pass = newText;
          },
          decoration: const InputDecoration(labelText: "Votre mot de passe encore une fois"),
          obscureText: true,
        ),
        const SizedBox(
            height: 25,
          ),
        ElevatedButton(
          onPressed: () {
            // ignore: todo
            //TODO : Fonction de connexion
            if (mail == "123" /* && pass == "123"*/) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            } else {
              log("Erreur identifiants....");
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 128, 13, 5),
            ),
          ),
          child: const Text("Valider"),
        ),
        
      ],
    );
  }
}
