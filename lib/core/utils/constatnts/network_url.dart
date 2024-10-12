class NetworkUrl{
   //static const String baseUrl = "http://192.168.29.87:8000/api/";
 //  static const String baseUrl = "http://192.168.161.87:8000/api/";
   static const String baseUrl = "http://10.0.2.2:8000/api/";
  // static const String baseUrl = "http://192.168.161.87:8000/api/";


  //static const String baseUrl = "http://192.168.1.103:80/api/";
   ////////////////////////auth////////////////////////////
   static const String registerApiKey = "register";
   static const String loginApiKey = "login";
   static const String logoutApiKey = "logout";
   static const String getTravelersApiKey = "get-traveler/";
   ///////////////////////user/////////////////////////////
   static const String userStoreDocuments = "documents";
   static const String userGetAllDocuments = "documents";
   static const String userGetDocuments = "get-user-documents";
   static const String userModifyDocument = "modify-document";
   static const String userDeleteDocument = "delete-document";
   static const String userAddAddress = "add-user-address";
   static const String userGetDetails = "get-user-details";
   static const String userUpdateDetails = "update-user-details";
   static const String userGetPoints = "get-user-points";
   static const String userGetDocumentsType = "get-document_types";
   /////////////////////global apis ////////////////////////
   static const String getCodesApiKey = "get-IATACodes";
   static const String getCountryCodesApiKey = "get-country-codes";
   static const String getCountriesApiKey = "get-countries";
   static const String getCitiesApiKey="get-cities";
   static const String getAirPortsApiKey =  "get-airports";
   static const String getHotelsApiKey =   "get-hotels";
   static const String getCancellationReasons = "cancellation-reasons";

   //////////////////////////////////////////////////////////////////


  static const String searchFlightOffersApiKey = "get-flight-offer-with-pricing";
  static const String getFlightOfferById = "get-flight-offer-by-id";

  //////////////////////////////booking//////////////////////////////////
static const String bookingStoreApiKey = "book-flight-offer";
   static const String bookingCancelApiKey = "bookings/cancel";
   static const String bookingGetAllApiKey = "get-user-bookings";
   static const String bookingModifyApiKey = "bookings/modify";
   //////////////////////////////payment//////////////////////////////////
   static const String paymentStartApiKey = "create-payment-intent";
   static const String paymentCompleteApiKey = "stripe/webhook";
////////////////////////////announcements////////////////////////
   static const String announcementsGetListApiKey = "announcements-list";
   static const String announcementTripApiKey = "trip-announcements";
/////////////////////////////////////////////////////////////////

}