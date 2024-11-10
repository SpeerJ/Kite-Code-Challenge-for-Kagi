class FeedCategory {
  static const world = FeedCategory('world');
  static const science = FeedCategory('science');
  static const tech = FeedCategory('tech');
  static const built_in = [world, science, tech];

  final String name;

  String get title => name[0].toUpperCase() + name.substring(1);

  const FeedCategory(this.name);
}
