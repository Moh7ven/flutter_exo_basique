import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Profile'),
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset("images/cover.jpg", height: 200, fit: BoxFit.cover),
            Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.only(top: 125),
              child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: myProfilePic(72)),
            ),
          ],
        ),
        const Row(children: [
          Spacer(), //ici je créé un espace à gauche
          Text("Mohamed SANGARE",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
          Spacer(), //ici je créé un espace à droite(pour centrer le texte)
        ]),

        // ignore: prefer_const_constructors
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Un jour les chats domineront le monde, mais pas aujourdhui, c'est l'heure de la sieste",
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
        Row(children: [
          Expanded(
            child: buttonContainer(
              text: "Modifier mon profil",
            ),
          ),
          buttonContainer(
            icon: Icons.border_color,
          )
        ]),
        const Divider(
          thickness: 2,
        ),
        sectionTitleText("A propos de moi"),
        aboutRow(icon: Icons.house, text: "Abidjan, Côte d'Ivoire"),
        aboutRow(icon: Icons.work, text: "Software engineer"),
        aboutRow(icon: Icons.favorite, text: "Célibataire"),
        const Divider(
          thickness: 2,
        ),
        sectionTitleText("Amis"),
        allFriends(width / 3.5),
        const Divider(
          thickness: 2,
        ),
        sectionTitleText("Mes Postes"),
      ])),
    );
  }

  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage("images/profile.jpg"),
    );
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      // ignore: sort_child_properties_last
      child: (icon == null)
          ? Center(
              child:
                  Text(text ?? "", style: const TextStyle(color: Colors.white)),
            )
          : Icon(
              icon,
              color: Colors.white,
            ),
      height: 50,
    );
  }

  Widget sectionTitleText(String text) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ));
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(children: [
      Icon(icon),
      Padding(padding: const EdgeInsets.all(5), child: Text(text)),
    ]);
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(5),
        width: width,
        height: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey)]),
      ),
      Text(name),
      const Padding(
          padding: EdgeInsets.only(
              bottom:
                  5)), // Espacement vers le bas si l'on ajoute d'autre éléments
    ]);
  }

  Row allFriends(double width) {
    Map<String, String> friends = {
      "José": "images/cat.jpg",
      "Tara": "images/sunflower.jpg",
      "Rex": "images/duck.jpg",
    };
    List<Widget> children = [];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
