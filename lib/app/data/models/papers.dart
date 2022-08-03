class Paper {
  final String image;
  final String title;

  Paper({required this.image, required this.title});
}

enum DiplomaTags {
  win,
  top5,
  top3,
  country,
  world,
  unity,
  gamedev,
  design,
  flutter,
  figma
}

class Diploma extends Paper {
  final String shortDescription;
  final List<DiplomaTags> tags;
  Diploma({
    required String title,
    required this.shortDescription,
    required this.tags,
    required String image,
  }) : super(image: image, title: title);
}

class Certificate extends Paper {
  final String description;
  final String link;

  Certificate({
    required String title,
    required this.description,
    required this.link,
    required String image,
  }) : super(image: image, title: title);
}
