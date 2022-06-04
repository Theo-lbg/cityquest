import 'dart:developer';
import 'package:cityquest/Activite.dart';
import 'package:cityquest/Pages/InfosPage.dart';
import 'package:flutter/material.dart';

//Liste Activité Ville
final actv = List<Activite>.generate(
    5,
    (i) => Activite(
        "Ville $i",
        'Traversé de la ville en parapente à prix coutant ! $i',
        150,
        "images/$i.jpg"));

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des activités "),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            // Design Liste
            // ignore: unnecessary_new
            Activite act1 = new Activite(actv[index].nom,
                actv[index].description, actv[index].prix, actv[index].image);
            return SizedBox(
              height: 70,
              child: ListTile(
                onTap: (() {
                  //  : Naviguer vers page activité cliquée....
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfosPage(
                                activite: act1,
                              )));
                }),
                leading: Image.asset(act1.image),
                title: Text(act1.nom),
                subtitle: Row(
                  children: const <Widget>[
                    Text("Grand frisson garanti !! - 4.5"),
                    Icon(
                      Icons.star,
                      size: 20,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext contexte, int index) =>
              const Divider(),
          itemCount: actv.length),
    );
  }
}
