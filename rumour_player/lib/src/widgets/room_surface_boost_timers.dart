import 'dart:math';

import 'package:backstreets_widgets/typedefs.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:time/time.dart';

/// A widget for running room surface boosts.
class RoomSurfaceBoostTimers extends ConsumerWidget {
  /// Create an instance.
  const RoomSurfaceBoostTimers({
    required this.playerId,
    required this.roomSurfaceId,
    required this.getPaused,
    required this.error,
    required this.loading,
    required this.child,
    super.key,
  });

  /// The ID of the player to work with.
  final String playerId;

  /// The ID of the room surface to get boosts for.
  final int roomSurfaceId;

  /// The function to call to check if the game is paused.
  final bool Function() getPaused;

  /// The function to call to build an error widget.
  final ErrorWidgetCallback error;

  /// The function to call to build a loading widget.
  final Widget Function() loading;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(roomSurfaceBoostsProvider(roomSurfaceId));
    return value.when(
      data: (final boosts) {
        final statsValue = ref.watch(GamePlayerStatsProvider(playerId));
        return statsValue.when(
          data: (final stats) => TickingTasks(
            tasks: boosts
                .map(
                  (final boost) => TickingTask(
                    duration: boost.interval.seconds,
                    onTick: () async {
                      if (getPaused()) {
                        return;
                      }
                      final stat = await ref.read(
                        gameStatContextProvider(boost.gameStatId).future,
                      );
                      final oldValue = stats[boost.gameStatId] ?? 0;
                      final maxStat = stat.maxValueGameStat;
                      final maxValue = (maxStat == null)
                          ? null
                          : stat.gameStat.mathematicalOperator.calculate(
                              stats[maxStat.id] ??
                                  (await ref.read(
                                    gamePlayerStatProvider(
                                      playerId,
                                      maxStat.id,
                                    ).future,
                                  )),
                              stat.gameStat.maxValueMultiplier,
                            );
                      final possibleValue = oldValue + boost.boost;
                      final newValue = min(
                        maxValue ?? possibleValue,
                        possibleValue,
                      );
                      if (maxValue != null && oldValue >= maxValue) {
                        // Do nothing.
                        return;
                      } else if (maxValue != null && newValue >= maxValue) {
                        // The stat is now maxed.
                        await ref.maybePlaySoundReference(
                          soundReference:
                              await projectContext.maybeGetSoundReference(
                            boost.maxedOutSoundId,
                          ),
                          destroy: true,
                        );
                      } else {
                        // It's just gone up.
                        await ref.maybePlaySoundReference(
                          soundReference:
                              await projectContext.maybeGetSoundReference(
                            boost.boostSoundId,
                          ),
                          destroy: true,
                        );
                      }
                      stats[boost.gameStatId] = newValue;
                      ref.invalidate(gamePlayerStatsProvider);
                    },
                  ),
                )
                .toList(),
            child: child,
          ),
          error: error,
          loading: loading,
        );
      },
      error: error,
      loading: loading,
    );
  }
}
