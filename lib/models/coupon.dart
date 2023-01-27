
import 'package:abax/models/coupon_header.dart';
import 'package:abax/models/coupon_row.dart';

class Coupon {
  late CouponHeader nf;//"139083",
  late List<CouponRow> rows;//

  Coupon({required this.nf,required this.rows});

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
        nf: json['nf'],
        rows: json['rows']
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'nf': nf,
        'rows': rows
      };
}