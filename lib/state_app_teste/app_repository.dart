class AppRepository {
  
  Future<bool> obterResposta() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}