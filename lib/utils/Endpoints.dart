class Endpoints {
  static const String login="/api/login";
  static const String register="/api/register";
  static const String logout="/api/logout";
  static const String coiffures="/api/coiffure";
  static const String getOnecoiffure="/api/coiffure/{id}";
  static const String specialisations="/api/specialisation";
  static const String getOnespecialisation="/api/specialisation/{id}";
  static const String reservationPlaceCoiffure="/api/reservation";
  static const String oneReservationPlaceCoiffure="/api/reservation/{id}";
  static const String getAllReservationsByClient="/api/compte-reservation/{id}";
  static const String getAllReservationsByCoiffure="/api/coiffure-reservation/{id}";
}