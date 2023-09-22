

class ProductHistory{
  var success;
  var message;
  var productHistoryId;
  var productName;
  var productPrice;
  var productCommission;
  var productHistoryStatus;
  var createdDate;
  var updateDate;
  ProductHistory({this.success , this.message , this.productHistoryId , this.productName , this.productPrice , this.productCommission , this.productHistoryStatus , this.createdDate , this.updateDate});

  factory ProductHistory.init(var data1,var data){
    return ProductHistory(
      success: data1['success'],
      message: data1['message'],
      productHistoryId: data['_id'],
      productName: data['product']['name'],
      productPrice: data['product']['price'],
      productCommission: data['commission'],
      productHistoryStatus: data['status'],
      createdDate:  data['createdAt'],
      updateDate: data['updatedAt'],
    );
  }

}