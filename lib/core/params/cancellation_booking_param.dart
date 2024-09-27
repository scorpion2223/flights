class CancellationBookingParam{
  int ?cancellationReasonId;
  int?bookingID;

  CancellationBookingParam(
      this.cancellationReasonId,
      this.bookingID
      );

  factory CancellationBookingParam.newParam(){
    return CancellationBookingParam(null, null);
  }

  CancellationBookingParam copyWith({
    int ?cancellationReasonId,
    int?bookingID,
}){
    return CancellationBookingParam(cancellationReasonId??this.cancellationReasonId, bookingID??this.bookingID);
  }
  Map<String,dynamic> toJson(){
    return {
      "cancellation_reason_id": cancellationReasonId,
      "booking_id": bookingID
    };
  }

}