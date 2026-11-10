// Modèle de données
class Item {
  final String title;
  final String image;
  final int number;
  final String? description;

  Item({
    required this.title,
    required this.image,
    required this.number,
    this.description,
  });
}

final List<Item> ITEMS = [
  Item(
    title: "Banane",
    image: "assets/images/banane.png",
    number: 5,
    description: "La banane est le fruit ou la baie dérivant de l’inflorescence du bananier. Les bananes sont des fruits très généralement stériles issus de variétés domestiquées. Seuls les fruits des bananiers sauvages et de quelques cultivars domestiques contiennent des graines.",
  ),
  Item(
    title: "Fraise",
    image: "assets/images/fraise.png",
    number: 8,
    description: "La fraise est un petit fruit rouge issu des fraisiers, espèces de plantes herbacées appartenant au genre Fragaria (famille des Rosacées), dont plusieurs variétés sont cultivées.",
  ),
  Item(
    title: "Orange",
    image: "assets/images/orange.png",
    number: 12,
    description: "L'orange est le fruit de deux espèces distinctes de la famille des Rutacées, d'une part l'orange douce ou simplement orange produit par l'oranger (Citrus sinensis L.), d'autre part l'orange amère produit du Bigaradier (Citrus aurantium).",
  ),
  Item(
    title: "Pomme",
    image: "assets/images/pomme.png",
    number: 10,
    description: "La pomme est un fruit comestible produit par un pommier. Les pommiers sont cultivés à travers le monde et représentent l'espèce la plus cultivée du genre Malus. L'arbre est originaire d'Asie centrale, où son ancêtre sauvage, le Malus sieversii peut encore être trouvé de nos jours.",
  ),
  Item(
    title: "Raisin",
    image: "assets/images/raisin.png",
    number: 6,
    description: "Le raisin est le fruit de la vigne (Vitis). Il se présente sous la forme de grappes composées de nombreux grains, qui sont sur le plan botanique des baies, de petite taille et de couleur claire, pour le raisin blanc (verdâtre, jaunâtre, jaune doré), ou plus foncée, pour le raisin rouge (mauve, rose ou noir-violet). ",
  ),
];
