enum Technology { unity, design, flutter, unigine, gamedev }

extension ParseToPreview on Technology {
  String toShortString() {
    return toString()
        .split('.')
        .last
        .toCapitalized()
        .replaceAll("design", "UI/UX Design");
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
