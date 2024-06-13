Map<String, dynamic> convertIterableToMap(
    Iterable<Map<String, dynamic>> iterableOfMaps) {
  return iterableOfMaps.fold({}, (combinedMap, map) {
    combinedMap.addAll(map);
    return combinedMap;
  });
}
