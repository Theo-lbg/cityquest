import 'dart:developer';
import 'package:cityquest/Authentificationpages/LoginPage.dart';
import 'package:cityquest/Services/auth2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MDPoublie extends StatelessWidget{
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

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
        const SizedBox(
                  height: 20,
                ),
                reusableTextField("Entrez votre adresse mail", Icons.person_outline, false,
                    _emailcontroller),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, false, () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(
                          email: _emailcontroller.text,
                      )
                      .then((value) {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }).onError((error, stackTrace) {
                    showDialog(
                      context: context, 
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text("Erreur !"),
                          actions: <Widget>[
                            const Text("Cet adresse mail n'existe pas !",
                            textAlign: TextAlign.center,),
                            TextButton(
                              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil('/route1', (Route<dynamic> route) => false),
                              child: const Text("Fermer le pop-up"),)

                          ],
                        );
                      },
                      );
                  });
                })
      ],
    );
  }

}