import 'dart:developer';
import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:image_picker/image_picker.dart';
import './fake_data.dart';
import './styles.dart';
import './models.dart';
import 'custom_rect_tween.dart';
import 'hero_dialog_route.dart';

class FormHome extends StatefulWidget {
  const FormHome({Key? key}) : super(key: key);

  @override
  State<FormHome> createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  File? image;
  // File? gallryImage ;
  Future pickImageFromCam() async {
    try {
      final imagefromCamera =
          ImagePicker().pickImage(source: ImageSource.camera);

      if (imagefromCamera == null) return;

      final imageTemproray = File(image!.path);
      setState(() {
        image = imageTemproray;
      });
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  Future pickImageFromGallrey() async {
    try {
      final imagefromGallery =
          ImagePicker().pickImage(source: ImageSource.gallery);

      if (imagefromGallery == null) return;

      final imageTemproray = File(image!.path);
      setState(() {
        image = imageTemproray;
      });
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderWidget(arrow: true),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 8),
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                child: _TodoListContent(
                  todos: fakeData,
                ),
              ),
              image != null
                  ? Image.file(
                      image!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                      height: 150,
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: HawkFabMenu(
        icon: AnimatedIcons.add_event,
        fabColor: Colors.yellow,
        iconColor: Colors.green,
        items: [
          HawkFabMenuItem(
            label: 'Menu 1',
            ontap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu 1 selected')),
              );
            },
            icon: const Icon(Icons.home),
            color: Colors.red,
            labelColor: Colors.blue,
          ),
          HawkFabMenuItem(
            label: 'Menu 2',
            ontap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu 2 selected')),
              );
            },
            icon: const Icon(Icons.comment),
            labelColor: Colors.white,
            labelBackgroundColor: Colors.blue,
          ),
          HawkFabMenuItem(
            label: 'Menu 3 (default)',
            ontap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu 3 selected')),
              );
            },
            icon: const Icon(Icons.add_a_photo),
          ),
        ],
        body: const Center(
          child: Text('Center of the screen'),
        ),
      ),
    );
  }
}

/// {@template todo_list_content}
/// List of [Todo]s.
/// {@endtemplate}
class _TodoListContent extends StatelessWidget {
  const _TodoListContent({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final _todo = todos[index];
        return _TodoCard(todo: _todo);
      },
    );
  }
}

/// {@template todo_card}
/// Card that display a [Todo]'s content.
///
/// On tap it opens a [HeroDialogRoute] with [_TodoPopupCard] as the content.
/// {@endtemplate}
class _TodoCard extends StatelessWidget {
  /// {@macro todo_card}
  const _TodoCard({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) => Center(
              child: _TodoPopupCard(todo: todo),
            ),
          ),
        );
      },
      child: Hero(
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin, end: end);
        },
        tag: todo.id,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Material(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _TodoTitle(title: todo.description),
                  const SizedBox(
                    height: 8,
                  ),
                  if (todo.items != null) ...[
                    const Divider(),
                    _TodoItemsBox(items: todo.items!),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// {@template todo_title}
/// Title of a [Todo].
/// {@endtemplate}
class _TodoTitle extends StatelessWidget {
  /// {@macro todo_title}
  const _TodoTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: 'hanimation'),
    );
  }
}

/// {@template todo_popup_card}
/// Popup card to expand the content of a [Todo] card.
///
/// Activated from [_TodoCard].
/// {@endtemplate}
class _TodoPopupCard extends StatelessWidget {
  const _TodoPopupCard({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: todo.id,
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin, end: end);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          //   color: AppColors.cardColor,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TodoTitle(title: todo.description),
                    const SizedBox(
                      height: 8,
                    ),
                    if (todo.items != null) ...[
                      const Divider(),
                      _TodoItemsBox(items: todo.items!),
                    ],
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextField(
                        maxLines: 8,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: 'Write a note...',
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// {@template todo_items_box}
/// Box containing the list of a [Todo]'s items.
///
/// These items can be checked.
/// {@endtemplate}
class _TodoItemsBox extends StatelessWidget {
  /// {@macro todo_items_box}
  const _TodoItemsBox({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in items) _TodoItemTile(item: item),
      ],
    );
  }
}

/// {@template todo_item_template}
/// An individual [Todo] [Item] with its [Checkbox].
/// {@endtemplate}
class _TodoItemTile extends StatefulWidget {
  /// {@macro todo_item_template}
  const _TodoItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  _TodoItemTileState createState() => _TodoItemTileState();
}

class _TodoItemTileState extends State<_TodoItemTile> {
  void _onChanged(bool? val) {
    setState(() {
      widget.item.completed = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: _onChanged,
        value: widget.item.completed,
      ),
      title: Text(widget.item.description),
    );
  }
}
