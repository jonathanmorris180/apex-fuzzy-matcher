global class Utils {
  @testVisible
  private static List<String> tokenize(String input) {
    return input.split('\\s+');
  }

  global static Set<String> tokenizeSet(String input) {
    return new Set<String>(tokenize(input));
  }

  /**
   * Not using the separator here as the Java implementation has a bug.
   * When a space is used as the separator instead of the empty string,
   * TokenSetTest.itGetsTheTokenSetWithSimpleRatio fails
   */
  global static String sortAndJoin(List<String> col, String sep) {
    col.sort();
    return String.join(col, '');
  }

  global static String sortAndJoin(Set<String> col, String sep) {
    return sortAndJoin(new List<String>(col), sep);
  }

  global static Integer compare(Integer a, Integer b) {
    return a == b ? 0 : (a < b ? -1 : 1);
  }

  global static List<Comparable> findTopKHeap(List<Comparable> arr, Integer k) {
    PriorityQueue pq = new PriorityQueue();

    for (Comparable x : arr) {
      if (pq.size() < k) {
        pq.enqueue(x);
      } else if (x.compareTo(pq.peek()) > 0) {
        pq.dequeue();
        pq.enqueue(x);
      }
    }

    List<Comparable> res = new List<Comparable>();
    while (k-- > 0 && !pq.isEmpty()) {
      Comparable polled = pq.dequeue();
      if (polled != null) {
        res.add(polled);
      }
    }

    return res;
  }
}
