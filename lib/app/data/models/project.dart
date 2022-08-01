import '../enums/technology.dart';

class Projects {
  final List<Project> projects;
  Projects(this.projects);
}

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
  final DateTime date;
  final ProjectPreview preview;
  final ProjectPage page;
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
