import 'package:flutter/material.dart';
import '../model/data_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.dataModel, required this.isSalad})
      : super(key: key);

  final DataModel dataModel;
  final bool isSalad;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 207, 217),
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Row(
                  children: [
                    Text(
                      "Add to bag",
                      style: Theme.of(context).textTheme.button,
                    ),
                    const SizedBox(width: 30),
                    const Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              Stack(
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 225, 38, 85),
                    onPressed: () {},
                    child: const Icon(Icons.shopping_bag_outlined,
                        color: Colors.black),
                  ),
                  const Positioned(
                    bottom: 5,
                    right: 5,
                    child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 225, 38, 85)),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
              ]),
              widget.isSalad
                  ? Center(
                      child: CircleAvatar(
                        radius: 140,
                        backgroundColor:
                            const Color.fromARGB(255, 243, 218, 201),
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor:
                              const Color.fromARGB(255, 243, 218, 201),
                          foregroundImage: AssetImage(widget.dataModel.image),
                        ),
                      ),
                    )
                  : Image.asset(widget.dataModel.image,
                      height: 280,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  widget.dataModel.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  '\$${widget.dataModel.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 222, 61, 104)),
                ),
              ]),
              const SizedBox(height: 20),
              Text(widget.dataModel.description),
              Text(widget.dataModel.description),
              Text(widget.dataModel.description),
              Text(widget.dataModel.description),
              Text(widget.dataModel.description),
            ]),
          ),
        ),
      ),
    );
  }
}
