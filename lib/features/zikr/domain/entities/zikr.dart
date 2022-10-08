class Zikr {
  String id;
  String category;
  String name;
  String arabicText;
  String translationRu;
  String translationTj;
  String translationEng;
  String transcription;
  int count;
  String scientist;

  Zikr(
      {this.id,
      this.category,
      this.name,
      this.arabicText,
      this.translationRu,
      this.translationTj,
      this.translationEng,
      this.transcription,
      this.count,
      this.scientist});

  Zikr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
    arabicText = json['arabic_text'];
    translationRu = json['translation_ru'];
    translationTj = json['translation_tj'];
    translationEng = json['translation_eng'];
    transcription = json['transcription'];
    count = json['count'];
    scientist = json['scientist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['name'] = this.name;
    data['arabic_text'] = this.arabicText;
    data['translation_ru'] = this.translationRu;
    data['translation_tj'] = this.translationTj;
    data['translation_eng'] = this.translationEng;
    data['transcription'] = this.transcription;
    data['count'] = this.count;
    data['scientist'] = this.scientist;
    return data;
  }
}