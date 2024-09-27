class AnnouncementsParam{
  int?flightId;
  int?announcementId;
  AnnouncementsParam(
      this.flightId,
      this.announcementId
      );

  factory AnnouncementsParam.newParam(){
    return AnnouncementsParam(null, null);
  }
  Map<String,dynamic> toJson(){
    return {
      "flight_id": flightId,
      "announcement_id": announcementId
    };
  }
}