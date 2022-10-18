// dart async library we will refer to when setting up real time updates
import 'dart:async';

// flutter and ui libraries
import 'package:flutter/material.dart';

// amplify packages we will need to use
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:onekgp_app/bloc/amplify/amplify.bloc.dart';
import 'package:onekgp_app/bloc/auth/auth.bloc.dart';
import 'package:onekgp_app/services/amplify.services.dart';
import 'package:onekgp_app/services/navigator.services.dart';
import 'package:onekgp_app/services/route.services.dart';
import 'package:onekgp_app/ui/modules/auth/login.dart';
import 'package:onekgp_app/ui/modules/travel/travel_feed.dart';
import 'package:onekgp_app/ui/themes/light_theme.dart';
import 'package:onekgp_app/services/theme.services.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';
import 'package:onekgp_app/ui/utils/text_style.dart';

// amplify configuration and models that should have been generated for you
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

final ThemeNotifier themeNotifier = ThemeNotifier();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AmplifyBloc>(
        create: (_) => AmplifyBloc()..add(Configure()),
        lazy: false,
      ),
      BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    themeNotifier.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    themeNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      authenticatorBuilder: (context, state) {
        SizeConfig().init(context);
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // app logo
                        SizedBox(height: 20.toHeight),
                        Image.asset(
                          "assets/app_logo.png",
                          width: SizeConfig.sw * 0.27,
                        ),
                        SizedBox(height: 20.toHeight),
                        Divider(
                          color: Color.fromARGB(255, 190, 189, 189),
                          thickness: .4.toHeight,
                          indent: 30,
                          endIndent: 30,
                        ),
                        SizedBox(height: 20.toHeight),
                        Text(
                          "Sign in to your account",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 20.toHeight),
                        // prebuilt sign in form from amplify_authenticator package
                        SignInForm(),
                      ],
                    ),
                  ),
                ),
              ),
              // custom button to take the user to sign up
              persistentFooterButtons: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signUp,
                      ),
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            );

          case AuthenticatorStep.signUp:
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(18),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // app logo
                        SizedBox(height: 20.toHeight),
                        Image.asset(
                          "assets/app_logo.png",
                          width: SizeConfig.sw * 0.27,
                        ),
                        SizedBox(height: 20.toHeight),
                        Divider(
                          color: Color.fromARGB(255, 190, 189, 189),
                          thickness: .4.toHeight,
                          indent: 30,
                          endIndent: 30,
                        ),
                        SizedBox(height: 20.toHeight),
                        Text(
                          "Create your account",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 20.toHeight),
                        // prebuilt sign in form from amplify_authenticator package
                        SignUpForm(),
                      ],
                    ),
                  ),
                ),
              ),
              // custom button to take the user to sign up
              persistentFooterButtons: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signIn,
                      ),
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            );

          case AuthenticatorStep.confirmSignUp:
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(18),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // app logo
                        SizedBox(height: 20.toHeight),
                        Image.asset(
                          "assets/app_logo.png",
                          width: SizeConfig.sw * 0.27,
                        ),
                        SizedBox(height: 20.toHeight),
                        Divider(
                          color: Color.fromARGB(255, 190, 189, 189),
                          thickness: .4.toHeight,
                          indent: 30,
                          endIndent: 30,
                        ),
                        SizedBox(height: 20.toHeight),
                        Text(
                          "Create your account",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 20.toHeight),
                        // prebuilt sign in form from amplify_authenticator package
                        ConfirmSignUpForm(),
                      ],
                    ),
                  ),
                ),
              ),
              // custom button to take the user to sign up
              persistentFooterButtons: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Change email ?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signIn,
                      ),
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            );

          default:
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(18),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // app logo
                        SizedBox(height: 20.toHeight),
                        Image.asset(
                          "assets/app_logo.png",
                          width: SizeConfig.sw * 0.27,
                        ),
                        SizedBox(height: 20.toHeight),
                        Divider(
                          color: Color.fromARGB(255, 190, 189, 189),
                          thickness: .4.toHeight,
                          indent: 30,
                          endIndent: 30,
                        ),
                        SizedBox(height: 20.toHeight),
                        Text(
                          "Sign in to your account",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 20.toHeight),
                        // prebuilt sign in form from amplify_authenticator package
                        SignInForm(),
                      ],
                    ),
                  ),
                ),
              ),
              // custom button to take the user to sign up
              persistentFooterButtons: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signUp,
                      ),
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            );
        }
      },
      child: MaterialApp(
        title: 'Amplified Todo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeNotifier.themeMode,
        onGenerateRoute: RouteServices.routeHandler,
        navigatorKey: NavigatorServices.navigatorKey,
        builder: Authenticator.builder(),
        home: const TravelFeed(),
      ),
    );
  }
}

// class TodosPage extends StatefulWidget {
//   const TodosPage({Key? key}) : super(key: key);

//   @override
//   State<TodosPage> createState() => _TodosPageState();
// }

// class _TodosPageState extends State<TodosPage> {
//   bool _isLoading = true;

//   List<Todo> _todos = [];

//   late StreamSubscription<QuerySnapshot<Todo>> _subscription;

//   @override
//   void initState() {
//     // to be filled in a later step

//     _initializeApp();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     // to be filled in a later step
//     super.dispose();
//   }

//   Future<void> _initializeApp() async {
//     _subscription = Amplify.DataStore.observeQuery(Todo.classType).listen((QuerySnapshot<Todo> snapshot) {
//       setState(() {
//         if (_isLoading) _isLoading = false;
//         _todos = snapshot.items;
//       });
//     });

//     // after configuring Amplify, update loading ui state to loaded state
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Todo List'),
//       ),
//       body: _isLoading ? Center(child: CircularProgressIndicator()) : TodosList(todos: _todos),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const TravelFeed()),
//           );
//         },
//         tooltip: 'Add Todo',
//         label: Row(
//           children: const [Icon(Icons.add), Text('Add todo')],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

// class TodosList extends StatelessWidget {
//   const TodosList({
//     required this.todos,
//     Key? key,
//   }) : super(key: key);

//   final List<Todo> todos;

//   @override
//   Widget build(BuildContext context) {
//     return todos.isNotEmpty
//         ? ListView(padding: const EdgeInsets.all(8), children: todos.map((todo) => TodoItem(todo: todo)).toList())
//         : const Center(
//             child: Text('Tap button below to add a todo!'),
//           );
//   }
// }

// class TodoItem extends StatelessWidget {
//   const TodoItem({
//     required this.todo,
//     Key? key,
//   }) : super(key: key);

//   final double iconSize = 24.0;
//   final Todo todo;

//   void _deleteTodo(BuildContext context) async {
//     try {
//       // to delete data from DataStore, we pass the model instance to
//       // Amplify.DataStore.delete()
//       await Amplify.DataStore.delete(todo);
//     } catch (e) {
//       print('An error occurred while deleting Todo: $e');
//     }
//   }

//   Future<void> _toggleIsComplete() async {
//     final updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted);
//     try {
//       // to update data in DataStore, we again pass an instance of a model to
//       // Amplify.DataStore.save()
//       await Amplify.DataStore.save(updatedTodo);
//     } catch (e) {
//       print('An error occurred while saving Todo: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           _toggleIsComplete();
//         },
//         onLongPress: () {
//           _deleteTodo(context);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     todo.name,
//                     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(todo.description ?? 'No description'),
//                 ],
//               ),
//             ),
//             Icon(todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank, size: iconSize),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// class AddTodoForm extends StatefulWidget {
//   const AddTodoForm({Key? key}) : super(key: key);

//   @override
//   State<AddTodoForm> createState() => _AddTodoFormState();
// }

// class _AddTodoFormState extends State<AddTodoForm> {
//   final _nameController = TextEditingController();
//   final _descriptionController = TextEditingController();

//   Future<void> _saveTodo() async {
//     // to be filled in a later step
//     // get the current text field contents
//     final name = _nameController.text;
//     final description = _descriptionController.text;

//     // create a new Todo from the form values
//     // `isComplete` is also required, but should start false in a new Todo
//     final newTodo = Todo(
//       name: name,
//       description: description.isNotEmpty ? description : null,
//       isCompleted: false,
//     );

//     try {
//       // to write data to DataStore, we simply pass an instance of a model to
//       // Amplify.DataStore.save()
//       await Amplify.DataStore.save(newTodo);

//       // after creating a new Todo, close the form
//       Navigator.of(context).pop();
//     } catch (e) {
//       print('An error occurred while saving Todo: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Todo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(filled: true, labelText: 'Name'),
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: const InputDecoration(filled: true, labelText: 'Description'),
//               ),
//               ElevatedButton(
//                 onPressed: _saveTodo,
//                 child: const Text('Save'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
