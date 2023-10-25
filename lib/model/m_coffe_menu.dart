class CoffeMenuModel {
  String coffeName;
  String coffeCategory;
  String coffeDescription;
  String coffePrice;
  String coffePhoto;

  CoffeMenuModel({
    required this.coffeName,
    required this.coffeCategory,
    required this.coffeDescription,
    required this.coffePrice,
    required this.coffePhoto,
  });
}

var coffeMenuModelList = [
  CoffeMenuModel(
    coffeName: 'Americano',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Sejatinya, kopi ini memiliki rasa yang hampir sama dengan kopi hitam. Namun, americano memiliki bahan dasar dari shot espresso yang kemudian dicampur dengan air panas, sehingga menjadi lebih cair. Kopi ini sangat cocok untuk kamu yang suka dengan kopi pahit, namun tidak pekat seperti espresso atau kopi hitam.',
    coffePrice: 'Rp 37.000',
    // coffePriceDetail: [
    //   'Rp 37.000',
    //   'Rp 40.000',
    //   'Rp 42.000',
    // ],
    coffePhoto: 'assets/images/daftar_coffe/americano_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Espreso',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Espreso adalah jenis kopi yang dihasilkan dengan mengekstraksi biji kopi yang sudah digiling dengan menyemburkan air panas di bawah tekanan tinggi.',
    coffePrice: 'Rp 37.000',
    coffePhoto: 'assets/images/daftar_coffe/espresso_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Cappuccino',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Cappuccino adalah minuman kopi yang dibuat dengan campuran espresso, susu panas, dan busa susu.',
    coffePrice: 'Rp 40.000',
    coffePhoto: 'assets/images/daftar_coffe/cappuccino_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Latte',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Latte adalah minuman kopi yang dibuat dengan campuran espresso dan susu panas.',
    coffePrice: 'Rp 38.000',
    coffePhoto: 'assets/images/daftar_coffe/Latte_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Macchiato',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Macchiato adalah minuman kopi yang dibuat dengan campuran espresso dan sedikit susu panas.',
    coffePrice: 'Rp 36.000',
    coffePhoto: 'assets/images/daftar_coffe/Macchiato_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Kopi Hitam',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Kopi hitam adalah minuman kopi yang dibuat dengan menyeduh biji kopi yang sudah digiling dengan air panas.',
    coffePrice: 'Rp 25.000',
    coffePhoto: 'assets/images/daftar_coffe/kopi_hitam_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Kopi Susu',
    coffeCategory: 'Kopi Susu',
    coffeDescription:
        'Kopi susu adalah minuman kopi yang dibuat dengan campuran kopi hitam dan susu.',
    coffePrice: 'Rp 30.000',
    coffePhoto: 'assets/images/daftar_coffe/kopi_susu_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Kopi O',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Kopi O adalah minuman kopi yang dibuat dengan campuran kopi hitam dan gula.',
    coffePrice: 'Rp 27.000',
    coffePhoto: 'assets/images/daftar_coffe/kopi_o_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Kopi Susu O	',
    coffeCategory: 'Kopi Susu',
    coffeDescription:
        'Kopi susu O adalah minuman kopi yang dibuat dengan campuran kopi hitam, susu, dan gula.',
    coffePrice: 'Rp 32.000',
    coffePhoto: 'assets/images/daftar_coffe/kopi_susu_o_coffe.jpeg',
  ),
  CoffeMenuModel(
    coffeName: 'Kopi Tarik',
    coffeCategory: 'Kopi Hitam',
    coffeDescription:
        'Kopi tarik adalah minuman kopi yang dibuat dengan menyedot espresso ke dalam susu panas.',
    coffePrice: 'Rp 33.000',
    coffePhoto: 'assets/images/daftar_coffe/kopi_tarik_coffe.jpeg',
  )
];
