import '../enums/technology.dart';
import '../models/project.dart';

final projects = Projects([
  Project(
    title: "Revolit",
    technologies: [Technology.gamedev, Technology.unity],
    date: DateTime(2022, 06, 01),
    preview: ProjectPreview(
        previewImagePath: "assets/images/projects/Revolit/preview.png"),
    page: ProjectPage(
        description: """
    Приложение дает пользователям возможность осуществлять процесс сборки предоставленной модели в формате виртуальной реальности. Люди могут собирать ракетный двигатель как самостоятельно, так и в многопользовательской комнате, объединившись с напарниками.
    Процесс сопровождают различные подсказки и тексты с описаниями деталей. Все это, вкупе с глубоким погружением, способствует быстрому усвоению материала. При окончании сборки модель становится анимированной и демонстрирует свой принцип работы.""",
        backgroundImagePath: "assets/images/projects/Revolit/background.png",
        images: [
          "assets/images/projects/Revolit/preview.png",
          "assets/images/projects/Revolit/preview.png",
          "assets/images/projects/Revolit/preview.png",
          "assets/images/projects/Revolit/preview.png",
          "assets/images/projects/Revolit/preview.png",
          "assets/images/projects/Revolit/preview.png"
        ]),
  ),
  Project(
    title: "Revolit0",
    technologies: [Technology.gamedev, Technology.unity],
    date: DateTime(2022, 06, 01),
    preview: ProjectPreview(previewImagePath: "assets/images/my_photo.png"),
    page: ProjectPage(
        description: "Описание",
        backgroundImagePath: "assets/images/my_photo.png",
        images: []),
  ),
  Project(
    title: "Revolit1",
    technologies: [Technology.gamedev, Technology.unity],
    date: DateTime(2022, 06, 01),
    preview: ProjectPreview(previewImagePath: "assets/images/my_photo.png"),
    page: ProjectPage(
        description: "Описание",
        backgroundImagePath: "assets/images/my_photo.png",
        images: []),
  ),
  Project(
    title: "Revolit2",
    technologies: [Technology.gamedev, Technology.unity],
    date: DateTime(2022, 06, 01),
    preview: ProjectPreview(previewImagePath: "assets/images/my_photo.png"),
    page: ProjectPage(
        description: "Описание",
        backgroundImagePath: "assets/images/my_photo.png",
        images: []),
  ),
  Project(
    title: "Revolit3",
    technologies: [Technology.gamedev, Technology.unity],
    date: DateTime(2022, 06, 01),
    preview: ProjectPreview(previewImagePath: "assets/images/my_photo.png"),
    page: ProjectPage(
        description: "Описание",
        backgroundImagePath: "assets/images/my_photo.png",
        images: []),
  ),
]);
