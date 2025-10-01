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
      if(response.statusCode ==200){
        final authResponse = AuthResponse.fromJson(response.data);
      }
    } on DioException catch (e){
      print("Error en login ${e.response?.data ?? e.messague}")
    }
    return null;
  }

  //for register
  Future<bool> register(registerRequest: RegisterRequest) async {
    try{
      final response = await apiClient.post('auth/signup', data: registerRequest.toJson());
      return reponse.statusCode == 201;
    } on DioException catch (e){
      print("Error en register: ${e.response?.data ?? e.message}");
      return false;
    }
  }

  Future<void> logout ()async{
    apiClient.clearToken();
  }

}