String formatIsoDuration(String isoDuration) {
  final regExp = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?');
  final match = regExp.firstMatch(isoDuration);

  if (match == null) return '';

  final hours = int.tryParse(match.group(1) ?? '0') ?? 0;
  final minutes = int.tryParse(match.group(2) ?? '0') ?? 0;
  final seconds = int.tryParse(match.group(3) ?? '0') ?? 0;

  final parts = <String>[];

  if (hours > 0) parts.add('${hours}H');
  if (minutes > 0) parts.add('${minutes}M');
  if (seconds > 0) parts.add('${seconds}S');

  return parts.join(' ');
}
