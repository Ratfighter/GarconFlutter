class LoginResponse{
  final String token;
  final int clientid;
  final int storageid;
  final String apiname;
  final DateTime until;
  final DateTime? dayopened;
  LoginResponse(this.token,this.apiname,this.clientid,this.dayopened,this.storageid,this.until);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        clientid = json['clientid'],
        storageid = json['storageid'],
        apiname = json['apiname'],
        until = DateTime.parse(json['until']),
        dayopened = json['dayopened'] == null ? null : DateTime.parse(json['dayopened']);
}