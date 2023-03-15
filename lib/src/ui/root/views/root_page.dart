import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaho_coding_challenge/src/data/model/user_response.dart';
import 'package:yaho_coding_challenge/src/gen/assets.gen.dart';
import 'package:yaho_coding_challenge/src/ui/root/providers/root_provider.dart';

class RootPage extends StatefulHookConsumerWidget {
  const RootPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  bool girdViewSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final type = ref.watch(viewTypeInRootProvider);
    final rootState = ref.watch(rootStateProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 10,
                alignment: Alignment.center,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withAlpha(180),
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  border: Border.all(color: theme.dividerColor),
                ),
              ),
              const SizedBox(width: 5),
              const Expanded(
                child: Text(
                  'USER',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                ActionIconButtonWidget(
                  icon: Assets.svg.feather.list,
                  isActive: type == ViewType.list,
                  onTap: () => ref.read(viewTypeInRootProvider.notifier).state =
                      ViewType.list,
                ),
                const SizedBox(width: 10),
                ActionIconButtonWidget(
                  icon: Assets.svg.feather.grid,
                  isActive: type == ViewType.gird,
                  onTap: () => ref.read(viewTypeInRootProvider.notifier).state =
                      ViewType.gird,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return ref.refresh(rootStateProvider.notifier).fetch();
              },
              child: Consumer(
                builder: (context, ref, child) {
                  switch (type) {
                    case ViewType.list:
                      return const _ListViewDataWidget();
                    case ViewType.gird:
                      return const _GirdViewDataWidget();
                  }
                },
              ),
            ),
          ),
          rootState.maybeWhen(
            loadMore: (users, response) {
              return const Padding(
                padding: EdgeInsets.all(10),
                child: Center(child: CircularProgressIndicator()),
              );
            },
            orElse: Container.new,
          ),
        ],
      ),
    );
  }
}

class ActionIconButtonWidget extends StatelessWidget {
  const ActionIconButtonWidget({
    required this.icon,
    super.key,
    this.isActive = false,
    this.onTap,
  });

  final bool isActive;

  final SvgGenImage icon;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? theme.colorScheme.primary
              : theme.colorScheme.primary.withAlpha(18),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withAlpha(180),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: icon.svg(
          colorFilter: ColorFilter.mode(
            isActive ? Colors.white : theme.colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class _ListViewDataWidget extends ConsumerStatefulWidget {
  const _ListViewDataWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ListViewDataWidgetState();
}

class __ListViewDataWidgetState extends ConsumerState<_ListViewDataWidget> {
  late ScrollController listViewSC;

  @override
  void initState() {
    super.initState();
    listViewSC = ScrollController()
      ..addListener(() {
        final maxScroll = listViewSC.position.maxScrollExtent;
        final currentScroll = listViewSC.position.pixels;
        if (currentScroll >= maxScroll * .75) {
          ref.read(rootStateProvider.notifier).loadMore();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final rootState = ref.watch(rootStateProvider);
    return rootState.when(
      data: (users, response) {
        return ListView.builder(
          controller: listViewSC,
          itemCount: users.length,
          itemBuilder: (context, index) {
            return _SingleUserListViewWidget(user: users[index]);
          },
        );
      },
      error: (error) {
        return Center(
          child: Text('$error'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      loadMore: (users, response) {
        return ListView.builder(
          controller: listViewSC,
          itemCount: users.length,
          itemBuilder: (context, index) {
            return _SingleUserListViewWidget(user: users[index]);
          },
        );
      },
    );
  }
}

class _SingleUserListViewWidget extends StatelessWidget {
  const _SingleUserListViewWidget({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: CachedNetworkImage(
                imageUrl: user.avatar ?? '',
                height: 72,
                width: 72,
                errorWidget: (context, url, error) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.redAccent.withAlpha(18),
                    child: Assets.svg.feather.xCircle.svg(
                      height: 72,
                      width: 72,
                      colorFilter: ColorFilter.mode(
                        Colors.redAccent.withAlpha(100),
                        BlendMode.srcIn,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.firstName ?? 'Unknowns',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.25,
                    ),
                  ),
                  Text(
                    user.email ?? 'Unknowns',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GirdViewDataWidget extends ConsumerStatefulWidget {
  const _GirdViewDataWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __GirdViewDataWidgetState();
}

class __GirdViewDataWidgetState extends ConsumerState<_GirdViewDataWidget> {
  late ScrollController gridViewSC;

  @override
  void initState() {
    super.initState();
    gridViewSC = ScrollController()
      ..addListener(() {
        final maxScroll = gridViewSC.position.maxScrollExtent;
        final currentScroll = gridViewSC.position.pixels;
        if (currentScroll >= maxScroll * .75) {
          ref.read(rootStateProvider.notifier).loadMore();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final rootState = ref.watch(rootStateProvider);
    return rootState.when(
      data: (users, response) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: GridView.builder(
            controller: gridViewSC,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: users.length,
            physics: const ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  _findAspectRatio(MediaQuery.of(context).size.width),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return _SingleUserGirdViewWidget(user: users[index]);
            },
          ),
        );
      },
      error: (error) {
        return Center(
          child: Text('$error'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      loadMore: (users, response) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: GridView.builder(
            controller: gridViewSC,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: users.length,
            physics: const ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  _findAspectRatio(MediaQuery.of(context).size.width),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return _SingleUserGirdViewWidget(user: users[index]);
            },
          ),
        );
      },
    );
  }

  double _findAspectRatio(double width) {
    return (width / 2 - 24) / ((width / 2 - 24) + 74);
  }
}

class _SingleUserGirdViewWidget extends StatelessWidget {
  const _SingleUserGirdViewWidget({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;
    return InkWell(
      onTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: user.avatar ?? '',
                  width: width,
                  height: width,
                  fit: BoxFit.fitWidth,
                  errorWidget: (context, url, error) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.redAccent.withAlpha(18),
                      child: Assets.svg.feather.xCircle.svg(
                        width: width,
                        colorFilter: ColorFilter.mode(
                          Colors.redAccent.withAlpha(100),
                          BlendMode.srcIn,
                        ),
                        height: width,
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    user.firstName ?? 'Unknowns',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.25,
                    ),
                  ),
                  Text(
                    user.email ?? 'Unknowns',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
