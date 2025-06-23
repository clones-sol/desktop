String getFaviconUrl(String? domain) {
  if (domain == null || domain.isEmpty) return '';
  final cleanDomain = domain.replaceAll(RegExp(r'^(https?:\/\/)?(www\.)?'), '');
  return 'https://www.google.com/s2/favicons?domain=$cleanDomain&sz=32';
}
