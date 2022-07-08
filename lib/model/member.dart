// ignore: camel_case_types
class Member {
  final String id;
  final String name;
  final String pinyin;
  final String? tName;
  final String? pName;
  final String? nickname;
  final String? company;
  final String? joinDay;
  final String? height;
  final String? bloodType;
  final String starSign12;
  final String? birthPlace;
  final String? birthDay;
  final String experience;
  final String? speciality;
  final String? hobby;
  final String? catchPhrase;

  Member({this.bloodType, this.speciality, this.hobby,required this.id,required this.name, this.tName,
    this.pName, this.nickname, this.company,required this.pinyin,
    this.joinDay, this.height,required this.starSign12, this.birthPlace,required this.experience,
    this.birthDay,this.catchPhrase});


}