global class TokenSet extends RatioAlgorithm {
  private static final Logger LOGGER = LoggerFactory.getLogger(TokenSet.class);

  global override Integer apply(
    String s1,
    String s2,
    Ratio ratio,
    ToStringFunction stringFunction
  ) {
    LOGGER.info(
      String.format(
        'Getting token set for strings {0} and {1}',
        new List<Object>{ s1, s2 }
      )
    );
    s1 = stringFunction.apply(s1);
    s2 = stringFunction.apply(s2);

    Set<String> tokens1 = Utils.tokenizeSet(s1);
    Set<String> tokens2 = Utils.tokenizeSet(s2);

    Set<String> intersection = SetUtils.intersection(tokens1, tokens2);
    Set<String> diff1to2 = SetUtils.difference(tokens1, tokens2);
    Set<String> diff2to1 = SetUtils.difference(tokens2, tokens1);

    String sortedInter = Utils.sortAndJoin(intersection, ' ').trim();
    String sorted1to2 = (sortedInter +
      ' ' +
      Utils.sortAndJoin(diff1to2, ' '))
      .trim();
    String sorted2to1 = (sortedInter +
      ' ' +
      Utils.sortAndJoin(diff2to1, ' '))
      .trim();

    List<Integer> results = new List<Integer>();

    results.add(ratio.apply(sortedInter, sorted1to2));
    results.add(ratio.apply(sortedInter, sorted2to1));
    results.add(ratio.apply(sorted1to2, sorted2to1));

    return Collections.max(results);
  }
}
