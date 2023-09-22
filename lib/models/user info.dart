class UserInfo{
  var token;
  var success;
  var message;
  var id;
  var username;
  var phone;
  var email;
  var role;
  var status;
  var accountStatus;
  var adminRef;
  var otpResendDate;

  var accountId;
  var accountLevel;
  var createdAt;
  var updatedAt;
  var v;

  var walletId;
  var walletValue;

  var withdrawalPin;
  var adminCode;

  var walletAddress;
  var walletType;




  UserInfo({
    this.token, this.success , this.message , this.id ,this.username , this.phone , this.email , this.role , this.status , this.accountStatus , this.adminRef , this.otpResendDate ,this.accountId , this.accountLevel ,this.createdAt , this.updatedAt ,this.v, this.walletId , this.walletValue,this.withdrawalPin , this.adminCode,
    this.walletAddress , this.walletType
});

  factory UserInfo.init(var data){
    return UserInfo(
      token: data['token'],
      success: data['success'],
      message: data['message'],
      id: data['userData']['_id'],
      username: data['userData']['username'],
      phone: data['userData']['phone'],
      email:data['userData']['email'],
      role: data['userData']['role'],
      status: data['userData']['status'],
      accountStatus: data['userData']['accountStatus'],
      adminRef: data['userData']['adminRef'],
      otpResendDate: data['userData']['otpResendDate'],
      accountId: data['userData']['accountLevel']['_id'],
      accountLevel: data['userData']['accountLevel']['level'],
      createdAt: data['userData']['createdAt'],
      updatedAt: data['userData']['updatedAt'],
      v: data['userData']['__v'],

      walletId: data['userData']['walletId']['_id'],
      walletValue: data['userData']['walletId']['value'],
      withdrawalPin : data['userData']['withdrawalPin'],
      adminCode :data['userData']['adminCode'],
      walletAddress: data['userData']['walletAddress'] ?? 'null',
      walletType: data['userData']['walletType'] ?? 'null',

    );
  }




}