class CustomValidators {
  static isEmail(String? value) {
    // RegExp regex = RegExp(r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");

    if (value!.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
