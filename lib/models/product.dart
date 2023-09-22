

class Product{
  var success;
  var message;
  var productimageUrl;
  var productName;
  var productPrice;
  var productCommission;
  Product({this.success , this.message , this.productimageUrl , this.productName , this.productPrice , this.productCommission});

  factory Product.init(var data){
    return Product(
      success: data['success'],
      message: data['message'],
      productimageUrl: data['product']['imgUrl'],
      productName: data['product']['name'],
      productPrice: data['product']['price'],
      productCommission: data['commission'],
    );
  }

}