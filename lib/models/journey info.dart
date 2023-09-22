class JourneyInfo{
  var success;
  var message;
  var id;
  var userId;
  var username;
  var currentStage;
  var maxStagesNumber;
  var status;
  var createdAt;
  var updatedAt;
  var v;
  var todayRewards;
  var createdDate;
  var updatedData;





  JourneyInfo({
     this.success ,this.message , this.id , this.userId ,this.username , this.currentStage, this.maxStagesNumber,this.status ,this.createdAt , this.updatedAt ,this.v,this.todayRewards,
     this.createdDate , this.updatedData,
  });

  factory JourneyInfo.init(var data){
    return JourneyInfo(
     success: data['success'],
      message: data['message'],
      id: data['journey']['_id'],
      userId: data['journey']['userId']['_id'],
      username: data['journey']['userId']['username'],
      currentStage: data['journey']['currentStage'],
      maxStagesNumber:  data['journey']['maxStagesNumber'],
      status: data['journey']['status'],
      createdAt:  data['journey']['createdAt'],
      updatedAt:  data['journey']['updatedAt'],
      v:   data['journey']['__v'],
      todayRewards:  data['journey']['todayRewards'],






    );
  }





}