class Schema {
  final String name;
  final String description;
  final String url;
  final Map<String, String> mapping;
  final Map<String, String>? prevMapping;
  final Map<String, String>? nextMapping;
  final Map<String, String>? endingMapping;
  final List<List<String>> samples;

  const Schema(
    this.name,
    this.description,
    this.url,
    this.mapping,
    this.prevMapping,
    this.nextMapping,
    this.endingMapping,
    this.samples,
  );
}
