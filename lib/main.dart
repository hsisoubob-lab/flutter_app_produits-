import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atelier Produits',
      home: ListProduits(),
    );
  }
}

class Produit {
  final String nom;
  final String description;
  final double prix;

  Produit({
    required this.nom,
    required this.description,
    required this.prix,
  });
}

class DetailsProduit extends StatelessWidget {
  final Produit produit;

  const DetailsProduit({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produit.nom)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom : ${produit.nom}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Prix : ${produit.prix} \$", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Description :", style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text(produit.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ListProduits extends StatelessWidget {
  ListProduits({super.key});

  final List<Produit> produits = [
    Produit(
      nom: "Ordinateur Portable",
      description: "Laptop puissant pour travail et gaming.",
      prix: 1200.0,
    ),
    Produit(
      nom: "Smartphone",
      description: "Téléphone nouvelle génération avec triple caméra.",
      prix: 900.0,
    ),
    Produit(
      nom: "Casque Bluetooth",
      description: "Casque sans fil avec réduction de bruit.",
      prix: 150.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste de Produits")),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          final produit = produits[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(produit.nom,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("${produit.prix} \$"),
              trailing: ElevatedButton(
                child: Text("Voir"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsProduit(produit: produit),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}