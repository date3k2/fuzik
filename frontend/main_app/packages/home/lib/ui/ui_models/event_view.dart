part of '../ui_models.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  //TODO: Ghép model Event
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        //Layer 0: Event background
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                fit: BoxFit.cover,
            ),
          ),
        ),
        //Layer 1: Details
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            color: Colors.white54
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("dd-mm-yyyy hh-mm AM", style: Theme.of(context).textTheme.bodySmall,),
              Text("Tên event", style: Theme.of(context).textTheme.titleMedium,),
              Text("0/50000", style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        )
      ],
    ));
  }
}
