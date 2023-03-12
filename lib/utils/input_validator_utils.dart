class InputValidatorUtils {
  static bool isAddressValidBep20(String address) {
    if (address == null) {
      return false;
    }

    if (address.length != 42) {
      return false;
    }

    if (!address.startsWith("0x")) {
      return false;
    }

    try {
      BigInt.parse(address.substring(2), radix: 16);
    } catch (e) {
      return false;
    }

    return true;
  }

  static bool isValidFullName(String name) {
    if (name == null || name.isEmpty) {
      return false;
    }

    final nameParts = name.trim().split(' ');

    if (nameParts.length < 2) {
      return false;
    }

    // Check if each name part starts with a capital letter
    for (final namePart in nameParts) {
      if (!RegExp(r'^[A-Za-z][a-z]*$').hasMatch(namePart)) {
        return false;
      }
    }

    return true;
  }

  static bool isValidNumber(String phoneNumber) {
    final RegExp canadianPhoneNumberRegex = RegExp(
        r'^\+?1?[\s-]?\(?(?:[2-9][0-8]|[2-9][1-9]|[01][0-9])\)?[\s-]?[2-9][0-9]{2}[\s-]?[0-9]{4}$');

    final RegExp usPhoneNumberRegex = RegExp(
        r'^\+?1?[\s-]?\(?(?:[2-9][0-8]|[2-9][1-9]|[01][0-9])\)?[\s-]?[2-9][0-9]{2}[\s-]?[0-9]{4}$');

    final RegExp drcPhoneNumberRegex = RegExp(
        r'^\+?243[\s-]?(\d{2})[\s-]?(\d{3})[\s-]?(\d{2})[\s-]?(\d{2})$');

    return canadianPhoneNumberRegex.hasMatch(phoneNumber) ||
        usPhoneNumberRegex.hasMatch(phoneNumber) ||
        drcPhoneNumberRegex.hasMatch(phoneNumber);
  }
}