part of '../_pages.dart';

class ShoppingListsPage extends StatelessWidget {
  ShoppingListsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: title,
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add new Shopping list"),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        const ModalAddNewShoppingList(),
                  ),
                ),
              ),
              BlocBuilder<ShoppingListBloc, ShoppingListState>(
                builder: (context, state) {
                  if (state is ShoppingListLoadSuccess) {
                    return SizedBox(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CollectionList(
                              id: '',
                              isShopingList: true,
                              title: state.list[index].name,
                              listProduct: state.list[index].products,
                              link: ShoppingListDetailsPage(
                                title: state.list[index].name,
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 20,
                            thickness: 1,
                          );
                        },
                      ),
                    );
                  }else{
                    return const Text("Is Empty");
                  }
                },
              ),
            ])));
  }
}
