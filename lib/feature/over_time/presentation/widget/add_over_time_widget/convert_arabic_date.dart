String convertArabicDate(String arabicDate) {
//  ١٦-١٠-٢٠٢٥T٠٠:٠٠:٠٠.٠٠٠
  const arabicDigits = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
  const englishDigits = ['0','1','2','3','4','5','6','7','8','9'];

  arabicDate= arabicDate.toString().substring(0,10);
  for (int i = 0; i < arabicDigits.length; i++) {
    arabicDate = arabicDate.replaceAll(arabicDigits[i], englishDigits[i]);
  }

  arabicDate = arabicDate.trim();
  final parts = arabicDate.split('-');
  if (parts.length != 3) {
    throw FormatException('Invalid date format: $arabicDate');
  }

  final day = int.parse(parts[0]);
  final month = int.parse(parts[1]);
  final year = int.parse(parts[2]);

  final date = DateTime(year, month, day); // الساعة 10:00:00
  return date.toIso8601String(); // 2025-10-16T10:00:00.000
}
// main() {
//   String arabicDate = "١٦-١٠-٢٠٢٥T٠٠:٠٠:٠٠.٠٠٠";
//   String convertedDate = convertArabicDate(arabicDate);
//   print("Converted Date: $convertedDate"); // يجب أن يطبع: Converted Date: 2025-10-16
// }