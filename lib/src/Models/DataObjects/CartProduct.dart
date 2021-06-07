class CartProduct{
  final int lineID;
  final int productID;
  final String name;
  double quantity;
  final double discountPercentage;
  final String color;
  final double originalUnitPrice;
  final double vatPercentage;

  CartProduct(this.lineID,this.color,this.name,this.discountPercentage,this.productID,this.quantity,this.originalUnitPrice,this.vatPercentage);
}