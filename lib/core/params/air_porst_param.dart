class AirPortsParam{
  String?keyword;
  String?countryCode;
  AirPortsParam(
      this.keyword,
      this.countryCode
      );

  factory AirPortsParam.newParam(){
    return AirPortsParam(null,null);

  }

  Map<String,dynamic> toJson(){
    return {
      "keyword":keyword,
      "countryCode":countryCode
    };
  }


}