import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

// collections

const userCollections = "users";
const doctorConllections = "doctors";
const productCollections = "products";
const workoutCollections = "workout";
const ordersCollections = "Orders";
const cartCollections = "cart";
