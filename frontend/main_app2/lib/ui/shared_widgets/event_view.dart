import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/concert.dart';
import 'package:intl/intl.dart';

class ConcertView extends StatelessWidget {
  final Concert? concert;

  const ConcertView({super.key, this.concert});

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
              color: Colors.white54),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat("dd-MM-yyyy hh-mma").format(concert!.startAt!),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.background),
              ),
              Text(
                concert!.name!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.background),
              ),
              Text(
                "Số vé còn lại: ${concert?.numberOfTickets ?? 0}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.background),
              )
            ],
          ),
        )
      ],
    ));
  }
}
