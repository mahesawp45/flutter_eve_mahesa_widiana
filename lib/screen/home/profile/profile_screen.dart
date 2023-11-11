// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eve_test/resources/app_string.dart';
import 'package:eve_test/screen/home/profile/controller/profile_controller.dart';
import 'package:eve_test/widget/button/menu_button.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final ProfileController c = Get.put(ProfileController());

    logout() {
      Get.defaultDialog(
        title: "Sure?",
        content: const SizedBox(),
        actions: [
          TextButton(
            onPressed: () async {
              await controller.signOut();
            },
            child: const Text("Yes"),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.graphic_eq,
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 50,
        title: const Text(
          AppString.profile,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          MenuButton(
            icon: Icons.settings,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          MenuButton(
            icon: Icons.more_vert,
            onTap: logout,
          ),
          const SizedBox(width: 18),
        ],
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              ProfileImage(imageUrl: "${c.user.photoURL}"),
              const SizedBox(height: 24),
              ProfileName(name: c.user.displayName ?? "-"),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ObjectiveItem(
                    label: AppString.fundraising,
                    value: 12,
                  ),
                  const SizedBox(width: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                    ),
                    child: const ObjectiveItem(
                      label: AppString.followers,
                      value: 487,
                    ),
                  ),
                  const SizedBox(width: 24),
                  const ObjectiveItem(
                    label: AppString.following,
                    value: 126,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.grey.shade200,
                      height: 2,
                    ),
                    const SizedBox(height: 24),
                    const WalletCard(),
                    const SizedBox(height: 24),
                    ProfileAbout(about: c.about),
                    const SizedBox(height: 24),
                    ProfileInterest(interest: c.interest),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInterest extends StatelessWidget {
  const ProfileInterest({
    Key? key,
    required this.interest,
  }) : super(key: key);

  final List<String> interest;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Widget> generateInterestChips() {
      List<Widget> chips = [];
      for (var element in interest) {
        chips.add(Chip(
          label: Text(
            element,
            style: const TextStyle(color: Colors.green),
          ),
          side: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ));
      }
      return chips;
    }

    return Column(
      children: [
        Row(
          children: [
            const Text(
              AppString.interest,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.green,
                size: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          width: width,
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: generateInterestChips(),
          ),
        ),
      ],
    );
  }
}

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({
    Key? key,
    required this.about,
  }) : super(key: key);

  final String about;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppString.about,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(about)
      ],
    );
  }
}

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.1),
            radius: 24,
            child: const Icon(
              Icons.wallet,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$349",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                AppString.myWallet,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          MaterialButton(
            minWidth: 100,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.green,
                width: 2,
              ),
            ),
            child: const Text(
              AppString.topUp,
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ObjectiveItem extends StatelessWidget {
  const ObjectiveItem({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(label),
      ],
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CircleAvatar(
            radius: 54,
            child: Image.network(
              imageUrl,
              scale: 0.5,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.edit,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
