class API {
  static const _baseUrl = "http://192.168.1.95:8000/api/v4"; //hostel
  // static const _baseUrl = "http://10.22.11.201:8000/api/v4"; //college

  // static const _baseUrl = "http://localhost:8000/api/v4";

  static const loginUrl = "${_baseUrl}/student/login";
  static const getRoutineUrl = "${_baseUrl}/routines/ongoing?group=";
  static const refreshTokenUrl = "${_baseUrl}/student/refresh-token";
}
