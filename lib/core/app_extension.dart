extension Round on double {
  int get fixedRound {
    if (this == roundToDouble()) return toInt();
    return toInt() + 1;
  }
}
