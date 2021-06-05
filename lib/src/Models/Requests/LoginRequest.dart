class LoginRequest{
  final String validationKey;
  final String clientName;
  final String tenantName;
  LoginRequest(this.validationKey, this.clientName, this.tenantName);

  Map<String, dynamic> toJson() => {
    'ValidationKey': validationKey,
    'ClientName': clientName,
    'TenantName': tenantName
  };
}