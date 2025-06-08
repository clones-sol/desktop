String formatNumber(double? num) {
  if (num == null) return '0.00';
  return num.toStringAsFixed(2);
}

String shortAddress(String? address) {
  if (address == null || address.length < 8) return address ?? '';
  return '${address.substring(0, 4)}...${address.substring(address.length - 4)}';
}
