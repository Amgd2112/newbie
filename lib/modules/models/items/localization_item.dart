import '../models.dart';

class LocalizationItem extends NewbieItem {
  final Language language;
  LocalizationItem({required title, required this.language}) : super(title: title, type: language);
}
