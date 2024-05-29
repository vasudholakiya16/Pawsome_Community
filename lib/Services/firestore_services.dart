

import '../consts/firebase_constent.dart';

class FireStoreServices {
  static getUser(uid) {
    // Get user Data
    return firestore
        .collection(userCollections)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  // get product accoding to category

  static getProducts(category) {
    return firestore
        .collection(productCollections)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }




  static getSubCategoryProduct(title) {
    return firestore
        .collection(productCollections)
        .where('p_subcategory', isEqualTo: title)
        .snapshots();
  }

  // get workout
  static getWorkout(workout) {
    return firestore
        .collection(workoutCollections)
        .where('w_category', isEqualTo: workout)
        .snapshots();
  }

  static getSubCategoryInWorkout(title) {
    return firestore
        .collection(productCollections)
        .where('w_subcategory', isEqualTo: title)
        .snapshots();
  }

  // Get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollections)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  // Delete document
  static deleteDocument(docId) {
    return firestore.collection(cartCollections).doc(docId).delete();
  }

// Get all chat messages
//   static getChatMessages(docId) {
//     return firestore
//         .collection(chatCollections)
//         .doc(docId)
//         .collection(messagesCollections)
//         .orderBy('created_on', descending: false)
//         .snapshots();
//   }

  static getAllOrders() {
    return firestore
        .collection(ordersCollections)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getWishlist() {
    return firestore
        .collection(productCollections)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  // static getAllMessages() {
  //   return firestore
  //       .collection(chatCollections)
  //       .where('toId', isEqualTo: currentUser!.uid)
  //       .snapshots();
  // }

  static getCounts() async {
    var res = await Future.wait([
      firestore
          .collection(cartCollections)
          .where('added_by', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(productCollections)
          .where('p_wishlist', arrayContains: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(ordersCollections)
          .where('order_by', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
    ]);
    return res;
  }

  static allproducts() {
    return firestore.collection(productCollections).snapshots();
  }

  // Get fetured product method
  static getFeaturedProduct() {
    return firestore
        .collection(productCollections)
        .where("is_featured", isEqualTo: true)
        .get();
  }

// Search products
  static searchProducts(title) {
    return firestore.collection(productCollections).get();
  }
}
