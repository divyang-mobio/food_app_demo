import 'package:flutter/material.dart';
import '../model/data_model.dart';
import '../model/navigation_model.dart';
import '../resources/resources.dart';

class AllFoodScreen extends StatefulWidget {
  const AllFoodScreen({Key? key}) : super(key: key);

  @override
  State<AllFoodScreen> createState() => _AllFoodScreenState();
}

class _AllFoodScreenState extends State<AllFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: ListView.builder(
            itemCount: saladData.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/detail',
                      arguments: NavigationModel(
                          dataModel: saladData[index], isSalad: true)),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 400,
                    width: 270,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 380,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(34),
                                color:
                                    const Color.fromARGB(255, 255, 238, 238)),
                            child: const SizedBox(),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            height: 181,
                            width: 181,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 250, 207, 217)),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: -50,
                          child: Container(
                            height: 184,
                            width: 276,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(saladData[index].image))),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          right: 20,
                          child: Text(
                            '\$${saladData[index].price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 235, 85, 123),
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 201,
                          left: 40,
                          child: SizedBox(
                            width: 210,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    saladData[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    saladData[index].description,
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      )
    ]);
  }
}

Padding gridView({required List<DataModel> data}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/detail',
              arguments:
                  NavigationModel(dataModel: data[index], isSalad: false)),
          child: Card(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(data[index].image, fit: BoxFit.fill),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index].title,
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text("\$${data[index].price}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(data[index].description,
                          overflow: TextOverflow.ellipsis, maxLines: 5),
                    ]),
              )
            ]),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 16,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    ),
  );
}
