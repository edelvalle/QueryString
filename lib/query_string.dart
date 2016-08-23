library query_string;

class QueryString {
  /**
   * Parses the given query string into a Map.
   */
  static Map parse(String query) {
    var search = new RegExp('([^&=]+)=?([^&]*)');
    var result = new Map();

    // Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

    // A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

    // Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1))] = decode(match.group(2));
    }

    return result;
  }

  static String encode(Map<String, dynamic> query) {
    List<String> query_string = [];

    query.forEach((String key, dynamic value) {
      String encoded_key = Uri.encodeComponent(key);
      String encoded_value = Uri.encodeComponent(value.toString());
      query_string.add('$encoded_key=$encoded_value');
    });

    return query_string.join('&');
  }
}
