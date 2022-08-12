class CouponRow {

  String? gtin_tributario;
  String? valor_comercial;
  String? qtd_emitente;
  String? unidade_emitente;//": "CX",
  String? valor_tributario;//": "11,6000000000",
  String? valor_emitente;//": "11,60",
  String? unidade;//": "CX",
  String? descricao_emitente;//": "DEXASON  4MG CPD/10",
  String? impostos;//": "",
  String? codigo_emitente;//": "3925",
  String? gtin_comercial;//": "7896112194651"

  // ignore: non_constant_identifier_names
  CouponRow({required this.gtin_tributario,required this.valor_comercial, required this.descricao_emitente});

  factory CouponRow.fromJson(Map<String, dynamic> json) {
    return CouponRow(
        gtin_tributario: json['gtin_tributario'],
        valor_comercial: json['valor_comercial'],
        descricao_emitente: json['descricao_emitente']
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'gtin_tributario': gtin_tributario,
        'valor_comercial': valor_comercial,
        'descricao_emitente': descricao_emitente
      };
}