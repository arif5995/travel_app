import 'package:travelapp/core/model/toursMdl.dart';
import 'package:travelapp/core/string/string.dart';

class ToursData{
  static List<ToursMdl> getData(){
    var _tours = new List<ToursMdl>();

    _tours.add(ToursMdl(
      title: "Monas",
      description: "Jakarta",
      price: 200000000,
      image: Gambar.img1
    ));
    _tours.add(ToursMdl(
        title: "Monas",
        description: "Jakarta",
        price: 200000000,
        image: Gambar.img1
    ));
    _tours.add(ToursMdl(
        title: "Monas",
        description: "Jakarta",
        price: 200000000,
        image: Gambar.img1
    ));
    _tours.add(ToursMdl(
        title: "Monas",
        description: "Jakarta",
        price: 200000000,
        image: Gambar.img1
    ));
    _tours.add(ToursMdl(
        title: "Monas",
        description: "Jakarta",
        price: 200000000,
        image: Gambar.img1
    ));

    return _tours;
  }
}