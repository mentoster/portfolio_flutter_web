import '../enums/technology.dart';

class Project {
  Project({
    required this.title,
    required this.technologies,
    required this.date,
    required this.preview,
    required this.page,
  });
  final String title;
  final List<Technology> technologies;
  final ProjectPreview preview;
  final ProjectPage page;
  final DateTime date;
}

class ProjectPreview {
  final String previewImagePath;

  ProjectPreview({required this.previewImagePath});
}

class ProjectPage {
  final List<String> images;
  final String? videoPath;
  final String backgroundImagePath;
  final String? link;
  final String description;
  ProjectPage(
      {required this.images,
      this.videoPath,
      required this.description,
      required this.backgroundImagePath,
      this.link});
}
