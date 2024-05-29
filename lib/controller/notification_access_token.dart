import 'dart:developer';

import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';



class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async =>
      _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "stripesetupproject",
          "private_key_id": "eaad922fd6a24c4bf265dd7358e063558a0147f0",
          "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC82uKau33ShLNd\nKu3GhBK2KN4Fhi01IeE8Tb6lnU8iqAFQJfcIZOR6Ib1nKuEo40+snB48QUSRpAZE\ntSZfKjIdoUeZ4Qs31vTvShmhCN6nNyBh/r46t8Zv81KBO31mOtdAc2mOkbf4eHP/\nJM5CCle3zyaOXz2ediRfF8ijwpqok9S7TX1HeGg5hL3zUqEWL5mP1IORnLM2tiC+\niBm1gMqKdDVQ22b8ROa+VmKn8XJ0kOiEJT/d4BUt4mhgRuNQAr9GuC5gyJS3njmL\nHE3YycokPUHRW9i8ut19U+L4T8FRWCncRpT2hr86XzH+u+qEZ0ctlRFcRmFYVxRB\nAMW/zvetAgMBAAECggEAFhXCyjWC0UuTbiHHDKAFUCgXTq4SO1Rq8pJk6RksV/Et\ntiG6cdDapy2q6JWrHwz2FEltf75iNmXoFcDZa+eTVMO3i9c1aKJKonEX7i0LXKKl\nttADjvpOymi6DULXt0zKP08/2NxRl0z+w6eaNz7eYzBmYd/hZNaMClLNs9jeHTh4\nrFmVp+RNzBzHwdVESOcnygpts4BbWjgd1dHLEY/KUi95FikkPJH+GWL/Ag2F04LB\nZED2HySI9QbCf97ZCrb0jrNv1wRnryDZD1cn3t44cR4VTZ044JWBi9lepl3tHqzy\nAGTzKeMRks1rNDjaXp7y7lNEy7cKWc8b7Y49oqSiAQKBgQD33BNWPnxRIbF/U04z\n0Lx38o4jvf2ZjipgSHbsloZaAz8BKDTNSgMHCT0Rp3rjdAxWQP6F1vWdymyT74sS\nCMoGjD8b5neM82XR1XIRHn+IPO9xoDkfeGNizBSRWU4TBKRA2XQP/CF5vyBE8Td5\nJVVvi7Mhv7PHkp0up5kmhSAT9QKBgQDDDreuM2hkku3WdErE+1BegFc3z/H6TqSa\nDMsiUewlo72lRfiO0QwSoltOsgPsfuUkd3LOVR+j9nFNic7Ch1rzVCBnGwsPqkgq\nPfET6JVeySgwAGqoPOnYtbFW+XFDhhY5zSU9Zq4bmTVfXp4ksiHS6dNm08J/jly2\nJRcUxyq52QKBgQDR51mk5yQG3V7hMl5++R4zAoIneMWk3kW65oN4Vv2Oi0M3KqKU\n3EH2GnfSVKB4sZWlEkO6etHlAEG1gt6mtjTJGMp1SVcjUhl/e6CvKMHeUaSB+KuH\noD+isqwUb6nz5zFnDgEBbIe5AAhG+nT9LoXNAmUAhsWslNhyY1MK0SDaZQKBgGU5\nTATw1KnsvdRewTZ8HPcNrzVdinuVOEJhhUEoNl5KHO6Z4yVqQtOgwbWTGAowyAUm\nn8OH1UWnbKEKdOvqhj5kV/RpylG00oJpZqQoPOvVhC905+Sqx8gYchFqnWanPP1+\nAmdc09mqplH5riPo9TiY84YXOoYrgN1dXh8ARKHxAoGBAKXr+8OEL+cvb1cMZm+6\n9Erza6FE2oqBNYC0ywvQicqBf6HaIvHHiK3VVtx0jxZXqthmS5XIUxJmgzXzt9Wz\n2HewczEq/eoxtq2ntCfzCDvx7Uv1WAj2/7COKVOeFsjZPRPoUWLoUHHwepJR3tHr\nfSeWmy9IJnBChdD5zrdEQ7s9\n-----END PRIVATE KEY-----\n",
          "client_email":
          "firebase-adminsdk-4dc5a@stripesetupproject.iam.gserviceaccount.com",
          "client_id": "103215490134304445658",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-4dc5a%40stripesetupproject.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
