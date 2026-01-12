class Validators {
  static String? validateNotEmpty(String? value, {String field = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$field cannot be empty";
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Price cannot be empty";
    }
    final price = double.tryParse(value);
    if (price == null || price < 0) {
      return "Enter a valid price";
    }
    return null;
  }
}
