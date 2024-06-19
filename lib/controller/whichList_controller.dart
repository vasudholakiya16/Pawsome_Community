import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var favorites =
      <int, bool>{}.obs; // Map to store favorite status by product ID

  void addToWishlist(int id, BuildContext context) {
    // Logic to add item to wishlist
    favorites[id] = true;
  }

  void removeFromWishlist(int id, BuildContext context) {
    // Logic to remove item from wishlist
    favorites[id] = false;
  }

  bool isFavorite(int id) {
    return favorites[id] ?? false;
  }
}
