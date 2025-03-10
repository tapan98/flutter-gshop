import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/screens/home/home_screen.dart';
import 'package:gshop/features/shop/screens/home/widgets/promo_slider.dart';

/// Promo slider images used by [PromoSlider]
/// to be displayed in [HomeScreen]
class PromoModel {
  String id;
  String name;
  String image;

  PromoModel({
    required this.id,
    required this.name,
    required this.image,
  });

  static PromoModel empty() => PromoModel(id: '', name: '', image: '');

  // convert to map for firestore
  Map<String, dynamic> toMap() => {
        nameKey: name,
        imageKey: image,
      };

  // get data from Firestore document snapshot
  factory PromoModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return PromoModel.empty();
    }

    final data = document.data()!;

    return PromoModel(
      id: document.id,
      name: data[nameKey] ?? '',
      image: data[imageKey] ?? '',
    );
  }

  // constants
  static const String nameKey = "Name";
  static const String imageKey = "Image";
}
