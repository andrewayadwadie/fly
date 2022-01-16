import 'package:fly/utils/translations/ar.dart';
import 'package:fly/utils/translations/en.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"en": en, "ar": ar};
}
