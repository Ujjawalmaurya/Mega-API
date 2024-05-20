class APIServices {
  //
  static Future<String> getHealth() async {
    var res = await Future.delayed(const Duration(seconds: 1));
    return res;
  }
}
