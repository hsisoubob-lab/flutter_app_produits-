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
            Text("Description : ${produit.description}",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Prix : ${produit.prix.toStringAsFixed(1)} \$",
                style: TextStyle(fontSize: 18, color: Colors.green)),
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
      nom: "Casque son JBL",
      description: "Casque sans fil JBL avec un son puissant.",
      prix: 375.0,
    ),
    Produit(
      nom: "Chaise de bureau Arhaus",
      description: "Chaise de bureau ergonomique de qualité Arhaus de gaming",
      prix: 780.0,
    ),
    Produit(
      nom: "Souris sans fil Logitech",
      description: "Souris sans fil précise et confortable.",
      prix: 150.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des produits")),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          final produit = produits[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(produit.nom,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Text("${produit.prix.toStringAsFixed(1)} \$"),
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