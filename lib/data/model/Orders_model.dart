class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersCoupon;
  String? ordersDatetime;
  String? ordersPaymantmethod;
  String? ordersStatus;
  String? ordersTotalprice;
  String? addressId;
  String? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;
  String? addressPhone;
  String? addressNote;
  String? addressHome;
  String? addressFloor;
  String? ordersRating;
  String? ordersNoterating;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPaymantmethod,
      this.ordersStatus,
      this.ordersTotalprice,
      this.ordersRating,
      this.ordersNoterating,
      this.addressId,
      this.addressUsersid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressName,
      this.addressPhone,
      this.addressNote,
      this.addressHome,
      this.addressFloor});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'].toString();
    ordersUsersid = json['orders_usersid'].toString();
    ordersAddress = json['orders_address'].toString();
    ordersType = json['orders_type'].toString();
    ordersPricedelivery = json['orders_pricedelivery'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    ordersDatetime = json['orders_datetime'];
    ordersPaymantmethod = json['orders_paymantmethod'].toString();
    ordersStatus = json['orders_status'].toString();
    ordersTotalprice = json['orders_totalprice'].toString();
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'].toString();
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
    addressPhone = json['address_phone'].toString();
    addressNote = json['address_note'];
    addressHome = json['address_home'];
    addressFloor = json['address_floor'];
    ordersRating = json['orders_rating'].toString();
    ordersNoterating = json['orders_noterating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymantmethod'] = this.ordersPaymantmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_name'] = this.addressName;
    data['address_phone'] = this.addressPhone;
    data['address_note'] = this.addressNote;
    data['address_home'] = this.addressHome;
    data['address_floor'] = this.addressFloor;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    return data;
  }
}
