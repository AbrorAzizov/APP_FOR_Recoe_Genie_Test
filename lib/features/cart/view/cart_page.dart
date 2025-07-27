import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/features/cart/cubit/cart_cubit.dart';
import '../../home/domain/entities/post.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cart"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<CartCubit, List<Post>>(
        builder: (context, state) {
          final total = context.read<CartCubit>().totalPrice;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final post = state[index];

                    return ListTile(
                      title: Text(post.postText),
                      subtitle: Text("\$${post.price.toString()}"),
                      leading: post.imageUrl != null
                          ? Image.network(
                              post.imageUrl!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : null,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<CartCubit>().removePost(post.id);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${total.toString()}',
                  style: const TextStyle(
                    fontSize: 20,

                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
