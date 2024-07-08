class CartModel {
  String? itemspricetotal;
  String? countitems;
  String? cartId;
  String? cartItemsid;
  String? cartUsersid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;

  CartModel(
      {this.itemspricetotal,
      this.countitems,
      this.cartId,
      this.cartItemsid,
      this.cartUsersid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat});
  CartModel.fromJson(Map<String, dynamic> json) {
    itemspricetotal = json['itemsprice'].toString();
    countitems = json['countitems'].toString();
    cartId = json['cart_id'].toString();
    cartItemsid = json['cart_itemsid'].toString();
    cartUsersid = json['cart_usersid'].toString();
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDiscount = json['items_discount'].toString();
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemspricetotal;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_usersid'] = this.cartUsersid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}
