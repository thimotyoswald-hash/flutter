// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// void main() {
//   runApp(MaterialApp(
//     title: "Aplikasi Catatan",
//     debugShowCheckedModeBanner: false,
//     home: Home(),
//   ));
// }

// // ====================================================================
// // 1. HOME & SIDEBAR (Persis seperti Tutorial #14)
// // ====================================================================
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // Variabel persis seperti di video #14
//   String gambar1 = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=200&q=80"; // Foto pria
//   String gambar2 = "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80"; // Foto wanita
//   String? backup;

//   String nama1 = "Budi Santoso";
//   String nama2 = "Ani Rahmawati";
//   String? backupnama;

//   // Fungsi ganti user persis seperti di video #14
//   void gantiuser() {
//     this.setState(() {
//       backup = gambar1;
//       gambar1 = gambar2;
//       gambar2 = backup!;

//       backupnama = nama1;
//       nama1 = nama2;
//       nama2 = backupnama!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Buku Catatan"),
//         backgroundColor: Colors.blueGrey[800],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text(nama1),
//               accountEmail: Text("pengguna@catatan.com"),
//               currentAccountPicture: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => Detail(nama: nama1, gambar: gambar1,)
//                   ));
//                 },
//                 child: CircleAvatar(
//                   backgroundImage: NetworkImage(gambar1),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: NetworkImage(
//                           "https://images.unsplash.com/photo-1517842645767-c639042777db?auto=format&fit=crop&w=800&q=80"), // Gambar meja/buku
//                       fit: BoxFit.cover)),
//               otherAccountsPictures: <Widget>[
//                 GestureDetector(
//                   onTap: () => gantiuser(),
//                   child: CircleAvatar(
//                     backgroundImage: NetworkImage(gambar2),
//                   ),
//                 )
//               ],
//             ),
//             ListTile(
//               title: Text("Catatan Penting (Statis)"),
//               trailing: Icon(Icons.note),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanListView()));
//               },
//             ),
//             ListTile(
//               title: Text("Catatan Cloud (JSON)"),
//               trailing: Icon(Icons.cloud_download),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanJSON()));
//               },
//             ),
//             ListTile(
//               title: Text("Tulis Catatan (Input)"),
//               trailing: Icon(Icons.edit),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanInput()));
//               },
//             ),
//             ListTile(
//               title: Text("Close"),
//               trailing: Icon(Icons.close),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text("Silakan buka menu di samping", style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }

// // ====================================================================
// // 2. DETAIL (Persis seperti Tutorial #14)
// // ====================================================================
// class Detail extends StatelessWidget {
//   Detail({required this.nama, required this.gambar});
//   final String nama;
//   final String gambar;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail $nama"),
//         backgroundColor: Colors.blueGrey[800],
//       ),
//       body: Container(
//         child: Center(
//           child: Image(
//             image: NetworkImage(gambar),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ====================================================================
// // 3. LISTVIEW STATIS (Persis seperti Tutorial #11, diganti jadi Catatan)
// // ====================================================================
// class HalamanListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[800],
//         title: Text("Catatan Penting"),
//       ),
//       body: ListView(
//         children: <Widget>[
//           ListCatatan(
//               gambar: "https://cdn-icons-png.flaticon.com/512/2965/2965306.png",
//               judul: "Belanja Bulanan"),
//           ListCatatan(
//               gambar: "https://cdn-icons-png.flaticon.com/512/2965/2965306.png",
//               judul: "Jadwal Rapat"),
//           ListCatatan(
//               gambar: "https://cdn-icons-png.flaticon.com/512/2965/2965306.png",
//               judul: "Tugas Kuliah"),
//           ListCatatan(
//               gambar: "https://cdn-icons-png.flaticon.com/512/2965/2965306.png",
//               judul: "Bayar Tagihan"),
//         ],
//       ),
//     );
//   }
// }

// class ListCatatan extends StatelessWidget {
//   ListCatatan({required this.gambar, required this.judul});

//   final String gambar;
//   final String judul;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       child: Center(
//         child: Row(
//           children: <Widget>[
//             Image(
//               image: NetworkImage(gambar),
//               width: 50.0,
//             ),
//             Container(
//               padding: EdgeInsets.all(10.0),
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       judul,
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     Text(
//                       "Ini adalah detail catatan ...",
//                       style: TextStyle(fontSize: 15.0, color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ====================================================================
// // 4. LISTVIEW JSON (Persis seperti Tutorial #12)
// // ====================================================================
// class HalamanJSON extends StatefulWidget {
//   @override
//   _HalamanJSONState createState() => _HalamanJSONState();
// }

// class _HalamanJSONState extends State<HalamanJSON> {
//   // Variabel persis seperti di video #12
//   List? dataJSON;

//   Future<void> ambilData() async {
//     http.Response hasil = await http.get(
//         Uri.parse("https://jsonplaceholder.typicode.com/posts"), // Tetap pakai posts
//         headers: {"Accept": "application/json"});

//     this.setState(() {
//       dataJSON = json.decode(hasil.body);
//     });
//   }

//   @override
//   void initState() {
//     this.ambilData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Catatan dari Cloud"),
//         backgroundColor: Colors.blueGrey[800],
//       ),
//       body: dataJSON == null 
//         ? Center(child: CircularProgressIndicator()) 
//         : ListView.builder(
//             itemCount: dataJSON!.length,
//             itemBuilder: (context, i) {
//               return Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: Card(
//                   child: Container(
//                     padding: EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           dataJSON![i]['title'],
//                           style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
//                         ),
//                         Text(dataJSON![i]['body'])
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//     );
//   }
// }

// // ====================================================================
// // 5. INPUT, ALERT & SNACKBAR (Persis seperti Tutorial #13)
// // ====================================================================
// class HalamanInput extends StatefulWidget {
//   @override
//   _HalamanInputState createState() => _HalamanInputState();
// }

// class _HalamanInputState extends State<HalamanInput> {
//   // Variabel persis seperti di video #13
//   String teks = "";

//   TextEditingController controllerInput = TextEditingController();
//   TextEditingController controllerAlert = TextEditingController();
//   TextEditingController controllerSnackbar = TextEditingController();

//   void _alertDialog(String str) {
//     if (str.isEmpty) return;
//     AlertDialog alertDialog = AlertDialog(
//       content: Text(
//         str,
//         style: TextStyle(fontSize: 20.0),
//       ),
//       actions: <Widget>[
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
//           child: Text("OK", style: TextStyle(color: Colors.white)),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         )
//       ],
//     );

//     showDialog(context: context, builder: (context) => alertDialog);
//   }

//   void _snackbar(String str) {
//     if (str.isEmpty) return;

//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(
//         str,
//         style: TextStyle(fontSize: 20.0),
//       ),
//       duration: Duration(seconds: 3),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tulis Catatan"),
//         backgroundColor: Colors.blueGrey[800],
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: controllerInput,
//               decoration: InputDecoration(hintText: "Tulis Catatan Biasa"),
//               onSubmitted: (String str) {
//                 setState(() {
//                   teks = str + '\n' + teks;
//                   controllerInput.text = "";
//                 });
//               },
//             ),
//             Text(
//               teks,
//               style: TextStyle(fontSize: 20.0),
//             ),
//             TextField(
//               controller: controllerAlert,
//               decoration: InputDecoration(hintText: "Tulis Catatan Alert..."),
//               onSubmitted: (String str) {
//                 _alertDialog(str);
//                 controllerAlert.text = "";
//               },
//             ),
//             TextField(
//               controller: controllerSnackbar,
//               decoration: InputDecoration(hintText: "Tulis Catatan Snackbar..."),
//               onSubmitted: (String str) {
//                 _snackbar(str);
//                 controllerSnackbar.text = "";
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// void main() {
//   runApp(MaterialApp(
//     title: "Tutorial IDR Corner",
//     debugShowCheckedModeBanner: false,
//     home: Home(), 
//   ));
// }

// // ====================================================================
// // TUTORIAL #14 - SIDEBAR / DRAWER 
// // Data: Indra Armaulana & Jack Sparrow
// // ====================================================================
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // DATA SAMA PERSIS DENGAN VIDEO #14
//   String gambar1 = "http://idrcorner.com/images/icon/gw.jpg";
//   String gambar2 = "https://inspired.disney.co.uk/wp-content/uploads/2017/04/disneyinspired-potc-quiz-v02-660x660-1.jpg";
//   String? backup;

//   String nama1 = "Indra Armaulana";
//   String nama2 = "Jack Sparrow";
//   String? backupnama;

//   void gantiuser() {
//     this.setState(() {
//       backup = gambar1;
//       gambar1 = gambar2;
//       gambar2 = backup!;

//       backupnama = nama1;
//       nama1 = nama2;
//       nama2 = backupnama!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Demo Sidebar (DRAWER)"),
//         backgroundColor: Colors.red[700],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text(nama1),
//               accountEmail: Text("idrcorner@gmail.com"),
//               currentAccountPicture: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => Detail(nama: nama1, gambar: gambar1,)
//                   ));
//                 },
//                 child: CircleAvatar(
//                   backgroundImage: NetworkImage(gambar1),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: NetworkImage(
//                           "http://ichef.bbci.co.uk/images/ic/1600xn/p03gywjs.jpg"),
//                       fit: BoxFit.cover)),
//               otherAccountsPictures: <Widget>[
//                 GestureDetector(
//                   onTap: () => gantiuser(),
//                   child: CircleAvatar(
//                     backgroundImage: NetworkImage(gambar2),
//                   ),
//                 )
//               ],
//             ),
//             ListTile(
//               title: Text("Tutorial #11 - List View"),
//               trailing: Icon(Icons.list),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => HalListView()));
//               },
//             ),
//             ListTile(
//               title: Text("Tutorial #12 - Listview JSON DATA"),
//               trailing: Icon(Icons.code),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => HalJSON()));
//               },
//             ),
//             ListTile(
//               title: Text("Tutorial #13 - Input, Alert & Snackbar"),
//               trailing: Icon(Icons.message),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => HalInput()));
//               },
//             ),
//             ListTile(
//               title: Text("Setting"),
//               trailing: Icon(Icons.settings),
//             ),
//             ListTile(
//               title: Text("Close"),
//               trailing: Icon(Icons.close),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Container(),
//     );
//   }
// }

// class Detail extends StatelessWidget {
//   Detail({required this.nama, required this.gambar});
//   final String nama;
//   final String gambar;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail $nama"),
//         backgroundColor: Colors.red[700],
//       ),
//       body: Container(
//         child: Center(
//           child: Image(
//             image: NetworkImage(gambar),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ====================================================================
// // TUTORIAL #11 - LIST VIEW STATIS
// // Data: HTML, CSS, JS, PHP, Canvas, Bootstrap, dll.
// // ====================================================================
// class HalListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red[900],
//         title: Text("Daftar Tutorial"),
//       ),
//       body: ListView(
//         // DATA DAFTAR TUTORIAL SAMA PERSIS DENGAN VIDEO #11
//         children: <Widget>[
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/html.jpg",
//               judul: "HTML"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/css.jpg",
//               judul: "CSS"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/js.jpg",
//               judul: "JavaScript"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/php.jpg",
//               judul: "PHP"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/canvas.jpg",
//               judul: "Canvas"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/boots.jpg",
//               judul: "Bootstrap"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/jq.jpg",
//               judul: "jQuery"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/ci.jpg",
//               judul: "CodeIgniter"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/game.jpg",
//               judul: "Game"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/ai.jpg",
//               judul: "Illustrator"),
//           ListTutorial(
//               gambar: "http://idrcorner.com/assets/nn/imgs/fl.jpg",
//               judul: "Flutter"),
//         ],
//       ),
//     );
//   }
// }

// class ListTutorial extends StatelessWidget {
//   ListTutorial({required this.gambar, required this.judul});

//   final String gambar;
//   final String judul;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       child: Center(
//         child: Row(
//           children: <Widget>[
//             Image(
//               image: NetworkImage(gambar),
//               width: 100.0,
//               // Tambahan error builder agar jika link idrcorner mati, aplikasi tidak nge-crash
//               errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100), 
//             ),
//             Expanded( 
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 child: Center(
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         judul,
//                         style: TextStyle(fontSize: 20.0),
//                       ),
//                       Text(
//                         "Ini adalah deskripsi tutorial ...",
//                         style: TextStyle(fontSize: 15.0, color: Colors.grey),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ====================================================================
// // TUTORIAL #12 - LISTVIEW JSON DATA
// // Data: https://jsonplaceholder.typicode.com/posts
// // ====================================================================
// class HalJSON extends StatefulWidget {
//   @override
//   _HalJSONState createState() => _HalJSONState();
// }

// class _HalJSONState extends State<HalJSON> {
//   List? dataJSON;

//   Future<void> ambilData() async {
//     // LINK JSON SAMA PERSIS DENGAN VIDEO #12
//     http.Response hasil = await http.get(
//         Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//         headers: {"Accept": "application/json"});

//     this.setState(() {
//       dataJSON = json.decode(hasil.body);
//     });
//   }

//   @override
//   void initState() {
//     this.ambilData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("List Data JSON"),
//       ),
//       body: dataJSON == null 
//         ? Center(child: CircularProgressIndicator()) 
//         : ListView.builder(
//             itemCount: dataJSON!.length,
//             itemBuilder: (context, i) {
//               return Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: Card(
//                   child: Container(
//                     padding: EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           dataJSON![i]['title'],
//                           style: TextStyle(fontSize: 20.0, color: Colors.blue),
//                         ),
//                         Text(dataJSON![i]['body'])
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//     );
//   }
// }

// // ====================================================================
// // TUTORIAL #13 - INPUT TEXT, ALERT DIALOG & SNACKBAR
// // ====================================================================
// class HalInput extends StatefulWidget {
//   @override
//   _HalInputState createState() => _HalInputState();
// }

// class _HalInputState extends State<HalInput> {
//   String teks = "";

//   TextEditingController controllerInput = TextEditingController();
//   TextEditingController controllerAlert = TextEditingController();
//   TextEditingController controllerSnackbar = TextEditingController();

//   void _alertDialog(String str) {
//     if (str.isEmpty) return;
//     AlertDialog alertDialog = AlertDialog(
//       content: Text(
//         str,
//         style: TextStyle(fontSize: 20.0),
//       ),
//       actions: <Widget>[
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//           child: Text("OK", style: TextStyle(color: Colors.white)),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         )
//       ],
//     );

//     showDialog(context: context, builder: (context) => alertDialog);
//   }

//   void _snackbar(String str) {
//     if (str.isEmpty) return;

//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(
//         str,
//         style: TextStyle(fontSize: 20.0),
//       ),
//       duration: Duration(seconds: 3),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("INPUT TEXT, ALERT DIALOG & SNACKBAR"),
//         backgroundColor: Colors.purple,
//       ),
//       body: SingleChildScrollView( 
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: controllerInput,
//                 decoration: InputDecoration(hintText: "Tulis di sini"),
//                 onSubmitted: (String str) {
//                   setState(() {
//                     teks = str + '\n' + teks;
//                     controllerInput.text = "";
//                   });
//                 },
//               ),
//               Text(
//                 teks,
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               TextField(
//                 controller: controllerAlert,
//                 decoration: InputDecoration(hintText: "Tulis untuk Alert..."),
//                 onSubmitted: (String str) {
//                   _alertDialog(str);
//                   controllerAlert.text = "";
//                 },
//               ),
//               TextField(
//                 controller: controllerSnackbar,
//                 decoration: InputDecoration(hintText: "Tulis untuk Snackbar..."),
//                 onSubmitted: (String str) {
//                   _snackbar(str);
//                   controllerSnackbar.text = "";
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: "Flutter CRUD & Form IDR Corner",
    debugShowCheckedModeBanner: false,
    home: MenuUtama(), // Memanggil menu gabungan
  ));
}

// ====================================================================
// MENU PENGHUBUNG APLIKASI
// ====================================================================
class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Tutorial IDR Corner"),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.format_align_justify, color: Colors.blue),
            title: Text("Tutorial #17 - Membuat FORM"),
            subtitle: Text("TextField, Radio, Dropdown"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FormTutorial()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.storage, color: Colors.red),
            title: Text("Tutorial CRUD - PhpMyAdmin"),
            subtitle: Text("Read, Add, Edit, Delete Data"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CrudHome()));
            },
          ),
        ],
      ),
    );
  }
}

// ====================================================================
// TUTORIAL #17 - MEMBUAT FORM (Formulir)
// ====================================================================
class FormTutorial extends StatefulWidget {
  @override
  _FormTutorialState createState() => _FormTutorialState();
}

class _FormTutorialState extends State<FormTutorial> {
  String _jk = "";
  List<String> agama = ["Islam", "Kristen", "Katolik", "Hindu", "Budha"];
  String _agama = "Islam";

  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerMoto = TextEditingController();

  void pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimdata() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Moto Hidup : ${controllerMoto.text}"),
            Text("Jenis Kelamin : $_jk"),
            Text("Agama : $_agama"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  controller: controllerMoto,
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: "Moto hidup",
                      labelText: "Moto hidup",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                RadioListTile(
                  value: "Laki-laki",
                  title: Text("Laki-laki"),
                  groupValue: _jk,
                  onChanged: (String? value) {
                    pilihJk(value!);
                  },
                  activeColor: Colors.red,
                  subtitle: Text("Pilih ini jika anda laki-laki"),
                ),
                RadioListTile(
                  value: "Perempuan",
                  title: Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String? value) {
                    pilihJk(value!);
                  },
                  activeColor: Colors.red,
                  subtitle: Text("Pilih ini jika anda perempuan"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Agama  ",
                      style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    ),
                    DropdownButton(
                      onChanged: (String? value) {
                        pilihAgama(value!);
                      },
                      value: _agama,
                      items: agama.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                ElevatedButton(
                  child: Text("KIRIM"),
                  onPressed: () {
                    kirimdata();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


// ====================================================================
// TUTORIAL CRUD PART 1 (READ) - HOME
// ====================================================================
class CrudHome extends StatefulWidget {
  @override
  _CrudHomeState createState() => _CrudHomeState();
}

class _CrudHomeState extends State<CrudHome> {
  // IP 10.0.2.2 digunakan untuk Emulator Android Studio ke Localhost XAMPP
  Future<List> getData() async {
    final response = await http.get(Uri.parse("http://10.0.2.2/my_store/getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Store"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => AddData(),
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(list: snapshot.data!)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => Detail(list: list, index: i),
              ),
            ),
            child: Card(
              child: ListTile(
                title: Text(list[i]['item_name']),
                leading: Icon(Icons.widgets),
                subtitle: Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ====================================================================
// TUTORIAL CRUD PART 1, 3, & 4 (DETAIL, EDIT, & DELETE BUTTON)
// ====================================================================
class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({required this.list, required this.index});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // Fungsi Delete dari Video Part 4
  void deleteData() {
    var url = "http://10.0.2.2/my_store/deleteData.php";
    http.post(Uri.parse(url), body: {
      'id': widget.list[widget.index]['id']
    });
  }

  // Fungsi Confirm Dialog dari Video Part 4
  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Are you sure want to delete '${widget.list[widget.index]['item_name']}'?"),
      actions: <Widget>[
        ElevatedButton(
          child: Text("OK DELETE!", style: TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            deleteData();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => CrudHome(),
              ),
            );
          },
        ),
        ElevatedButton(
          child: Text("CANCEL", style: TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.list[widget.index]['item_name']}")),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(top: 30.0)),
                Text(widget.list[widget.index]['item_name'], style: TextStyle(fontSize: 20.0)),
                Text("Code : ${widget.list[widget.index]['item_code']}", style: TextStyle(fontSize: 18.0)),
                Text("Price : ${widget.list[widget.index]['price']}", style: TextStyle(fontSize: 18.0)),
                Text("Stock : ${widget.list[widget.index]['stock']}", style: TextStyle(fontSize: 18.0)),
                Padding(padding: const EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("EDIT"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => EditData(list: widget.list, index: widget.index),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Spasi antar tombol
                    ElevatedButton(
                      child: Text("DELETE"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ====================================================================
// TUTORIAL CRUD PART 2 (ADD DATA)
// ====================================================================
class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  void addData() {
    var url = "http://10.0.2.2/my_store/adddata.php";
    http.post(Uri.parse(url), body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADD DATA")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(hintText: "Item Code", labelText: "Item Code"),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(hintText: "Item Name", labelText: "Item Name"),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration: InputDecoration(hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: controllerStock,
                  decoration: InputDecoration(hintText: "Stock", labelText: "Stock"),
                ),
                Padding(padding: const EdgeInsets.all(10.0)),
                ElevatedButton(
                  child: Text("ADD DATA"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    addData();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => CrudHome(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ====================================================================
// TUTORIAL CRUD PART 3 (EDIT DATA)
// ====================================================================
class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;

  void editData() {
    var url = "http://10.0.2.2/my_store/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'], // ID dari database
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  void initState() {
    // Memasukkan data awal yang ingin di edit ke Textfield
    controllerCode = TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName = TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice = TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock = TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EDIT DATA")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(hintText: "Item Code", labelText: "Item Code"),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(hintText: "Item Name", labelText: "Item Name"),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration: InputDecoration(hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: controllerStock,
                  decoration: InputDecoration(hintText: "Stock", labelText: "Stock"),
                ),
                Padding(padding: const EdgeInsets.all(10.0)),
                ElevatedButton(
                  child: Text("EDIT DATA"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    editData();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => CrudHome(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}