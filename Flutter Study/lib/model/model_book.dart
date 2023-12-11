class book{
  int? id;
  String? bookname;
  String? image;
  String? author;
  String? price;
  String? bookstatus;
  int? category;
  int? user;
  bookmap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['bookname']=bookname!;
    mapping['image']=image!;
    mapping['author']=author!;
    mapping['price']=price!;
    mapping['bookstatus']=bookstatus!;
    mapping['category']=category!;
    mapping['user']=user!;
    return mapping;
  }
}