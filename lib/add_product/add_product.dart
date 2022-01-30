import 'package:admin_app/add_product/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddProductPage extends StatelessWidget {
  final String api = "https://jsonplaceholder.typicode.com/posts";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountPriceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: idController,
                validator: (String? input) {
                  if (input != null && input.isNotEmpty) {
                    return null;
                  }
                  return "Can not Empty";
                },
                decoration: const InputDecoration(
                  hintText: "id",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: nameController,
                validator: (String? input) {
                  if (input != null && input.isNotEmpty) {
                    return null;
                  }
                  return "Can not Empty";
                },
                decoration: const InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: priceController,
                validator: (String? input) {
                  if (input != null && input.isNotEmpty) {
                    return null;
                  }
                  return "Can not Empty";
                },
                decoration: const InputDecoration(
                  hintText: "price",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: discountPriceController,
                validator: (String? input) {
                  if (input != null && input.isNotEmpty) {
                    return null;
                  }
                  return "Can not Empty";
                },
                decoration: const InputDecoration(
                  hintText: "Discount Price",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: imageController,
                validator: (String? input) {
                  if (input != null && input.isNotEmpty) {
                    return null;
                  }
                  return "Can not Empty";
                },
                decoration: const InputDecoration(
                  hintText: "image",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Loading..."),
                        ),
                      );
                      Product product = Product(
                        id: idController.text,
                        name: nameController.text,
                        price: priceController.text,
                        discountedPrice: discountPriceController.text,
                        image: imageController.text,
                      );

                      bool isSuccess = await addProduct(product);

                      if (isSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Successfully Added"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Failed to add Product"),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> addProduct(Product product) async {
    http.Response response =
        await http.post(Uri.parse(api), body: product.toJson());

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }
}
