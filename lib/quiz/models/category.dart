import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}

final List<Category> categories = [
  Category(1,"Quan hệ giữa con người", icon: FontAwesomeIcons.peopleCarry),
  Category(2,"Cuộc sống", icon: FontAwesomeIcons.lifeRing),
  Category(3,"Ở nhà", icon: FontAwesomeIcons.home),
  Category(4,"Ở trường", icon: FontAwesomeIcons.school),
  Category(5,"Ở công ty", icon: FontAwesomeIcons.building),
  Category(6,"Tìm việc", icon: FontAwesomeIcons.briefcase),
  Category(7,"Sức khoẻ", icon: FontAwesomeIcons.medkit),
  Category(8,"Sở thích", icon: FontAwesomeIcons.thumbsUp),
  Category(9,"Thế giới", icon: FontAwesomeIcons.globe),
  Category(10,"Thiên Nhiên", icon: FontAwesomeIcons.leaf),
  Category(11,"Tình trạng", icon: FontAwesomeIcons.infoCircle),
  Category(12,"Tai nạn", icon: FontAwesomeIcons.exclamationTriangle),
  Category(13,"Xã hội", icon: FontAwesomeIcons.facebookMessenger),
  Category(14,"kinh tế", icon: FontAwesomeIcons.moneyCheck),
  Category(15,"Chính trị", icon: FontAwesomeIcons.hammer),
  Category(16,"Doanh nghiệp", icon: FontAwesomeIcons.building),
  Category(17,"Công việc", icon: FontAwesomeIcons.laptopCode),
  Category(18,"Phố thị", icon: FontAwesomeIcons.industry),
  Category(19,"Công cộng", icon: FontAwesomeIcons.streetView),
  Category(20,"Giao thông", icon: FontAwesomeIcons.car),
  Category(21,"Công nghiệp", icon: FontAwesomeIcons.industry),
  Category(22,"Quê nhà", icon: FontAwesomeIcons.home),
  
];