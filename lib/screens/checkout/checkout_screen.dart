import 'package:firebase_tutorial_one/bloc/blocs.dart';
import 'package:firebase_tutorial_one/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/typedef_functions.dart';

class ChechoutScreen extends StatelessWidget {
  const ChechoutScreen({super.key});

  static Route route() => MaterialPageRoute(
      settings: const RouteSettings(name: checkoutRouteName),
      builder: (context) => const ChechoutScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: checkoutTitle),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadedCheckoutState) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(
                        title: customerInformation,
                      ),
                      customTextField(
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckoutEvent(email: value));
                          },
                          title: 'Email'),
                      customTextField(
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckoutEvent(fullName: value));
                          },
                          title: 'Name'),
                      const SectionTitle(
                        title: deliveryInformation,
                      ),
                      customTextField(
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckoutEvent(address: value));
                          },
                          title: 'Address'),
                      customTextField(
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckoutEvent(city: value));
                          },
                          title: 'City'),
                      customTextField(
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckoutEvent(country: value));
                          },
                          title: 'Country'),
                      customTextField(
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckoutEvent(zipcode: value));
                          },
                          title: 'Zip Code'),
                      const SectionTitle(
                        title: orderSummary,
                      ),
                      const CartSummary()
                    ]);
              } else {
                return const Center(
                  child: Text(errorMessage),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomNavigationBar(routeName: checkoutRouteName),
    );
  }

  Widget customTextField(
      {required String title, required OnChangeText onChanged}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(width: 75, child: Text(title)),
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            //controller: controller,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ))
        ],
      ),
    );
  }
}
