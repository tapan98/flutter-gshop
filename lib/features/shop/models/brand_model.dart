import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String brandImage;
  final String brandName;
  final bool isVerified;

  BrandModel({
    required this.brandImage,
    required this.brandName,
    required this.isVerified,
  });

  factory BrandModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() == null) {
      return BrandModel.empty;
    }
    final Map<String, dynamic> data = snapshot.data()!;
    final String brandImage = data[brandImageKey] ?? '';
    final String brandName = data[brandNameKey] ?? '';
    final bool isVerified = data[brandIsVerifiedKey] ?? false;

    return BrandModel(
        brandImage: brandImage, brandName: brandName, isVerified: isVerified);
  }

  static BrandModel get empty => BrandModel(
        brandImage: '',
        brandName: '',
        isVerified: false,
      );

  // Constants
  static const String brandImageKey = "BrandImage";
  static const String brandNameKey = "BrandName";
  static const String brandIsVerifiedKey = "IsVerified";
}
