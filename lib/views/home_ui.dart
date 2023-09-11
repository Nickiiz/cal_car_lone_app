import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; //importตัวนี้จะได้ ตัวแปรที่ชื่อว่า NumberFormat

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //setค่าเพื่อใช้กำหนดรูปแบบตัวเลขแบบมี , กับ .
  var nf = NumberFormat('#,##0.00');
  TextEditingController _carPriceCtrl = TextEditingController(text: '');
  TextEditingController _interestCtrl = TextEditingController(text: '');
  String? _downpay = '10';
  String? _selectYearPay = '1';

  List<DropdownMenuItem<String>> get _dropdownItemYearPay {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: '1',
        child: Text('12 งวด (1 ปี)'),
      ),
      DropdownMenuItem(
        value: '2',
        child: Text('24 งวด (2 ปี)'),
      ),
      DropdownMenuItem(
        value: '3',
        child: Text('36 งวด (3 ปี)'),
      ),
      DropdownMenuItem(
        value: '4',
        child: Text('48 งวด (4 ปี)'),
      ),
      DropdownMenuItem(
        value: '5',
        child: Text('60 งวด (5 ปี)'),
      ),
      DropdownMenuItem(
        value: '6',
        child: Text('72 งวด (6 ปี)'),
      ),
      DropdownMenuItem(
        value: '7',
        child: Text('84 งวด (7 ปี)'),
      ),
    ];
    return menuItem;
  }

  _showWarningDialog(context, msg) async {
    //แจ้งเตือนเมื่อผู้ใช้ป้อนไม่ครบ
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: Colors.deepOrange,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.kanit(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _showResultDialog(context, msg) async {
    //แจ้งเตือนเมื่อผู้ใช้ป้อนครบแสดงผลที่ถูกต้อง
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'ยอดผ่อนรถต่อเดือน',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: Colors.deepOrange,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.kanit(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'คำนวนค่างวดรถ',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.10,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.18,
                backgroundImage: AssetImage(
                  'assets/images/car.jpg',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคา (บาท)',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: TextField(
                  controller: _carPriceCtrl,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.kanit(
                    color: Colors.grey[700],
                  ),
                  decoration: InputDecoration(
                    hintText: '0.00',
                    hintStyle: GoogleFonts.kanit(),
                    suffixText: 'บาท',
                    suffixStyle: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เงินดาว (%)',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downpay = data;
                      });
                    },
                    value: '10',
                    groupValue: _downpay,
                    activeColor: Colors.deepOrangeAccent,
                  ),
                  Text(
                    '10%',
                  ),
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downpay = data;
                      });
                    },
                    value: '20',
                    groupValue: _downpay,
                    activeColor: Colors.deepOrangeAccent,
                  ),
                  Text(
                    '20%',
                  ),
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downpay = data;
                      });
                    },
                    value: '25',
                    groupValue: _downpay,
                    activeColor: Colors.deepOrangeAccent,
                  ),
                  Text(
                    '25%',
                  ),
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downpay = data;
                      });
                    },
                    value: '30',
                    groupValue: _downpay,
                    activeColor: Colors.deepOrangeAccent,
                  ),
                  Text(
                    '30%',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนปีที่ผ่อน',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: _dropdownItemYearPay,
                      value: _selectYearPay,
                      onChanged: (String? value) {
                        setState(() {
                          _selectYearPay = value;
                        });
                      },
                      style: GoogleFonts.kanit(
                        color: Colors.grey[700],
                      ),
                      iconEnabledColor: Colors.grey[700],
                      dropdownColor: Colors.deepOrange[50],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ดอกเบี้ย (%) ต่อปั',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: TextField(
                  controller: _interestCtrl,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.kanit(
                    color: Colors.grey[700],
                  ),
                  decoration: InputDecoration(
                    hintText: '0.00',
                    hintStyle: GoogleFonts.kanit(),
                    suffixText: '%ต่อปี',
                    suffixStyle: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_carPriceCtrl.text.isEmpty == true) {
                    _showWarningDialog(context, 'ป้อนราคารถด้วย...');
                  } else if (_interestCtrl.text.isEmpty == true) {
                    _showWarningDialog(context, 'ป้อนดอกเบี้ย(%)ต่อปีด้วย');
                  } else {
                    //ราคารถ carPrice,เงินดาวน์ moneyDownPay,ค่าผ่อนต่อเดือน CarMoneyPayPerMonth,จำนวนผ่อนต่อเดือน yearPay,ราคารถ totalCarPrice,ดอกเบี้ยต่อปี moneyInterest แปลงจาก interest
                    //พร้อมคำนวน โดยเริ่มจาก
                    //คำนวนเงินดาวน์
                    //แปลงราคารถที่ป้อความให้เป็นตัวเลขก่อน
                    double carPrice = double.parse(_carPriceCtrl.text);
                    //แปลงเงินดาวน์ให้เป็นตัวเลข เพราะ _downPay เป็นString downPay ตั้งเองอะไรก็ได้
                    int downPay = int.parse(_downpay!);
                    //คำนวนเงินดาวน์ moneyDownPay ตั้งเองอะไรก็ได้
                    double moneyDownPay = carPrice * downPay / 100;
                    //คำนวนยอดจัด totalCarPrice ตั้งเองอะไรก็ได้
                    double totalCarPrice = carPrice - moneyDownPay;
                    //สุดท้ายคำนวนดอกเบี้ยต่อปี = ยอดจัด * ดอกเบี้ย(%) / 100 interest ตั้งเอง
                    double interest = double.parse(_interestCtrl.text);
                    //แปลงดอกเบี้ยให้เป็นตัวเลข
                    double moneyInterest = totalCarPrice * interest / 100;
                    //คำนวนดอกเบี้ยตามจำนวนปีที่ผ่อน = ดอกเบี้ยต่อปี * จำนวนปีที่ผ่อนยังเป็นStringอยู่ ต้องแปลงก่อน
                    int yearPay = int.parse(_selectYearPay!);
                    //เริ่มคำนวนดอกเบี้ยต่อ
                    double moneyInterestTotal = moneyInterest * yearPay;
                    //คำนวนเงินที่จะต้องนำไปผ่อน = ยอดจัด + ดอกเบี่ยตามจำนวนปีที่ผ่อน
                    double carPriceTotal = totalCarPrice + moneyInterestTotal;
                    //คำนวนเงินที่จะผ่อนต่อเดือน = เงินที่ต้องไปคิดยอดผ่อน /(จำนวนปีที่ผ่อน)*12)
                    double carMoneyPayPerMonth = carPriceTotal / (yearPay * 12);
                    //แสดงผลราคารถ เงินดาวน์ จำนวนเดือน และเงินที่ผ่อน
                    String msgShow =
                        'รถราคา ${nf.format(carPrice)}บาท\nดาวน์ ${downPay}% เป็นเงิน ${nf.format(moneyDownPay //, คืออะไร มาจากไหน555555
                            )}บาท\nจำนวนเดือนผ่อน ${yearPay * 12}เดือน\nค่าผ่อนต่อเดือน ${nf.format(carMoneyPayPerMonth)} บาท';
                    _showResultDialog(context, msgShow);
                  }
                },
                child: Text(
                  'คำนวนค่างวดรถ',
                  style: GoogleFonts.kanit(),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.width * 0.15),
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
