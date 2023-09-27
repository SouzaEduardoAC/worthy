class ApiResponse<T> {
  bool success = false;
  String message = '';
  T result;

  ApiResponse.ok (this.result) {
    success = true;
  }

  ApiResponse.error (this.result) {
    success = false;
  }
}