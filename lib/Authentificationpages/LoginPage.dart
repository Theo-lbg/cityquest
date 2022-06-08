import 'dart:developer';
import 'package:cityquest/Authentificationpages/MDPoublie.dart';
import 'package:cityquest/Authentificationpages/inscription.dart';
import 'package:cityquest/Pages/MapScreen.dart';
import 'package:cityquest/Services/auth2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class LoginPage extends StatelessWidget {
  String mail = "";
  String pass = "";
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  LoginPage({Key? key}) : super(key: key);

  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();

  void initState(){
    initFirebase();
  }

  void initFirebase()async{
    await Firebase.initializeApp();
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
      if(user==null){
        print("user not connected !");
      }
      else{
        print("User connected");
      }

    });

  }

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
        const SizedBox(
                  height: 20,
                ),
                reusableTextField("Entrez votre adresse mail", Icons.person_outline, false,
                    _emailcontroller),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Entrer votre mot de passe", Icons.lock_outlined, true,
                    _passwordcontroller),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailcontroller.text,
                          password: _passwordcontroller.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MapScreen()));
                  }).onError((error, stackTrace) {
                    showDialog(
                      context: context, 
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text("Erreur !"),
                          actions: <Widget>[
                            const Text("Si cela ne fonctionne pas essayer de vous créer un compte !"),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Fermer le pop-up"),)

                          ],
                        );
                      },
                      );

                  });
                }),
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
