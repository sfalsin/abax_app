class CouponHeader {

  String? numero;//"139083",
  String? endereco;//": "Av Hugo Musso, \r\n                1534 \r\n                Lojas 1 e 2",
  String? dados;//": "<c>|<b>Cartao: </b> R$ 11,60   (REDESHOP CIELO)</c>|<c>Numero COO: 295129</c>|<c>Operador: 110643   Vendedor: 65133</c>|<c>Trib aprox R$:1,56 Fed e R$:0,00 Est e R$:0,00 Muni|Fonte: IBPT  ca7gi3</c>|<c>Obrigado e Volte Sempre.</c>|<c>Versao do PDV: 238.6.1</c>",
  String? bairro;//": "Praia da Costa",
  String? municipio;//": "3205200\r\n                -\r\n                VILA VELHA",
  String? cnpj;//": "06.626.253/0296-48",
  String? modelo;//": "65",
  String? cep;//": "29101-280",
  String? uf;//": "ES",
  String? total;//": "11,60",
  String? serie;//": "16",
  String? razao_social;//": "EMPREENDIMENTOS PAGUE MENOS S.A.",
  String? inscricao_estadual;//": "082446393",
  String? data_emissao;//": "15/06/2022 17:48:43-03:00"

  // ignore: non_constant_identifier_names
  CouponHeader({required this.numero,required this.cnpj, required this.total});

  factory CouponHeader.fromJson(Map<String, dynamic> json) {
    return CouponHeader(
        numero: json['numero'],
        cnpj: json['cnpj'],
        total: json['total']
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'numero': numero,
        'cnpj': cnpj,
        'total': total
      };
}