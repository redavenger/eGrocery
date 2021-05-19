//Remote Api URL
import 'package:flutter/material.dart';

const String BASE_URL = "https://marvellous-problem.000webhostapp.com";
const String SIGNUP_URL = "$BASE_URL/signup.php";
const String LOGIN_URL = "$BASE_URL/login.php";
const String ADD_NOTE_URL = "$BASE_URL/add_note.php";
const String READ_CATEGORY_URL = "$BASE_URL/read_category.php";
const String READ_PRODUCT_URL = "$BASE_URL/read_product.php";
const String READ_CART_URL = "$BASE_URL/read_cart.php";



// list of colors that we use in our app
const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Colors.lightGreen;

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
