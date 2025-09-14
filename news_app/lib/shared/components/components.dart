import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/cubit2/cubit.dart';
import '../../modules/news_app/web_view/web_view_screen.dart';
import '../styles/colors.dart';

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.teal,
  bool isUpperCase = true,
  double radius = 0.0,
  required VoidCallback function,
  required String text,
}) =>
Container(
width: width,
height: 40.0,
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius),
  ),
child: MaterialButton(
onPressed: function,
child: Text(
isUpperCase? text.toUpperCase() : text,
style: TextStyle(
color: Colors.white,
),
),
),
);

Widget defultTextButton({
  required VoidCallback? function,
  required String text
})
=> TextButton(onPressed: function,
    child: Text(text.toUpperCase(),
    )
);

Widget defultTextField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  bool isPssword= false,
  Function(String)? onChange,
  VoidCallback? onTap,
  Function(String)? onSubmit,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? onpress,
}) =>
TextFormField(
  controller: controller,
keyboardType: type,
obscureText: isPssword,
onFieldSubmitted: onSubmit,
onChanged: onChange,
onTap: onTap,
validator: validate,
decoration: InputDecoration(
  counterStyle: TextStyle(
    color: defultColor,
  ),
labelText: label,
labelStyle: TextStyle(
  color: defultColor,
),
prefixIcon: Icon(
    prefix,
  color: defultColor,
),
suffixIcon: suffix != null ? IconButton(
    icon: Icon(
  suffix,
      color: defultColor,),
    onPressed: onpress,
): null,
border: OutlineInputBorder(),
),

);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget buildArticalItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);


Widget generalListBuilder({
  required List<dynamic> item,
  required Widget Function(dynamic item, BuildContext context) itemBuilder,
  required BuildContext context,
  required bool isMedication,
   bool isSearch = false,
   }) =>
    ConditionalBuilder(
      condition:  item.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => itemBuilder(item[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: item.length,
      ),
      fallback: (context) =>
          isSearch ? Container() : const Center(child: CircularProgressIndicator()),
    );

Widget articalBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticalItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,),
  fallback: (context) => isSearch? Container() : Center(child: CircularProgressIndicator()),
);



void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(
    context, widget,) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(
            builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
    );

