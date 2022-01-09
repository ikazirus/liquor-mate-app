import 'package:easy_localization/easy_localization.dart';

String? nameValidator(String? text) {
  if (text == null || text.trim().isEmpty) return tr("home.required");

  String trimmedText = text.trim();

  if (trimmedText.length < 4) return tr("home.enter_name_val1");

  if (trimmedText.contains(" ") && trimmedText.split(" ").first.length < 4) {
    return tr("home.enter_name_val4");
  }

  if (trimmedText.length > 15) return tr("home.enter_name_val2");

  if (!RegExp('^[a-zA-Z ]+\$').hasMatch(trimmedText)) {
    return tr("home.enter_name_val3");
  }
}

String? telephoneValidator(String? text) {
  if (text == null || text.trim().isEmpty) return tr("home.required");

  String trimmedText = text.trim().replaceAll(" ", "");

  if (trimmedText.length != 10 ||
      !RegExp('^07\\d{8}\$').hasMatch(trimmedText)) {
    return tr("reg.errors.invalid_num");
  }

  if (!(trimmedText.startsWith("077") ||
      trimmedText.startsWith("076") ||
      trimmedText.startsWith("075") ||
      trimmedText.startsWith("072") ||
      trimmedText.startsWith("078"))) return tr("reg.errors.inval_network");
}
