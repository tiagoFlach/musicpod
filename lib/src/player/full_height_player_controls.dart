import 'package:flutter/material.dart';

import '../../common.dart';
import '../../data.dart';
import 'play_button.dart';
import 'repeat_button.dart';
import 'shuffle_button.dart';

class FullHeightPlayerControls extends StatelessWidget {
  const FullHeightPlayerControls({
    super.key,
    this.audio,
    required this.playPrevious,
    required this.playNext,
    required this.active,
  });

  final Audio? audio;
  final Future<void> Function() playPrevious;
  final Future<void> Function() playNext;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const spacing = 7.0;

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: [
        ShuffleButton(active: active),
        IconButton(
          onPressed: !active ? null : () => playPrevious(),
          icon: Icon(Iconz().skipBackward),
        ),
        CircleAvatar(
          backgroundColor: theme.colorScheme.inverseSurface,
          child: PlayButton(
            iconColor: theme.colorScheme.onInverseSurface,
            active: active,
          ),
        ),
        IconButton(
          onPressed: !active ? null : () => playNext(),
          icon: Icon(Iconz().skipForward),
        ),
        RepeatButton(active: active),
      ],
    );
  }
}
