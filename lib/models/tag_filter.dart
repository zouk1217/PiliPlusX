// tag_filter.dart

class TagFilter {
  String? tag;
  bool isActive;

  TagFilter({this.tag, this.isActive = false});

  void toggle() {
    isActive = !isActive;
  }
}

class TagFilterManager {
  List<TagFilter> filters = [];

  void addFilter(TagFilter filter) {
    filters.add(filter);
  }

  void removeFilter(TagFilter filter) {
    filters.remove(filter);
  }

  List<TagFilter> getActiveFilters() {
    return filters.where((filter) => filter.isActive).toList();
  }
}