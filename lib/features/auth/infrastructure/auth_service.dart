class AuthService{
  final ApiClient apiClient;

  AuthService(this.apiClient);

  //for login
  Future<String?> login(String email, String password) async{
    try{
      final response = await apiClient.dio.post(
        "/auth/login",
        data:{
          "email": email,
          "password": password
        }
      );
      if(response.status ==200){
        final authResponse = AuthResponse.fromJson(response.data);
      }
    } on DioException catch (e){
      print("Error en login ${e.response?.data ?? e.messague}")
    }
    return null;
  }
  
}