extension DateTimeUtil on DateTime {

  toStringWithoutDeciSecond() {
    final string = toString();
    final index = string.lastIndexOf('.');
    return string.substring(0, index);
  }

  toStringWithoutSecond() {
    final string = toString();
    final index = string.lastIndexOf(':');
    return string.substring(0, index);
  }

}