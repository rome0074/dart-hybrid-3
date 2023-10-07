class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void sort(String field) {
    people.sort((a, b) {
      if (a.containsKey(field) && b.containsKey(field)) {
        return a[field]!.compareTo(b[field]!);
      } else {
        throw ('Error: The field "$field" does not exist.');
      }
    });
  }

  void output() {
    people.forEach(print);
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field, String value) {
    people.removeWhere((element) => element[field] == value);
  }
}
