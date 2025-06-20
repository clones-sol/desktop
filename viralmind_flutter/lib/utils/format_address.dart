extension AddressUtils on String {
  String shortAddress() {
    if (length < 8) return this;
    return '${substring(0, 4)}...${substring(length - 4)}';
  }
}
