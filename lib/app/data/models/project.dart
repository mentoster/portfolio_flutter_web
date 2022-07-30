import '../enums/technology.dart';

class Projects {
  final List<Project> projects;
  Projects(this.projects);
}

class Project {
  Project({
    required this.title,
    required this.technology,
    required this.date,
    required this.projectPreview,
    required this.projectPage,
  });
  final String title;
  final List<Technology> technology;
  final DateTime date;
  final ProjectPreview projectPreview;
  final ProjectPage projectPage;
}

class ProjectPreview {
  final String previewImagePath;

  ProjectPreview({required this.previewImagePath});
}

class ProjectPage {
  final List<String> images;
  final String? videoPath;
  final String backgroundImagePath;
  final String? projectLink;
  final String description;
  ProjectPage(
      {required this.images,
      this.videoPath,
      required this.description,
      required this.backgroundImagePath,
      this.projectLink});
}
