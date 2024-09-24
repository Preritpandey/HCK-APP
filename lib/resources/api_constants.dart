class API {
  static const _baseUrl = "http://localhost:8000/api/v4";
  static const loginUrl = "${_baseUrl}/student/login";
  static const getRoutineUrl = "${_baseUrl}/routines/ongoing?group=";
  static const refreshTokenUrl = "${_baseUrl}/student/refresh-token";
}
