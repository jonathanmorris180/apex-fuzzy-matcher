global class SetUtils {
  global static Set<String> intersection(Set<String> s1, Set<String> s2) {
    Set<String> intersection = new Set<String>(s1);
    intersection.retainAll(s2);

    return intersection;
  }

  global static Set<String> difference(Set<String> s1, Set<String> s2) {
    Set<String> difference = new Set<String>(s1);
    difference.removeAll(s2);

    return difference;
  }
}
