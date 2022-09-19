abstract class ApiConsuomers {
  Future getData({
    required String url,
    Map<String, dynamic>? qary,
    String? token,
    String lang = 'en',
  });

  Future postData(
      {required String url,
      Map<String, dynamic>? qary,
      required Map<String, dynamic>? sendDate,
      String? token,
      String lang = 'en'});

  Future putData(
      {required String url,
      Map<String, dynamic>? qary,
      required Map<String, dynamic>? sendDate,
      required String? token,
      String lang = 'en'});

  Future remove(
      {required String url,
      Map<String, dynamic>? qary,
      Map<String, dynamic>? sendDate,
      required String? token,
      String lang = 'en'});
}
