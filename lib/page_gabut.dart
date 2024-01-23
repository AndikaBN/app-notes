// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_gabut_page.dart';

class TestLogic extends StatefulWidget {
  const TestLogic({Key? key}) : super(key: key);

  @override
  State<TestLogic> createState() => _TestLogicState();
}

class _TestLogicState extends State<TestLogic> {
  final judul = TextEditingController();
  final deskripsi = TextEditingController();
  List<List<String>> catatan = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0,
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemCount: catatan.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailGabutPage(
                        judul: catatan[index][0],
                        deskripsi: catatan[index][1],
                      ),
                    ),
                  );
                },
                child: Expanded(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            catatan[index][0],
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            catatan[index][1],
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Info'),
                                        content: const SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text('Beneran mau di hapus?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              catatan.removeAt(index);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Ok",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 24.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit Catatan Anda"),
                                        content: SizedBox(
                                          width: double.maxFinite,
                                          child: ListView(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0, horizontal: 10),
                                            shrinkWrap: true,
                                            children: [
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              TextFormField(
                                                controller: judul,
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "judul",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              TextFormField(
                                                controller: deskripsi,
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "deskripsi",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              List<String> editCatatan = [
                                                judul.text,
                                                deskripsi.text
                                              ];
                                              catatan[index] =
                                                  editCatatan.toList();
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Save"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  const Center(child: Text("Masukkan Catatan Anda")),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: judul,
                    decoration: const InputDecoration(
                      labelText: "Judul",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    maxLines: 8,
                    controller: deskripsi,
                    decoration: const InputDecoration(
                        labelText: "Deskripsi",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.solid))),
                  ),
                  Container(
                    height: 72,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        List<String> catatanBaru = [judul.text, deskripsi.text];
                        catatan.add(catatanBaru.toList());
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
