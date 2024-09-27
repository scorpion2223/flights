class Country {
  final String name;
  final List<City> cities;

  Country(this.name, this.cities);
}

class City {
  final String name;
  final String postalCode;

  City(this.name, this.postalCode);
}


  List<Country> countries = [
    Country('United States', [
      City('New York', '10001'),
      City('Los Angeles', '90001'),
      City('Chicago', '60601'),
      City('Houston', '77001'),
      City('Phoenix', '85001'),
    ]),
    Country('Canada', [
      City('Toronto', 'M5H'),
      City('Vancouver', 'V5K'),
      City('Montreal', 'H1A'),
      City('Calgary', 'T2P'),
      City('Ottawa', 'K1A'),
    ]),
    Country('United Kingdom', [
      City('London', 'E1 6AN'),
      City('Manchester', 'M1 1AE'),
      City('Birmingham', 'B1 1AA'),
      City('Glasgow', 'G1 1AA'),
      City('Liverpool', 'L1 1AA'),
    ]),
    Country('Australia', [
      City('Sydney', '2000'),
      City('Melbourne', '3000'),
      City('Brisbane', '4000'),
      City('Perth', '6000'),
      City('Adelaide', '5000'),
    ]),
    Country('Germany', [
      City('Berlin', '10115'),
      City('Munich', '80331'),
      City('Frankfurt', '60311'),
      City('Hamburg', '20095'),
      City('Cologne', '50667'),
    ]),
    Country('India', [
      City('Mumbai', '400001'),
      City('Delhi', '110001'),
      City('Bangalore', '560001'),
      City('Chennai', '600001'),
      City('Kolkata', '700001'),
    ]),
    Country('Brazil', [
      City('São Paulo', '01000-000'),
      City('Rio de Janeiro', '20000-000'),
      City('Salvador', '40000-000'),
      City('Brasília', '70000-000'),
      City('Fortaleza', '60000-000'),
    ]),
    Country('Japan', [
      City('Tokyo', '100-0001'),
      City('Osaka', '530-0001'),
      City('Yokohama', '220-0001'),
      City('Nagoya', '460-0001'),
      City('Sapporo', '060-0001'),
    ]),
    Country('France', [
      City('Paris', '75001'),
      City('Marseille', '13001'),
      City('Lyon', '69001'),
      City('Toulouse', '31000'),
      City('Nice', '06000'),
    ]),
    Country('Italy', [
      City('Rome', '00100'),
      City('Milan', '20100'),
      City('Naples', '80100'),
      City('Turin', '10100'),
      City('Palermo', '90100'),
    ]),
    Country('Russia', [
      City('Moscow', '101000'),
      City('Saint Petersburg', '190000'),
      City('Novosibirsk', '630000'),
      City('Yekaterinburg', '620000'),
      City('Nizhny Novgorod', '600000'),
    ]),
    Country('Mexico', [
      City('Mexico City', '01000'),
      City('Guadalajara', '44000'),
      City('Monterrey', '64000'),
      City('Puebla', '72000'),
      City('Tijuana', '22000'),
    ]),
    Country('South Africa', [
      City('Johannesburg', '2000'),
      City('Cape Town', '8000'),
      City('Durban', '4000'),
      City('Pretoria', '0001'),
      City('Port Elizabeth', '6001'),
    ]),
    // Add more countries and cities as needed
  ];

