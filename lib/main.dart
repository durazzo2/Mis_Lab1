import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lab 1'),
    );
  }
}

class DetailView extends StatelessWidget {
  final Clothing item;

  const DetailView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          item.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Image.network(item.image),
        const SizedBox(height: 10),
        Text(
          item.price,
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
        const SizedBox(height: 10),
        Text(
          item.description,
          style: const TextStyle(fontSize: 16),
        ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Clothing {
  String name;
  String description;
  String image;
  String price;
  
  Clothing(this.name, this.description, this.image, this.price);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Clothing> listClothes = [
    Clothing("T-shirt", "A comfortable cotton T-shirt", "https://shop.mango.com/assets/rcs/pics/static/T7/fotos/outfit/S/77970596_99-99999999_01.jpg?imwidth=1920&imdensity=1&ts=1722441163295 1920w", "17\$"),
    Clothing("Jeans", "A stylish denim jeans", "https://shop.mango.com/assets/rcs/pics/static/T7/fotos/S/77020618_TM.jpg?imwidth=1920&imdensity=1&ts=1728903853512 1920w", "25\$"),
    Clothing("Sweater", "A warm and stylish  sweater", "https://shop.mango.com/assets/rcs/pics/static/T7/fotos/S/77047923_56.jpg?imwidth=1920&imdensity=1&ts=1727093043577 1920w", "15\$"),
    Clothing("Jacket", "A stylish jacket to keep you warm", "https://shop.mango.com/assets/rcs/pics/static/T7/fotos/S/77097910_92.jpg?imwidth=1920&imdensity=1&ts=1722328457279 1920w", "40\$"),
    Clothing("Shorts", "Shorts for summer", "https://shop.mango.com/assets/rcs/pics/static/T7/fotos/S/77090585_07.jpg?imwidth=1920&imdensity=1&ts=1716456646967 1920w", "13\$"),
  ];
  
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('223131'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listClothes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listClothes[index].name),
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailView(item: listClothes[index]),
                    ),
                    );
                  },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
