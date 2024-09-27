class HotelsParam{
  String?cityCode;

  HotelsParam(this.cityCode);
  factory HotelsParam.newParam(){
    return HotelsParam(null);
  }

  Map<String,dynamic> toJson(){
    return {
      "cityCode":cityCode,
    };
  }
}