// Converts SVG transform attributes to CSS transform properties (as string)
String svgToCssTransform(String svgTransform) {
  // Remplace translate(x, y) par translate(xpx, ypx)
  final translateReg = RegExp(r'translate\(([-\d.,]+),([-\d.,]+)\)');
  final scaleReg = RegExp(r'scale\(([-\d.,]+)\)');

  var result = svgTransform.replaceAllMapped(
    translateReg,
    (match) => 'translate(${match[1]}px, ${match[2]}px)',
  );
  result = result.replaceAllMapped(scaleReg, (match) => 'scale(${match[1]})');
  return result;
}
