class Paper {
  final String image;
  final String title;

  Paper({required this.image, required this.title});
}

class Diploma extends Paper {
  final String shortDescription;

  Diploma(
      {required this.shortDescription,
      required String image,
      required String title})
      : super(image: image, title: title);
}

class Certificate extends Paper {
  final String description;
  final String link;

  Certificate(
      {required this.description,
      required this.link,
      required String image,
      required String title})
      : super(image: image, title: title);
}
