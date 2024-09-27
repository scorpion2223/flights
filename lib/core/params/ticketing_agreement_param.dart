class TicketingAgreementParam{
  Map<String,dynamic> toJson(){
    return {
      "ticketingAgreement": {
        "option": "DELAY_TO_CANCEL",
        "delay": "6D"
      },

    };
  }
}